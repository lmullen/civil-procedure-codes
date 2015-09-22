library(readr)
library(stringi)
library(stringr)
library(magrittr)

args <- commandArgs(trailingOnly = TRUE)
in_file <- args[1]
out_file <- args[2]

text <- read_file(in_file)

# Corrections in this file are literal substrings, not patterns. E.g. "adjoum"
# should be corrected to "adourn" in both the word "adjourn" and the word
# "adjournment".
corrections <- read_csv("scripts/ocr-corrections.csv")

cleaned <- text %>%
  stri_replace_all_fixed(corrections$pattern, corrections$replacement,
                         vectorize_all = FALSE) %>%
  str_replace_all("\r", "") %>%
  str_replace_all("-\n+", "") %>%
  str_replace_all(regex("\\uFFFD((\\s)?)"), "")

write(cleaned, file = out_file)


