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

    ny_codes %>% 
      lapply(function(x) {
        best_section_matches(x, ny_scores, threshold = 0.15) %>% 
          summarize_borrowings()
      })

    ## [[1]]
    ## Source: local data frame [1 x 5]
    ## 
    ##   original_code match_code mean_similarity     n percentage_sections
    ##           (lgl)      (chr)           (dbl) (int)               (dbl)
    ## 1            NA         NA              NA  4362                   1
    ## 
    ## [[2]]
    ## Source: local data frame [2 x 5]
    ## 
    ##   original_code match_code mean_similarity     n percentage_sections
    ##           (chr)      (chr)           (dbl) (int)               (dbl)
    ## 1            NA         NA              NA   507         0.994117647
    ## 2        NY1848     NY1829       0.1828921     3         0.005882353
    ## 
    ## [[3]]
    ## Source: local data frame [3 x 5]
    ## 
    ##   original_code match_code mean_similarity     n percentage_sections
    ##           (chr)      (chr)           (dbl) (int)               (dbl)
    ## 1        NY1849     NY1848       0.3956700   327          0.56869565
    ## 2            NA         NA              NA   230          0.40000000
    ## 3        NY1849     NY1829       0.2872977    18          0.03130435
    ## 
    ## [[4]]
    ## Source: local data frame [4 x 5]
    ## 
    ##   original_code match_code mean_similarity     n percentage_sections
    ##           (chr)      (chr)           (dbl) (int)               (dbl)
    ## 1            NA         NA              NA  1621          0.78384913
    ## 2        NY1850     NY1849       0.4380584   255          0.12330754
    ## 3        NY1850     NY1848       0.4562437   132          0.06382979
    ## 4        NY1850     NY1829       0.2863088    60          0.02901354
    ## 
    ## [[5]]
    ## Source: local data frame [5 x 5]
    ## 
    ##   original_code match_code mean_similarity     n percentage_sections
    ##           (chr)      (chr)           (dbl) (int)               (dbl)
    ## 1        NY1851     NY1849       0.5474958   348         0.615929204
    ## 2        NY1851     NY1850       0.5436291   105         0.185840708
    ## 3        NY1851     NY1848       0.5515241    62         0.109734513
    ## 4            NA         NA              NA    48         0.084955752
    ## 5        NY1851     NY1829       0.3090657     2         0.003539823
    ## 
    ## [[6]]
    ## Source: local data frame [5 x 5]
    ## 
    ##   original_code match_code mean_similarity     n percentage_sections
    ##           (chr)      (chr)           (dbl) (int)               (dbl)
    ## 1        NY1853     NY1850       0.7303902  1732         0.890946502
    ## 2            NA         NA              NA   161         0.082818930
    ## 3        NY1853     NY1851       0.6256037    21         0.010802469
    ## 4        NY1853     NY1849       0.6804829    19         0.009773663
    ## 5        NY1853     NY1848       0.5563338    11         0.005658436
    ## 
    ## [[7]]
    ## Source: local data frame [7 x 5]
    ## 
    ##   original_code match_code mean_similarity     n percentage_sections
    ##           (chr)      (chr)           (dbl) (int)               (dbl)
    ## 1            NA         NA              NA  1495         0.910475030
    ## 2        NY1876     NY1850       0.2841172    49         0.029841657
    ## 3        NY1876     NY1853       0.3313643    33         0.020097442
    ## 4        NY1876     NY1829       0.2333062    20         0.012180268
    ## 5        NY1876     NY1851       0.2928308    17         0.010353228
    ## 6        NY1876     NY1848       0.2924307    14         0.008526188
    ## 7        NY1876     NY1849       0.3710794    14         0.008526188
    ## 
    ## [[8]]
    ## Source: local data frame [7 x 5]
    ## 
    ##   original_code match_code mean_similarity     n percentage_sections
    ##           (chr)      (chr)           (dbl) (int)               (dbl)
    ## 1        NY1879     NY1876       0.5891402  1442        0.9035087719
    ## 2            NA         NA              NA   146        0.0914786967
    ## 3        NY1879     NY1850       0.4132911     3        0.0018796992
    ## 4        NY1879     NY1851       0.5808511     2        0.0012531328
    ## 5        NY1879     NY1848       0.3617021     1        0.0006265664
    ## 6        NY1879     NY1849       0.1898734     1        0.0006265664
    ## 7        NY1879     NY1853       0.8000000     1        0.0006265664
