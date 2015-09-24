extract_date <- function(x) {
  require(stringr)
  as.integer(str_extract(x, "\\d{4}"))
}
