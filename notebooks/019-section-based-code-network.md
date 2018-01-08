Earlier we made a network graph of all codes using ratio of matches in a
code to code comparison. Now lets make a network graph based on sections
borrowed.

    library("readr")
    library("igraph")
    library("dplyr")
    library("textreuse")
    library("stringr")
    source("R/best-section-matches.R")
    source("R/summarize-borrowings.R")
    source("R/extract-date.R")
    source("R/extract_code_names.R")

Read the data.

    borrowings <- read_csv("out/scores-all-sections-pairs.csv") %>% 
      rename(section_a = a, section_b = b) %>% 
      mutate(code_a = extract_code_names(section_a),
             code_b = extract_code_names(section_b),
             year_a = extract_date(code_a),
             year_b = extract_date(code_b))
    borrowings

    ## Source: local data frame [274,359 x 8]
    ## 
    ##          section_a       section_b similarity dissimilarity code_a code_b
    ##              (chr)           (chr)      (dbl)         (dbl)  (chr)  (chr)
    ## 1  AK1900-00000010 AR1868-00000060  0.2162160      0.783784 AK1900 AR1868
    ## 2  AK1900-00000010 AR1874-00001960  0.3750000      0.625000 AK1900 AR1874
    ## 3  AK1900-00000010 AZ1865-00000020  0.2131150      0.786885 AK1900 AZ1865
    ## 4  AK1900-00000010 CA1850-00000030  0.1791040      0.820896 AK1900 CA1850
    ## 5  AK1900-00000010 CA1858-00000030  0.2131150      0.786885 AK1900 CA1858
    ## 6  AK1900-00000010 CA1872-00002310  0.1967210      0.803279 AK1900 CA1872
    ## 7  AK1900-00000010 CO1877-00000010  0.1730770      0.826923 AK1900 CO1877
    ## 8  AK1900-00000010 DC1857-00000970  0.3918920      0.608108 AK1900 DC1857
    ## 9  AK1900-00000010 DT1868-00000280  0.2761900      0.723810 AK1900 DT1868
    ## 10 AK1900-00000010 DT1887-00000640  0.0900474      0.909953 AK1900 DT1887
    ## ..             ...             ...        ...           ...    ...    ...
    ## Variables not shown: year_a (int), year_b (int)

All the codes in our corpus. Which codes aren't included?

    codes <- c(borrowings$code_a, borrowings$code_b) %>% unique
    all_codes <- Sys.glob("legal-codes/*") %>% 
      str_replace("legal-codes/", "") %>% 
      str_replace("\\.txt", "") %>% 
      extract_code_names()
    setdiff(all_codes, codes)

    ## [1] "BI1859"       "FR1806"       "GB1854"       "GB1873"      
    ## [5] "GB1875"       "KY1854"       "LA1825french" "LC1867french"
    ## [9] "VA1841"

All the codes that aren't included are plausibly not connected to the
corpus.

Calculate section matches and summarize them for a single code.

    CA1851 <- best_section_matches("CA1851", scores = borrowings, threshold = 0.2)
    CA1851

    ## Source: local data frame [740 x 6]
    ## 
    ##       all_sections match_code   match_section similarity dissimilarity
    ##              (chr)      (chr)           (chr)      (dbl)         (dbl)
    ## 1  CA1851-00000010     CA1850 CA1850-00000010   0.285714      0.714286
    ## 2  CA1851-00000020     NY1849 NY1849-00000630   0.333333      0.666667
    ## 3  CA1851-00000030         NA              NA         NA            NA
    ## 4  CA1851-00000040     CA1850 CA1850-00000040   1.000000      0.000000
    ## 5  CA1851-00000050     CA1850 CA1850-00000070   1.000000      0.000000
    ## 6  CA1851-00000060     CA1850 CA1850-00000090   0.619048      0.380952
    ## 7  CA1851-00000070     CA1850 CA1850-00000100   0.815385      0.184615
    ## 8  CA1851-00000080     NY1850 NY1850-00007050   0.500000      0.500000
    ## 9  CA1851-00000090     CA1850 CA1850-00000120   0.782609      0.217391
    ## 10 CA1851-00000100     NY1850 NY1850-00007070   0.461538      0.538462
    ## ..             ...        ...             ...        ...           ...
    ## Variables not shown: original_code (chr)

    summarize_borrowings(CA1851)

    ## Source: local data frame [9 x 5]
    ## 
    ##   original_code match_code mean_similarity     n percentage_sections
    ##           (chr)      (chr)           (dbl) (int)               (dbl)
    ## 1        CA1851     NY1850       0.5041585   313         0.422972973
    ## 2            NA         NA              NA   311         0.420270270
    ## 3        CA1851     CA1850       0.5151458    64         0.086486486
    ## 4        CA1851     NY1849       0.5439915    15         0.020270270
    ## 5        CA1851     NY1851       0.4553339    11         0.014864865
    ## 6        CA1851     KY1851       0.4601335    10         0.013513514
    ## 7        CA1851     MN1851       0.5440051    10         0.013513514
    ## 8        CA1851     MO1849       0.5832048     4         0.005405405
    ## 9        CA1851     NY1848       0.4083335     2         0.002702703

Apply that to all the codes.

    section_pct <- codes %>% 
      lapply(best_section_matches, scores = borrowings, threshold = 0.2) %>% 
      lapply(summarize_borrowings) %>% 
      bind_rows()
    section_pct

    ## Source: local data frame [1,867 x 5]
    ## 
    ##    original_code match_code mean_similarity     n percentage_sections
    ##            (chr)      (chr)           (dbl) (int)               (dbl)
    ## 1         AK1900     OR1862       0.4819014   619         0.454478708
    ## 2             NA         NA              NA   387         0.284140969
    ## 3         AK1900     NY1850       0.5103166    57         0.041850220
    ## 4         AK1900     OR1854       0.4870605    43         0.031571219
    ## 5         AK1900     UT1859       0.5906020    24         0.017621145
    ## 6         AK1900     CA1872       0.5189314    20         0.014684288
    ## 7         AK1900     SC1870       0.5760811    16         0.011747430
    ## 8         AK1900     AZ1865       0.5747826    14         0.010279001
    ## 9         AK1900     CA1851       0.5704651    14         0.010279001
    ## 10        AK1900     MT1895       0.4458453    13         0.009544787
    ## ..           ...        ...             ...   ...                 ...

Do some filtering and munge into an edge list.

    edges <- section_pct %>% 
      filter(percentage_sections >= 0.05,
             !is.na(match_code)) %>% 
      select(original_code, match_code, weight = percentage_sections)
    edges

    ## Source: local data frame [186 x 3]
    ## 
    ##    original_code match_code     weight
    ##            (chr)      (chr)      (dbl)
    ## 1         AK1900     OR1862 0.45447871
    ## 2         AR1868     KY1851 0.43566775
    ## 3         AR1874     AR1868 0.30789133
    ## 4         AR1874     KY1851 0.16946960
    ## 5         AZ1865     CA1851 0.32951289
    ## 6         AZ1865     CA1858 0.30276982
    ## 7         AZ1865     NV1861 0.13849093
    ## 8         AZ1865     MT1865 0.06112703
    ## 9         AZ1887     CA1872 0.36757301
    ## 10        CA1850     NY1850 0.23893805
    ## ..           ...        ...        ...

Turn that into a graph.

    g <- graph.data.frame(edges, directed = TRUE)
    set.seed(4821)
    l <- layout.fruchterman.reingold(g, weights = E(g)$weight)
    par(mar = c(0,0,1,0))
    plot(g, edge.width = E(g)$weight * 8, layout = l,
         edge.arrow.size = 0.15, vertex.size = 5)
    title("Codes of Civil Procedure by percentage of sections")

<img src="019-section-based-code-network_files/figure-markdown_strict/unnamed-chunk-7-1.png" title="" alt="" width="672" />
