    library("textreuse")
    library("dplyr")
    library("readr")
    library("stringr")
    source("R/best-section-matches.R")
    source("R/summarize-borrowings.R")
    source("R/extract_code_names.R")
    source("R/extract-date.R")
    options("mc.cores" = 6L)
    h <- 120
    b <- 60
    minhash <- minhash_generator(n = h, seed = 623)
    ny_paths <- Sys.glob("legal-codes-split/NY*")

Create the corpus:

    ny_sections <- TextReuseCorpus(paths = ny_paths,
                                   tokenizer = tokenize_ngrams, n = 5,
                                   keep_tokens = FALSE,
                                   minhash_func = minhash)

    ## Warning in TextReuseCorpus(paths = ny_paths, tokenizer = tokenize_ngrams, :
    ## Skipped 309 documents that were too short. Use `skipped()` to get their
    ## IDs.

Do the LSH for New York:

    ny_buckets <- lsh(ny_sections, bands = b)
    ny_scores <- ny_buckets %>% 
      lsh_candidates() %>% 
      lsh_compare(ny_sections, jaccard_similarity) %>% 
      rename(section_a = a, section_b = b, similarity = score) %>% 
      mutate(dissimilarity = 1 - similarity,
             code_a = extract_code_names(section_a),
             code_b = extract_code_names(section_b),
             year_a = extract_date(code_a),
             year_b = extract_date(code_b))

Write out the best section matches to disk.

    ny_codes <- c(ny_scores$code_a, ny_scores$code_b) %>% unique %>% sort

    lapply(ny_codes, function(x) {
      best_section_matches(x, ny_scores, threshold = 0.15) %>% 
        write_csv(str_c("out/NY-comparisons-", x, ".csv"))
    })

    ## [[1]]
    ## [1] "out/NY-comparisons-NY1829.csv"
    ## 
    ## [[2]]
    ## [1] "out/NY-comparisons-NY1848.csv"
    ## 
    ## [[3]]
    ## [1] "out/NY-comparisons-NY1849.csv"
    ## 
    ## [[4]]
    ## [1] "out/NY-comparisons-NY1850.csv"
    ## 
    ## [[5]]
    ## [1] "out/NY-comparisons-NY1851.csv"
    ## 
    ## [[6]]
    ## [1] "out/NY-comparisons-NY1853.csv"
    ## 
    ## [[7]]
    ## [1] "out/NY-comparisons-NY1876.csv"
    ## 
    ## [[8]]
    ## [1] "out/NY-comparisons-NY1879.csv"

Summaries of matches.

    intra_code_network <- ny_codes %>% 
      lapply(function(x) {
        best_section_matches(x, ny_scores, threshold = 0.15) %>% 
          summarize_borrowings()
      }) %>% 
      bind_rows()

    library("igraph")
    g <- intra_code_network %>% 
      select(original_code, match_code, weight = percentage_sections) %>% 
      filter(!is.na(match_code)) %>%
      filter(weight >= 0.02) %>% 
      graph_from_data_frame() %>% 
      add_layout_(with_graphopt()) 
    plot(g, edge.width = E(g)$weight * 10)

<img src="024-comparison-NY_files/figure-markdown_strict/unnamed-chunk-6-1.png" title="" alt="" width="672" />
