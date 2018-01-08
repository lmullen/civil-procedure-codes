The goal for this document is to decide on the comparison measure to be
used.

We are going to use LSH to compute candidate matches, with a very low
threshold for potential matches.

    library("textreuse")
    library("dplyr")
    lsh_threshold(h = 3000, b = 1500)

    ## [1] 0.02581989

This threshold should identify most legitimate matches.

First we create the corpus, using a minhash function.

    minhash <- minhash_generator(n = 3000, seed = 34235)
    cache <- "cache/corpus-minhash-n7.rds"
    if (!file.exists(cache)) {
      corpus_shingles <- TextReuseCorpus(dir = "legal-codes", 
                                        tokenizer = tokenize_ngrams, n = 7,
                                        hash_func = minhash,
                                        keep_tokens = TRUE)
      saveRDS(corpus_shingles, cache)
    } else {
      corpus_shingles <- readRDS(cache)
    }

Now we will use minhash/LSH to identify the candidates and rehash the
relevant subset.

    buckets_shingles <- lsh(corpus_shingles, bands = 1500)
    candidates <- lsh_candidates(buckets_shingles)
    candidates_reversed <- candidates
    colnames(candidates_reversed) <- c("b", "a", "score")
    candidates_both <- bind_rows(candidates, candidates_reversed)
    candidates_subset <- lsh_subset(candidates)
    corpus_subset <- corpus_shingles[candidates_subset]
    corpus_subset <- rehash(corpus_subset, hash_string)

Now we will compute scores for the candidates. We have to do it both
ways for the `ratio_of_matches()` function since it is directional.

    scores_jaccard <- lsh_compare(candidates, corpus_subset, jaccard_similarity)
    scores_ratio <- lsh_compare(candidates_both, corpus_subset, ratio_of_matches)
    range01 <- function(x) { (x - min(x)) / (max(x) - min(x)) }
    cf_scores <-  scores_ratio %>% left_join(scores_jaccard, by = c("a", "b"))  %>% 
      rename(ratio = score.x, jaccard = score.y)  %>% 
      filter(!is.na(jaccard)) %>% 
      mutate(jaccard_scaled = range01(jaccard), 
             ratio_scaled = range01(ratio),
             diff = jaccard_scaled - ratio_scaled) %>% 
      arrange(desc(diff))
    cf_scores

    ## Source: local data frame [1,314 x 7]
    ## 
    ##         a              b       ratio     jaccard jaccard_scaled
    ##     (chr)          (chr)       (dbl)       (dbl)          (dbl)
    ## 1  OH1853 OH1853extended 0.655381722 0.643771530   0.7473757555
    ## 2  CT1879 CT1879extended 0.030178393 0.030598681   0.0346004027
    ## 3  MS1850         NC1868 0.013509615 0.012705314   0.0138004753
    ## 4  MS1850         OR1862 0.006054877 0.005626995   0.0055723692
    ## 5  MS1850 OH1853extended 0.005955943 0.005393429   0.0053008628
    ## 6  MS1850         OH1879 0.001758796 0.001468856   0.0007387903
    ## 7  MS1850         NE1866 0.004213024 0.003692617   0.0033237750
    ## 8  MS1850         OH1853 0.009154465 0.007922555   0.0082408147
    ## 9  MS1850         WI1856 0.025908752 0.023500658   0.0263493922
    ## 10 MA1851         MA1858 0.022385862 0.020112080   0.0224103803
    ## ..    ...            ...         ...         ...            ...
    ## Variables not shown: ratio_scaled (dbl), diff (dbl)

Since there are no obvious distortions to be corrected for, and since
`ratio_of_matches()` can account for texts of different length and
directionality, we will use that measure for comparing entire codes to
entire codes. For comparing chunks of codes, we will use the Jaccard
similarity measure.

Session info:

    sessionInfo()

    ## R version 3.2.2 (2015-08-14)
    ## Platform: x86_64-apple-darwin14.4.0 (64-bit)
    ## Running under: OS X 10.10.5 (Yosemite)
    ## 
    ## locale:
    ## [1] en_US.UTF-8/en_US.UTF-8/en_US.UTF-8/C/en_US.UTF-8/en_US.UTF-8
    ## 
    ## attached base packages:
    ## [1] stats     graphics  grDevices utils     datasets  methods   base     
    ## 
    ## other attached packages:
    ## [1] dplyr_0.4.3          textreuse_0.0.1.9003
    ## 
    ## loaded via a namespace (and not attached):
    ##  [1] Rcpp_0.12.1     digest_0.6.8    assertthat_0.1  R6_2.1.1       
    ##  [5] DBI_0.3.1       magrittr_1.5    evaluate_0.8    stringi_0.5-5  
    ##  [9] lazyeval_0.1.10 NLP_0.1-8       hash_2.2.6      rmarkdown_0.8  
    ## [13] tools_3.2.2     stringr_1.0.0   yaml_2.1.13     parallel_3.2.2 
    ## [17] htmltools_0.2.6 knitr_1.11
