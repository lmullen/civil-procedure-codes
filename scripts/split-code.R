# Split a code into chunks
library(readr)
library(stringr)

dir.create("legal-codes-split", showWarnings = FALSE)
args <- commandArgs(trailingOnly = TRUE)
in_file <- args[1]
stem <- in_file %>%
  basename() %>%
  str_replace("\\.txt", "")
out_file_stem <- str_c("legal-codes-split/", stem)
doc <- read_file(in_file)
doc <- str_c(doc, collapse = "\n")
pattern <- regex("(\n§((\\s+)?)\\d+((\\.)?)|\n\\$((\\s+)?)\\d+((\\.)?)|\nchapter|\ntitle|\narticle|\nSUBDIVISION|\nt i t l e|\nRULE \\w+\\.|\n\\d{4,}\\.|\nSEC((\\.)?)\\s+\\d+((\\.)?)|\nSECTION((\\.)?)\\s+\\d+((\\.)?)|\nSECT((\\.)?)\\s+\\d+((\\.)?)|\n8EC((\\.)?)\\s+\\d+((\\.)?)|\nSE0((\\.)?)\\s+\\d+((\\.)?)|\nSEO((\\.)?)\\s+\\d+((\\.)?)|\nS((\\.)?)\\s+\\d+((\\.)?)|\nSEQ((\\.)?)\\s+\\d+((\\.)?)|\nArt((\\.)?)\\s+\\d+((\\.)?)|\nAn((\\.)?)\\s+\\d+((\\.)?)|\nAm((\\.)?)\\s+\\d+((\\.)?)|\nSec\\.\n\\d+\\.)", ignore_case = TRUE)
chunks <- str_split(doc, pattern)[[1]]
chunks <- str_trim(chunks)
for (i in seq_along(chunks)) {
  filename <- str_c(out_file_stem, "-", str_pad(i * 10, 6, pad = "0"), ".txt")
  writeLines(chunks[[i]], filename)
}
