Our data is bigger than anticipated when the number of section by
section comparisons is stored as a non-sparse matrix. So we are going to
read in the section comparisons and convert them to a sparse matrix.

    library("Matrix")
    library("apcluster")
    library("dplyr")
    library("readr")
    library("textreuse")
    source("R/extract-date.R")
    source("R/extract_code_names.R")
    cache_lsh <- "cache/lsh-sections.rda"
    load(file = cache_lsh)
    cache_corpus <- "cache/corpus-sections-minash-n120-seed623.rda"
    load(file = cache_corpus)

Filter the sections down to a meaningful value.

    scores <- section_scores %>% 
      filter(score >= 0.1)
    scores

    ## Source: local data frame [301,204 x 3]
    ## 
    ##                a             b     score
    ##            (chr)         (chr)     (dbl)
    ## 1  AK1900-000010 AR1868-000060 0.2133333
    ## 2  AK1900-000010 AR1874-000090 0.3684211
    ## 3  AK1900-000010 AZ1865-000020 0.2096774
    ## 4  AK1900-000010 CA1850-000030 0.1764706
    ## 5  AK1900-000010 CA1851-000030 0.1194030
    ## 6  AK1900-000010 CA1858-000030 0.2096774
    ## 7  AK1900-000010 CA1868-000030 0.1194030
    ## 8  AK1900-000010 CA1872-002310 0.1935484
    ## 9  AK1900-000010 CO1877-000010 0.1730769
    ## 10 AK1900-000010 DC1857-000980 0.4054054
    ## ..           ...           ...       ...

    nrow(scores)

    ## [1] 301204

Get the sections involved:

    section_names <- lsh_subset(scores)
    head(section_names, 10)

    ##  [1] "AK1900-000010" "AK1900-000020" "AK1900-000050" "AK1900-000060"
    ##  [5] "AK1900-000070" "AK1900-000080" "AK1900-000090" "AK1900-000100"
    ##  [9] "AK1900-000110" "AK1900-000120"

    length(section_names)

    ## [1] 57647

Create a look up data frame of matrix index positions.

    lookup <- data_frame(section_names, index = 1:length(section_names))
    lookup

    ## Source: local data frame [57,647 x 2]
    ## 
    ##    section_names index
    ##            (chr) (int)
    ## 1  AK1900-000010     1
    ## 2  AK1900-000020     2
    ## 3  AK1900-000050     3
    ## 4  AK1900-000060     4
    ## 5  AK1900-000070     5
    ## 6  AK1900-000080     6
    ## 7  AK1900-000090     7
    ## 8  AK1900-000100     8
    ## 9  AK1900-000110     9
    ## 10 AK1900-000120    10
    ## ..           ...   ...

    scores <- scores %>% 
      left_join(lookup, by = c("a" = "section_names")) %>% 
      left_join(lookup, by = c("b" = "section_names")) 
    scores

    ## Source: local data frame [301,204 x 5]
    ## 
    ##                a             b     score index.x index.y
    ##            (chr)         (chr)     (dbl)   (int)   (int)
    ## 1  AK1900-000010 AR1868-000060 0.2133333       1     989
    ## 2  AK1900-000010 AR1874-000090 0.3684211       1    1802
    ## 3  AK1900-000010 AZ1865-000020 0.2096774       1    2150
    ## 4  AK1900-000010 CA1850-000030 0.1764706       1    3373
    ## 5  AK1900-000010 CA1851-000030 0.1194030       1    3599
    ## 6  AK1900-000010 CA1858-000030 0.2096774       1    4275
    ## 7  AK1900-000010 CA1868-000030 0.1194030       1    4961
    ## 8  AK1900-000010 CA1872-002310 0.1935484       1    5838
    ## 9  AK1900-000010 CO1877-000010 0.1730769       1    7425
    ## 10 AK1900-000010 DC1857-000980 0.4054054       1    8297
    ## ..           ...           ...       ...     ...     ...

Create the sparse matrix.

    n <- length(section_names)
    m <- sparseMatrix(i = scores$index.x, j = scores$index.y, x = scores$score,
                      dims = c(n, n), symmetric = TRUE)
    colnames(m) <- section_names
    rownames(m) <- section_names

Now use affinity propagation clustering to create clusters.

    cluster_cache <- "cache/clusters.rds"
    if (!file.exists(cluster_cache)) {
      timing <- system.time(
        clu <- apcluster(s = m,
                         maxits = 100e3, convits = 10e3,
                         q = 0,
                         lam = 0.975,
                         seed = 42325, 
                         includeSim = TRUE,
                         )
      )
      require("RPushbullet")
      pbPost(title = "Clustering finished",
             body = paste0("Finished in ", timing[["elapsed"]], "."))
      saveRDS(clu, cluster_cache)
    } else {
      clu <- readRDS(cluster_cache)
    }

Get the clusters in a slightly easier format to work with.

    clusters <- clu@clusters 
    names(clusters) <- names(clu@exemplars)
    clusters <- lapply(clusters, names)

Now the problem is that some clusters have been inadequately joined
together. We will compute simiarities on the examplars. If any of them
have a high Jaccard similarity, we will join those clusters together.

    exemplars_corpus <- sections[names(clusters)]
    exemplars_scores <- exemplars_corpus %>% 
      lsh(bands = 60) %>% 
      lsh_candidates() %>% 
      lsh_compare(exemplars_corpus, jaccard_similarity) %>% 
      arrange(desc(score))

Here is a box plot of those scores:

    boxplot(exemplars_scores$score)

<img src="023-sparse-matrix_files/figure-markdown_strict/unnamed-chunk-9-1.png" title="" alt="" width="672" />

What is a good minimum match? Looking at the sections, `0.2` is clearly
a match, while `0.1` is clearly not. An important observation is that
the exemplars for the blood quantum sections have a Jaccard similarity
of `0.15`. We will use that as the threshold.

    join_threshold <- 0.15
    exemplars_scores <- exemplars_scores %>% 
      filter(score >= 0.15)

Now a function to iterate over that data frame. If the Jaccard score is
sufficiently high, combine the two clusters.

    join_clusters <- function(row) {
      exs <- c(row$a, row$b)
      minval <- which.min(extract_date(exs))
      exemplar <- exs[minval]
      duplicate <- exs[ifelse(minval == 1, 2, 1)]
      clusters[[exemplar]] <<- c(clusters[[exemplar]], clusters[[duplicate]])
      clusters[[duplicate]] <<- NULL
      dplyr::as_data_frame(row)
    }

    exemplars_scores %>% 
      rowwise() %>% 
      do(join_clusters(.))

    ## Source: local data frame [3,542 x 3]
    ## Groups: <by row>
    ## 
    ##                a             b     score
    ##            (chr)         (chr)     (dbl)
    ## 1  WI1849-013180 WI1858-009170 0.9722222
    ## 2  NY1850-017850 NY1853-017490 0.9705882
    ## 3  NY1850-015850 NY1853-015510 0.9655172
    ## 4  NY1850-015390 NY1853-015050 0.9615385
    ## 5  KS1868-003150 OK1893-003660 0.9600000
    ## 6  NY1850-015440 NY1853-015100 0.9600000
    ## 7  NY1850-001210 NY1853-001050 0.9523810
    ## 8  NY1850-002660 NY1853-002490 0.9523810
    ## 9  KS1868-008380 OK1893-009680 0.9512195
    ## 10 IN1852-000340 OK1891-000480 0.9444444
    ## ..           ...           ...       ...

Now convert the clusters into a data frame.

    clusters_df <- clusters %>% 
      seq_along() %>% 
      lapply(function(i) {
        exemplar <- names(clusters)[i]
        doc <- clusters[[i]]
        data_frame(exemplar, doc, cluster_id = i)
      }) %>% 
      bind_rows() %>% 
      mutate(exemplar_year = extract_date(exemplar),
             doc_date = extract_date(doc)) %>% 
      group_by(cluster_id) %>% 
      mutate(earliest_date = min(doc_date),
             earliest = doc[which.min(doc_date)]) %>% 
      select(cluster_id, exemplar, exemplar_year, earliest, earliest_date,
             doc, doc_date) %>% 
      arrange(doc_date) %>% 
      mutate(n = n()) %>% 
      ungroup() %>% 
      arrange(desc(n))
    clusters_df

    ## Source: local data frame [55,109 x 8]
    ## 
    ##    cluster_id      exemplar exemplar_year      earliest earliest_date
    ##         (int)         (chr)         (int)         (chr)         (int)
    ## 1        4189 KY1854-001630          1854 NY1848-001930          1848
    ## 2        4189 KY1854-001630          1854 NY1848-001930          1848
    ## 3        4189 KY1854-001630          1854 NY1848-001930          1848
    ## 4        4189 KY1854-001630          1854 NY1848-001930          1848
    ## 5        4189 KY1854-001630          1854 NY1848-001930          1848
    ## 6        4189 KY1854-001630          1854 NY1848-001930          1848
    ## 7        4189 KY1854-001630          1854 NY1848-001930          1848
    ## 8        4189 KY1854-001630          1854 NY1848-001930          1848
    ## 9        4189 KY1854-001630          1854 NY1848-001930          1848
    ## 10       4189 KY1854-001630          1854 NY1848-001930          1848
    ## ..        ...           ...           ...           ...           ...
    ## Variables not shown: doc (chr), doc_date (int), n (int)

That data frame has the following properties. It is sorted so that the
clusters with the most documents appear first. Within each cluster,
documents appear chronologically. Each cluster contains three columns
for documents (with another three columns corresponding to years). One
column is the "examplar" document identified by the affinity propagation
clustering. The next is the earliest document in the cluster. If there
are multiple documents from the earliest year, then only one is listed.
The third is a list of all the documents in the cluster. The column `n`
is the number of documents in the cluster. All clusters regardless of
length have been included.

Write that to disk:

    write_csv(clusters_df, "out/clusters.csv")

Some summary statistics about the borrowings.

The codes which most frequently provide exemplars, weighted by the size
of the clusters for which they are exemplars.

    exemplars_summary <- clusters_df$exemplar %>% 
      extract_code_names() %>% 
      table() %>% 
      as.data.frame() %>% as_data_frame() %>% 
      rename(., code = `.`) %>% 
      arrange(desc(Freq))
    write_csv(exemplars_summary, "out/clusters-exemplars-summary.csv")
    exemplars_summary %>% head(20)

    ## Source: local data frame [20 x 2]
    ## 
    ##      code  Freq
    ##    (fctr) (int)
    ## 1  NY1850  6205
    ## 2  CA1851  2966
    ## 3  CA1858  2098
    ## 4  CA1872  1889
    ## 5  MN1859  1759
    ## 6  KY1851  1534
    ## 7  NY1849  1508
    ## 8  NY1876  1501
    ## 9  NY1853  1398
    ## 10 DT1862  1308
    ## 11 WV1868  1258
    ## 12 IN1852  1239
    ## 13 OH1853  1222
    ## 14 IA1851  1161
    ## 15 WI1849  1124
    ## 16 MA1836  1096
    ## 17 NY1879   958
    ## 18 NE1859   944
    ## 19 KS1859   939
    ## 20 NY1851   920

The codes which most frequently provide the earliest documents in the
clusters, weighted by the size of the clusters for which they are the
earliest.

    earliest_summary <- clusters_df$earliest %>% 
      extract_code_names() %>% 
      table() %>% 
      as.data.frame() %>% as_data_frame() %>% 
      rename(., code = `.`) %>% 
      arrange(desc(Freq)) 
    write_csv(earliest_summary, "out/clusters-earliest-summary.csv")
    earliest_summary %>% head(20)

    ## Source: local data frame [20 x 2]
    ## 
    ##      code  Freq
    ##    (fctr) (int)
    ## 1  NY1850  8805
    ## 2  NY1848  7623
    ## 3  KY1851  3955
    ## 4  OH1853  3653
    ## 5  WI1849  2793
    ## 6  CA1851  2644
    ## 7  CA1872  2427
    ## 8  NY1876  2406
    ## 9  IA1851  2223
    ## 10 NY1849  2190
    ## 11 MA1836  1930
    ## 12 IN1852  1579
    ## 13 VA1860   950
    ## 14 IN1843   851
    ## 15 OR1862   678
    ## 16 MO1835   563
    ## 17 OH1879   478
    ## 18 FL1847   464
    ## 19 WV1868   438
    ## 20 OR1854   421

Now let's write out the clusters with a certain minimum number of
documents to disk.

    dir.create("clusters", showWarnings = FALSE)

    get_printable_code <- function(doc_id) {
      require("stringr")
      content <- str_wrap(content(sections[[doc_id]]))
      str_c(doc_id, content, "-----------------------------------------------\n\n", 
            sep = "\n\n")
    }

    get_cluster_header <- function(exemplar, earliest, n, cluster_id) {
      require("stringr")
      str_c("Exemplar: ", exemplar, "\n",
            "Earliest: ", earliest, "\n",
            "Documents in cluster: ", n, "\n",
            "Cluster ID: ", cluster_id, "\n",
            "\n",
            "-----------------------------------------------\n\n")
    }

    write_cluster <- function(df) {
      require("stringr")
      exemplar <- unique(df$exemplar)
      earliest <- unique(df$earliest)
      n <- unique(df$n)
      cluster_id <- unique(df$cluster_id)
      header <- get_cluster_header(exemplar, earliest, n, cluster_id)
      docs <- df$doc %>% sapply(get_printable_code) 
      text <- str_c(docs, collapse = "\n") %>% 
        str_c(header, .) %>% 
        str_split("\n") %>% 
        unlist()
      filename <- str_c("clusters/", earliest, ".txt")
      message("Writing ", filename)
      writeLines(text, filename)
      df
    }

    clusters_df %>% 
      filter(n >= 5) %>% 
      group_by(cluster_id) %>% 
      do(write_cluster(.))

    ## Source: local data frame [31,593 x 8]
    ## Groups: cluster_id [2693]
    ## 
    ##    cluster_id      exemplar exemplar_year      earliest earliest_date
    ##         (int)         (chr)         (int)         (chr)         (int)
    ## 1         239 AR1868-000100          1868 KY1851-000120          1851
    ## 2         239 AR1868-000100          1868 KY1851-000120          1851
    ## 3         239 AR1868-000100          1868 KY1851-000120          1851
    ## 4         239 AR1868-000100          1868 KY1851-000120          1851
    ## 5         239 AR1868-000100          1868 KY1851-000120          1851
    ## 6         240 AR1868-000130          1868 KY1851-000150          1851
    ## 7         240 AR1868-000130          1868 KY1851-000150          1851
    ## 8         240 AR1868-000130          1868 KY1851-000150          1851
    ## 9         240 AR1868-000130          1868 KY1851-000150          1851
    ## 10        240 AR1868-000130          1868 KY1851-000150          1851
    ## ..        ...           ...           ...           ...           ...
    ## Variables not shown: doc (chr), doc_date (int), n (int)
