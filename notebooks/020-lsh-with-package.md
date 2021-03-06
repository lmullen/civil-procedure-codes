We have refined our technique for extracting matches. So the work in the
document supercedes all previous work. The aim is to create the data
frame of matches and other results and cache them for future use.

    library("textreuse")
    library("dplyr")
    options("mc.cores" = 6L)

We want to have the smallest number of hashes and bands while still
detecting all reasonable matchs. We will set the bands and number of
minhashes as follows.

    h <- 120
    b <- 60
    lsh_threshold(h, b)

    ## [1] 0.1290994

Create the corpus.

    cache_corpus <- "cache/corpus-sections-minash-n120-seed623.rda"
    if (!file.exists(cache_corpus)) {
      message("Creating the corpus.")
      minhash <- minhash_generator(n = h, seed = 623)
      sections <- TextReuseCorpus(dir = "legal-codes-split/",
                                  tokenizer = tokenize_ngrams, n = 5,
                                  keep_tokens = FALSE,
                                  minhash_func = minhash)
      save(sections, minhash, file = cache_corpus)
    } else {
      message("Loading corpus from cache.")
      load(file = cache_corpus)
    }

    ## Loading corpus from cache.

Compute the LSH candidates, then compare them.

    cache_lsh <- "cache/lsh-sections.rda"
    if (!file.exists(cache_lsh)) {
      message("Running LSH analysis.")
      section_buckets <- lsh(sections, bands = b)
      section_candidates <- lsh_candidates(section_buckets)
      section_scores <- lsh_compare(section_candidates, sections, jaccard_similarity)
      save(section_buckets, section_candidates, section_scores, file = cache_lsh)
      saveRDS(section_scores, "cache/section-scores.rds")
    } else {
      message("Loading LSH objects from cache.")
      load(file = cache_lsh)
    }

    ## Loading LSH objects from cache.

How many pairs of matches do we have above `0.1` Jaccard score?

    section_scores %>% 
      filter(score > 0.1) %>% 
      nrow()

    ## [1] 300184
