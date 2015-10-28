# Split a code into chunks
library("readr")
library("stringr")

dir.create("legal-codes-split", showWarnings = FALSE)
args <- commandArgs(trailingOnly = TRUE)
in_file <- args[1]
stem <- in_file %>%
  basename() %>%
  str_replace("\\.txt", "")
out_file_stem <- str_c("legal-codes-split/", stem)
doc <- read_file(in_file)
doc <- str_c(doc, collapse = "\n")

# Use pattern_clean on files we have cleaned up; otherwise use pattern_fuzzy. We will assume that a file has been cleaned up unless it matches a black list.
pattern_fuzzy <- regex("(\n§((\\s+)?)\\d+((\\.)?)|\n\\$((\\s+)?)\\d+((\\.)?)|\nchapter|\ntitle|\narticle|\nSUBDIVISION|\nt i t l e|\nRULE \\w+\\.|\n\\d{1,}\\.|\nSEC((\\.)?)\\s+\\d+((\\.)?)|\nSECTION((\\.)?)\\s+\\d+((\\.)?)|\nSECT((\\.)?)\\s+\\d+((\\.)?)|\n8EC((\\.)?)\\s+\\d+((\\.)?)|\nSE0((\\.)?)\\s+\\d+((\\.)?)|\nSEO((\\.)?)\\s+\\d+((\\.)?)|\nS((\\.)?)\\s+\\d+((\\.)?)|\nSEQ((\\.)?)\\s+\\d+((\\.)?)|\nArt((\\.)?)\\s+\\d+((\\.)?)|\nAn((\\.)?)\\s+\\d+((\\.)?)|\nAm((\\.)?)\\s+\\d+((\\.)?)|\nSec\\.\n\\d+\\.)", ignore_case = TRUE)
pattern_clean <- regex("(\ntitle|\nchapter|\narticle\n|\nsection|\ndivision|\nsubdivision|\n§|\nSec\\.)", ignore_case = TRUE)

uncleaned_files <- c("BI1859", "CA1868short", "CO1858", "CT1854", "CT1879",
                     "CT1879extended", "DE1852", "FL1847", "FL1892", "FR1806",
                     "GA1851", "GB1873", "GB1875", "HI1859", "IA1839", "IL1866",
                     "IN1843", "LA1825", "LA1825french", "LC1867", "LC1867french",
                     "MA1836", "MA1851", "MA1858", "ME1840", "MI1853", "MO1835",
                     "MS1848", "ND1877short", "NH1842", "NJ1847", "NM1865",
                     "OH1853short", "OH1879", "UT1884", "VA1841", "VA1860",
                     "WA1873", "WI1849", "WI1858", "WV1868")

if (any(str_detect(out_file_stem, uncleaned_files))) {
  chunks <- str_split(doc, pattern_fuzzy)[[1]]
} else {
  chunks <- str_split(doc, pattern_clean)[[1]]
}

chunks <- str_trim(chunks)
for (i in seq_along(chunks)) {
  filename <- str_c(out_file_stem, "-", str_pad(i * 10, 6, pad = "0"), ".txt")
  writeLines(chunks[[i]], filename)
}
