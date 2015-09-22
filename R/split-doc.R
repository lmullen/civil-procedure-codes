split_doc <- function(file, pattern, out_file_stem) {
  require(stringr)
  doc <- readLines(file)
  doc <- str_c(doc, collapse = "\n")
  chunks <- str_split(doc, pattern)[[1]]
  chunks <- str_trim(chunks)
  for (i in seq_along(chunks)) {
    filename <- str_c(out_file_stem, "-", str_pad(i * 10, 8, pad = "0"), ".txt")
    writeLines(chunks[[i]], filename)
  }
}
