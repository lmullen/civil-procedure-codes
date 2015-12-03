library("textreuse")
library("dplyr")
library("stringr")
library("readr")
source("R/helper.R")
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
  lsh_compare(sections, jaccard_similarity)

scores_swapped <- scores %>%
  rename(b2 = a, a2 = b) %>%
  rename(a = a2, b = b2)

scores_for_join <- bind_rows(scores, scores_swapped) %>%
  rename(borrower_section = a,
         match_section = b)

matches <- data_frame(borrower_section = names(sections)) %>%
  left_join(scores_for_join, by = "borrower_section") %>%
  mutate(borrower_code = extract_code_names(borrower_section),
         borrower_year = extract_date(borrower_section),
         borrower_state = extract_state(borrower_section),
         match_code = extract_code_names(match_section),
         match_year = extract_date(match_section),
         match_state = extract_state(match_section)) %>%
  arrange(borrower_section, match_section)

save(sections, buckets, scores, matches, file = "cache/corpus-lsh.rda")
write_csv(matches, "cache/matches.csv")
