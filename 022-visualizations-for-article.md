    library("readr")
    library("igraph")
    library("dplyr")
    library("stringr")
    library("parallel")
    library("textreuse")
    source("R/best-section-matches.R")
    source("R/summarize-borrowings.R")
    source("R/extract-date.R")
    source("R/extract_code_names.R")
    options("mc.cores" = 6L)

Read the data.

    cache_corpus <- "cache/corpus-sections-minash-n120-seed623.rda"
    load(file = cache_corpus)
    cache_lsh <- "cache/lsh-sections.rda"
    load(file = cache_lsh)
    borrowings <- section_scores %>% 
      rename(section_a = a, section_b = b, similarity = score) %>% 
      mutate(dissimilarity = 1 - similarity,
             code_a = extract_code_names(section_a),
             code_b = extract_code_names(section_b),
             year_a = extract_date(code_a),
             year_b = extract_date(code_b))
    codes <- c(borrowings$code_a, borrowings$code_b) %>% unique()

Calculate section matches and summarize them for a single code.

    CA1851 <- best_section_matches("CA1851", borrowings, threshold = 0.15)
    CA1851

    ## Source: local data frame [762 x 6]
    ## 
    ##     all_sections match_code match_section similarity dissimilarity
    ##            (chr)      (chr)         (chr)      (dbl)         (dbl)
    ## 1  CA1851-000010     CA1850 CA1850-000010  0.2857143    0.71428571
    ## 2  CA1851-000020     NY1849 NY1849-000870  0.3333333    0.66666667
    ## 3  CA1851-000030         NA            NA         NA            NA
    ## 4  CA1851-000040     CA1850 CA1850-000040  1.0000000    0.00000000
    ## 5  CA1851-000050     CA1850 CA1850-000070  0.9583333    0.04166667
    ## 6  CA1851-000060     CA1850 CA1850-000090  0.5652174    0.43478261
    ## 7  CA1851-000070     NY1851 NY1851-001370  0.8181818    0.18181818
    ## 8  CA1851-000080     NY1850 NY1850-006570  0.4827586    0.51724138
    ## 9  CA1851-000090     CA1850 CA1850-000120  0.7500000    0.25000000
    ## 10 CA1851-000100     NY1850 NY1850-006590  0.4285714    0.57142857
    ## ..           ...        ...           ...        ...           ...
    ## Variables not shown: original_code (chr)

    summarize_borrowings(CA1851)

    ## Source: local data frame [10 x 5]
    ## 
    ##    original_code match_code mean_similarity     n percentage_sections
    ##            (chr)      (chr)           (dbl) (int)               (dbl)
    ## 1         CA1851     NY1850       0.4651361   329         0.431758530
    ## 2             NA         NA              NA   276         0.362204724
    ## 3         CA1851     CA1850       0.4887438    56         0.073490814
    ## 4         CA1851     NY1851       0.5650909    28         0.036745407
    ## 5         CA1851     MN1851       0.4593559    23         0.030183727
    ## 6         CA1851     NY1849       0.5247201    23         0.030183727
    ## 7         CA1851     NY1848       0.4383638    14         0.018372703
    ## 8         CA1851     KY1851       0.4657729     8         0.010498688
    ## 9         CA1851     MO1849       0.5906650     3         0.003937008
    ## 10        CA1851     IA1851       0.2497914     2         0.002624672

Apply that to all the codes.

    section_pct <- codes %>% 
      mclapply(best_section_matches, scores = borrowings, threshold = 0.15)  %>% 
      mclapply(summarize_borrowings) %>% 
      bind_rows()
    section_pct

    ## Source: local data frame [2,396 x 5]
    ## 
    ##    original_code match_code mean_similarity     n percentage_sections
    ##            (chr)      (chr)           (dbl) (int)               (dbl)
    ## 1         AK1900     OR1862       0.4777537   702          0.51390922
    ## 2             NA         NA              NA   306          0.22401171
    ## 3         AK1900     NY1850       0.5537188    40          0.02928258
    ## 4         AK1900     OR1854       0.4820767    29          0.02122987
    ## 5         AK1900     UT1859       0.5858656    20          0.01464129
    ## 6         AK1900     CA1872       0.5244765    17          0.01244510
    ## 7         AK1900     MN1859       0.5513771    15          0.01098097
    ## 8         AK1900     AZ1865       0.5474089    14          0.01024890
    ## 9         AK1900     SC1870       0.5665364    14          0.01024890
    ## 10        AK1900     WA1855       0.5221759    14          0.01024890
    ## ..           ...        ...             ...   ...                 ...

Do some filtering and munge into an edge list.

    # Note that original code is a misnomer here
    edges <-
      section_pct %>% 
      mutate(original_date = extract_date(original_code),
             match_date = extract_date(match_code)) %>% 
      filter(percentage_sections >= 0.05,
             !is.na(match_code),
             original_date >= match_date) %>% 
      select(original_code, match_code, weight = percentage_sections) %>% 
      group_by(original_code) %>% 
      top_n(2, weight)
    edges

    ## Source: local data frame [132 x 3]
    ## Groups: original_code [77]
    ## 
    ##    original_code match_code    weight
    ##            (chr)      (chr)     (dbl)
    ## 1         AK1900     OR1862 0.5139092
    ## 2         AR1868     KY1854 0.3185299
    ## 3         AR1868     KY1851 0.3016845
    ## 4         AR1874     AR1868 0.3237519
    ## 5         AR1874     KY1851 0.1739788
    ## 6         AZ1865     CA1851 0.3349191
    ## 7         AZ1865     CA1858 0.3073264
    ## 8         AZ1887     CA1872 0.3716632
    ## 9         CA1850     NY1849 0.2687861
    ## 10        CA1850     NY1850 0.1416185
    ## ..           ...        ...       ...

Turn that into a graph.

    g <- graph_from_data_frame(edges, directed = TRUE) 
    nodes <- distances(g, to = "NY1850", algorithm = "unweighted") %>% as.data.frame() %>% 
      add_rownames() %>% 
      rename(name = rowname, distance = NY1850) %>% 
      mutate(color = ifelse(distance == 0, "red",
                            ifelse(distance == 1, "green",
                                   ifelse(distance == 2, "yellow", "lightblue"))))

    ## Warning in distances(g, to = "NY1850", algorithm = "unweighted"):
    ## Unweighted algorithm chosen, weights ignored

    nodes[nodes$name == "NY1848", "color"] <- "red"
    nodes[nodes$name == "NY1849", "color"] <- "red"
    nodes[nodes$name == "NY1850", "color"] <- "red"
    nodes[nodes$name == "NY1851", "color"] <- "red"
    g <- graph_from_data_frame(edges, directed = TRUE, vertices = nodes) 
    V(g)$year <- V(g)$name %>% extract_date()
    set.seed(4221)

    # g <- g %>% decompose() %>% `[[`(1)

    g <- add_layout_(g, with_graphopt(niter = 4000, spring.length = 25), normalize())

    plot_before_year <- function(x, year) {
      x_before <- induced.subgraph(x, which(V(x)$year <= year))
      n <- V(x)$name
      n_before <- V(x_before)$name
      filter <- n %in% n_before
      x_before$layout <- x_before$layout[filter, ]
      par(mar = c(0,0,1,0))
      plot(x_before, edge.width = E(x_before)$weight * 8,
           edge.arrow.size = 0.0, vertex.size = 5)
      title(paste0("Codes of Civil Procedure before ", year))
    } 

    for (i in seq(1850, 1900, 5)) {
      png(filename = paste0("out/field-code-network-ALL", i, ".png"), width = 1200,
          height = 900)
      plot_before_year(g, i)
      dev.off()
    }
