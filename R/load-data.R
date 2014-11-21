codes_dir <- "text"
files <- dir(codes_dir, "*.txt")

raw <- file.path(codes_dir, files) %>%
  lapply(., scan, "character", sep = "\n")
names(raw) <-  stri_match_first_regex(files, "(.+).txt")[,2]

codes <- raw %>%
  lapply(paste, collapse = " ") %>%
  lapply(tolower) %>%
  lapply(WordTokenizer) %>%
  lapply(paste, collapse = " ") %>%
  lapply(ngrammify, 5) %>%
  lapply(filter_unreasonable_ngrams)

rm(raw, codes_dir, files)
