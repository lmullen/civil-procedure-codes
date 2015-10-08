As the textreuse package is currently implemented, the `lsh()` function
gets bogged down with large numbers of documents. The implementation
with the hash package is probably unneccessary; we can do it a lot
faster with dplyr. So we will implement a specific solution here before
revising the textreuse package. (Thanks for an assist from [Stack
Overflow](http://stackoverflow.com/questions/32783727/turn-ordered-pairs-into-unordered-pairs-in-a-data-frame-with-dplyr/32784685#32784685).)

    library("readr")
    library("textreuse")
    library("dplyr")
    library("digest")
    library("stringr")
    library("tidyr")

Load the corpus.

    cache <- "cache/corpus-n5-minhash-h1500-seed623.rds"
    if (!file.exists(cache)) {
      corpus <- TextReuseCorpus(dir = "legal-codes-split", tokenizer = NULL)
      wc <- wordcount(corpus)
      corpus <- corpus[wc > 5]
      minhash <- minhash_generator(n = 1500, seed = 623)
      corpus <- tokenize(corpus, tokenizer = tokenize_ngrams, n = 5,
                         hash_func = minhash, keep_tokens = TRUE)
      saveRDS(corpus, file = cache)
    } else {
      corpus <- readRDS(cache)
    }

    bands <- 500
    hashes <- 1500
    rows <- hashes / bands
    docs <- length(corpus)
    bands_vec <- rep(vapply(1:bands, function(i) rep(i, rows), integer(rows)), docs)

    buckets_cache <- "cache/buckets-dplyr-lsh.rds"
    if (!file.exists(buckets_cache)) {
      buckets <-  corpus %>%
        hashes() %>%
        as_data_frame() %>%
        gather(doc, hash) %>%
        mutate(doc = as.character(doc),
               band = bands_vec) %>%
        group_by(doc, band) %>%
        summarize(buckets = digest(hash)) %>%
        select(-band)
      rm(bands_vec)
      saveRDS(buckets, file = buckets_cache)
    } else {
      buckets <- readRDS(buckets_cache)
    }

Now find the ordered pairs of matches:

    ordered <- buckets %>% 
      ungroup() %>%
      left_join(buckets, by = "buckets") %>%
      select(-buckets) %>%
      distinct() %>% 
      filter(doc.x != doc.y) %>%
      arrange(doc.x, doc.y)

Now remove the duplicate pairs.

    unordered <- ordered %>% 
      distinct(dn = pmin(doc.x, doc.y), up = pmax(doc.x, doc.y)) %>%
      select(-up, -dn) %>%
      rename(a = doc.x, b = doc.y) %>%
      arrange(a, b) %>% 
      mutate(score = NA_real_) 

Save the results.

    write_csv(ordered, path = "out/all-sections-unordered-pairs.csv")

Rehash the corpus to use for Jaccard similarity.

    corpus_rehashed <- rehash(corpus, hash_string)

Compute the Jaccard similarity scores and save the results.

    scores <- unordered %>% 
      lsh_compare(corpus_rehashed, jaccard_similarity) %>% 
      rename(similarity = score) %>% 
      mutate(dissimilarity = 1 - similarity)
    write_csv(scores, path = "out/scores-all-sections-pairs.csv")
    scores

    ## Source: local data frame [274,359 x 4]
    ## 
    ##                  a               b similarity dissimilarity
    ##              (chr)           (chr)      (dbl)         (dbl)
    ## 1  AK1900-00000010 AR1868-00000060 0.21621622     0.7837838
    ## 2  AK1900-00000010 AR1874-00001960 0.37500000     0.6250000
    ## 3  AK1900-00000010 AZ1865-00000020 0.21311475     0.7868852
    ## 4  AK1900-00000010 CA1850-00000030 0.17910448     0.8208955
    ## 5  AK1900-00000010 CA1858-00000030 0.21311475     0.7868852
    ## 6  AK1900-00000010 CA1872-00002310 0.19672131     0.8032787
    ## 7  AK1900-00000010 CO1877-00000010 0.17307692     0.8269231
    ## 8  AK1900-00000010 DC1857-00000970 0.39189189     0.6081081
    ## 9  AK1900-00000010 DT1868-00000280 0.27619048     0.7238095
    ## 10 AK1900-00000010 DT1887-00000640 0.09004739     0.9099526
    ## ..             ...             ...        ...           ...
