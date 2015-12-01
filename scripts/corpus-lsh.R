library("textreuse")
library("dplyr")
library("stringr")
source("R/extract_code_names.R")
source("R/extract-date.R")
options("mc.cores" = 6L)

h <- 120
b <- 60
minhash <- minhash_generator(n = h, seed = 623)

sections <- TextReuseCorpus(dir = "legal-codes-split",
                            tokenizer = tokenize_ngrams, n = 5,
                            keep_tokens = FALSE,
                            minhash_func = minhash)

buckets <- lsh(sections, bands = b)
scores <- buckets %>%
  lsh_candidates() %>%
  lsh_compare(sections, jaccard_similarity) %>%
  rename(section_a = a, section_b = b, similarity = score) %>%
  mutate(code_a = extract_code_names(section_a),
         code_b = extract_code_names(section_b),
         year_a = extract_date(code_a),
         year_b = extract_date(code_b))
save(sections, buckets, scores, file = "cache/corpus-lsh.rda")
