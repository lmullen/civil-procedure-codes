    library("textreuse")

We are going to tokenize the codes and save cached versions. For our
initial analysis, we will use skip n-grams with a moderate value for `k`
so that we have many features.

    cache_skip <- "cache/corpus-skip-ngrams-n7k3.rds"
    if (!file.exists(cache_skip)) {
      description <- "General purpose tokenization of codes for comparing pairwise."
      corpus_skip <- TextReuseCorpus(dir = "legal-codes/",
                                     meta = list("description" = description,
                                                 "title" = "Field codes"),
                                     tokenizer = tokenize_skip_ngrams, n = 7, k = 3,
                                     hash_func = hash_string,
                                     keep_tokens = FALSE)
      dir.create("cache", showWarnings = FALSE)
      corpus_skip
      saveRDS(corpus_skip, file = cache_skip)
    }

    cache_shingle <- "cache/corpus-shingle-ngrams-n7.rds"
    if (!file.exists(cache_shingle)) {
      description <- "General purpose tokenization of codes for comparing pairwise."
      corpus_shingle <- TextReuseCorpus(dir = "legal-codes/",
                                        meta = list("description" = description,
                                                    "title" = "Field codes"),
                                        tokenizer = tokenize_ngrams, n = 7,
                                        hash_func = hash_string,
                                        keep_tokens = FALSE)
      dir.create("cache", showWarnings = FALSE)
      corpus_shingle
      saveRDS(corpus_shingle, file = cache_shingle)
    }

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
    ## [1] textreuse_0.0.1.9003
    ## 
    ## loaded via a namespace (and not attached):
    ##  [1] assertthat_0.1  magrittr_1.5    tools_3.2.2     htmltools_0.2.6
    ##  [5] NLP_0.1-8       yaml_2.1.13     Rcpp_0.12.1     stringi_0.5-5  
    ##  [9] rmarkdown_0.8   knitr_1.11      stringr_1.0.0   digest_0.6.8   
    ## [13] evaluate_0.8
