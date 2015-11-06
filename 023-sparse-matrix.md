Our data is bigger than anticipated when the number of section by
section comparisons is stored as a non-sparse matrix. So we are going to
read in the section comparisons and convert them to a sparse matrix.

    library("Matrix")
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

Create a look up data frame of index positions

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

And write it to a file.

    writeMM(m, file = "out/sparse-section-similarity-matrix.MM")

    ## NULL

    write_csv(scores, "out/section-scores.csv")

Now use affinity propagation clustering to create clusters.

    library("apcluster")
    clu <- apcluster(s = m,
                     # maxits = 10e3, convits = 1e3,
                     q = 0,
                     seed = 2828, 
                     includeSim = TRUE,
                     # details = TRUE
                     )

    ## Warning in apcluster.dgTMatrix(s = s, ...): algorithm did not converge; turn on details
    ## and call plot() to monitor net similarity. Consider
    ## increasing 'maxits' and 'convits', and, if oscillations occur
    ## also increasing damping factor 'lam'.

Get the top clusters

    clusters <- clu@clusters 
    names(clusters) <- names(clu@exemplars)
    clusters <- lapply(clusters, function(x) names(x))
    min_cluster_length <- 5
    selected_clusters <- clusters[sapply(clusters, length) >= min_cluster_length]
    head(selected_clusters)

    ## $`AK1900-000200`
    ## [1] "AK1900-000200" "DC1857-004610" "OR1854-007560" "OR1862-000200"
    ## [5] "UT1859-004270" "WA1873-000290"
    ## 
    ## $`AK1900-000350`
    ## [1] "AK1900-000350" "OR1854-000250" "OR1862-000360" "TN1858-000840"
    ## [5] "UT1859-000600"
    ## 
    ## $`AK1900-001810`
    ## [1] "AK1900-001810" "OR1854-001970" "OR1862-002070" "TX1855-004210"
    ## [5] "UT1859-001320" "WA1855-001910" "WA1873-002070"
    ## 
    ## $`AK1900-002820`
    ##  [1] "AK1900-002820" "AZ1865-002020" "CA1851-002190" "CA1858-002160"
    ##  [5] "CO1877-002310" "ID1864-002180" "NV1861-002150" "NV1869-002200"
    ##  [9] "OR1862-003070" "UT1870-002140" "WA1855-002480"
    ## 
    ## $`AK1900-004680`
    ## [1] "AK1900-004680" "CA1851-003170" "MN1851-004460" "MN1859-004430"
    ## [5] "NY1850-010410" "NY1853-010240" "OR1854-005090" "OR1862-005300"
    ## 
    ## $`AR1868-000100`
    ## [1] "AR1868-000100" "AR1874-000180" "IA1859-000100" "KY1851-000120"
    ## [5] "KY1854-000120"

    clusters_df <- selected_clusters %>% 
      seq_along() %>% 
      lapply(function(i) {
        exemplar <- names(selected_clusters)[i]
        doc <- selected_clusters[[i]]
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

    ## Source: local data frame [27,098 x 8]
    ## 
    ##    cluster_id      exemplar exemplar_year      earliest earliest_date
    ##         (int)         (chr)         (int)         (chr)         (int)
    ## 1        2425 NY1850-007780          1850 NY1848-002480          1848
    ## 2        2425 NY1850-007780          1850 NY1848-002480          1848
    ## 3        2425 NY1850-007780          1850 NY1848-002480          1848
    ## 4        2425 NY1850-007780          1850 NY1848-002480          1848
    ## 5        2425 NY1850-007780          1850 NY1848-002480          1848
    ## 6        2425 NY1850-007780          1850 NY1848-002480          1848
    ## 7        2425 NY1850-007780          1850 NY1848-002480          1848
    ## 8        2425 NY1850-007780          1850 NY1848-002480          1848
    ## 9        2425 NY1850-007780          1850 NY1848-002480          1848
    ## 10       2425 NY1850-007780          1850 NY1848-002480          1848
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
is the number of documents in the cluster. Only clusters with 5
documents or more are included.

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
    ## 1  CA1858  2336
    ## 2  CA1851  2092
    ## 3  DT1862  1564
    ## 4  NY1850  1546
    ## 5  CA1872  1461
    ## 6  MN1859  1045
    ## 7  OH1853   935
    ## 8  KS1859   907
    ## 9  NE1859   906
    ## 10 NV1861   899
    ## 11 KS1868   845
    ## 12 NY1849   680
    ## 13 NY1851   599
    ## 14 FL1870   589
    ## 15 AZ1865   583
    ## 16 OK1893   526
    ## 17 ND1877   514
    ## 18 NV1869   471
    ## 19 NC1868   464
    ## 20 CA1868   433

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
    ## 1  CA1851  4637
    ## 2  OH1853  4386
    ## 3  NY1850  3892
    ## 4  NY1848  3597
    ## 5  KY1851  2033
    ## 6  NY1849  1397
    ## 7  CA1872  1151
    ## 8  WI1849   752
    ## 9  IN1852   561
    ## 10 IA1851   494
    ## 11 OR1854   442
    ## 12 CA1858   374
    ## 13 MA1836   374
    ## 14 NY1851   350
    ## 15 CA1850   323
    ## 16 IN1843   272
    ## 17 MN1851   253
    ## 18 MO1849   238
    ## 19 CA1868   190
    ## 20 NV1861   159

Now let's write out the clusters to disk.

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
      text <- str_c(header, docs, collapse = "\n") %>% 
        str_split("\n") %>% 
        unlist()
      dir.create("clusters", showWarnings = FALSE)
      filename <- str_c("clusters/", exemplar, ".txt")
      message("Writing ", filename)
      writeLines(text, filename)
      df
    }

    clusters_df %>% 
      group_by(cluster_id) %>% 
      do(write_cluster(.))

    ## Source: local data frame [27,098 x 8]
    ## Groups: cluster_id [3184]
    ## 
    ##    cluster_id      exemplar exemplar_year      earliest earliest_date
    ##         (int)         (chr)         (int)         (chr)         (int)
    ## 1           1 AK1900-000200          1900 OR1854-007560          1854
    ## 2           1 AK1900-000200          1900 OR1854-007560          1854
    ## 3           1 AK1900-000200          1900 OR1854-007560          1854
    ## 4           1 AK1900-000200          1900 OR1854-007560          1854
    ## 5           1 AK1900-000200          1900 OR1854-007560          1854
    ## 6           1 AK1900-000200          1900 OR1854-007560          1854
    ## 7           2 AK1900-000350          1900 OR1854-000250          1854
    ## 8           2 AK1900-000350          1900 OR1854-000250          1854
    ## 9           2 AK1900-000350          1900 OR1854-000250          1854
    ## 10          2 AK1900-000350          1900 OR1854-000250          1854
    ## ..        ...           ...           ...           ...           ...
    ## Variables not shown: doc (chr), doc_date (int), n (int)
