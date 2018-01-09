suppressPackageStartupMessages(library(readr))
suppressPackageStartupMessages(library(dplyr))
suppressPackageStartupMessages(library(stringr))
suppressPackageStartupMessages(library(textreuse))
source("R/helper.R")
source("R/section-matches.R")
options("mc.cores" = 8L)

h <- 120
b <- 60
minhash <- minhash_generator(n = h, seed = 623)

sections <- TextReuseCorpus(dir = "procedure-code-sections",
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

all_matches <- data_frame(borrower_section = names(sections)) %>%
  left_join(scores_for_join, by = "borrower_section") %>%
  mutate(borrower_code = extract_code_names(borrower_section),
         borrower_year = extract_date(borrower_section),
         borrower_state = extract_state(borrower_section),
         match_code = extract_code_names(match_section),
         match_year = extract_date(match_section),
         match_state = extract_state(match_section)) %>%
  arrange(borrower_section, match_section)

best_matches <- data_frame(borrower_section = names(sections)) %>%
  left_join(get_best_matches(all_matches), by = "borrower_section") %>%
  mutate(borrower_code = extract_code_names(borrower_section),
         borrower_year = extract_date(borrower_section),
         borrower_state = extract_state(borrower_section),
         match_code = extract_code_names(match_section),
         match_year = extract_date(match_section),
         match_state = extract_state(match_section)) %>%
  arrange(borrower_section, match_section)

split_matches <- plyr::dlply(best_matches, "borrower_code", identity)

summary_matches <- summarize_borrowings(best_matches)

save(sections, buckets, scores, all_matches, best_matches, summary_matches,
     file = "cache/corpus-lsh.rda")

dir.create("out", showWarnings = FALSE)
dir.create("out/matches", showWarnings = FALSE)
write_csv(all_matches, "out/matches/all_matches.csv")
write_csv(best_matches, "out/matches/best_matches.csv")
write_csv(summary_matches, "out/matches/summary_matches.csv")
lapply(names(split_matches), function(x) {
  write_csv(split_matches[[x]], str_c("out/matches/", x, "-best-matches.csv"))
}) %>% invisible

