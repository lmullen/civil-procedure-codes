extract_code_names <- function(section_names) {
  splits <- str_split(section_names, "-")
  vapply(splits, `[`, character(1), 1)
}
