# Function to create ngrams
ngrammify <- function(data, n) {
  NGramTokenizer(data, Weka_control(min = n, max = n))
}

#' Remove unreasonable n-grams containing characters other than letters and spaces
#' @param ngrams A list of n-grams
#' @return Returns a list of filtered n-grams
filter_unreasonable_ngrams <- function(ngrams) {
  ngrams[!stringi::stri_detect_regex(ngrams, "[^a-z ]")]
}

#' Compare two codes using their list of n-grams.
#' @param orig_code A vector of n-grams representing a code.
#' @param dest_code A vectory of n-grams representing a code.
#' @return A list containing data that might help to identify whether codes
#'   match up.
compare_codes_by_shared_ngrams <- function(orig_code, dest_code) {
  matches <- intersect(orig_code, dest_code)
  shared_ngrams <- unique(c(orig_code, dest_code))
  ratio_matches_to_possible <- length(matches) / length(unique(shared_ngrams))
  ratio_matches_to_destination <- length(matches) / length(unique(dest_code))
  return(ratio_matches_to_destination)
}

# From http://stackoverflow.com/questions/1719447/outer-equivalent-for-non-vector-lists-in-r
outer_for_lists <- function(a,b, fun) {
  mat <- outer(a, b, function(x,y) vapply(seq_along(x), function(i) fun(x[[i]], y[[i]]), numeric(1)))
  rownames(mat) <- names(b)
  colnames(mat) <- names(a)
  return(mat)
}

# Get the year from a code name
get_year <- function(s) {
  year <- stringi::stri_extract_first_regex(s, "\\d{4}")
  as.integer(year)
}
# Remove anachronistic comparisons of earlier codes to later codes
rm_anachronism <- function(m) {
  rows <- rownames(m)
  cols <- colnames(m)
  for(i in seq_along(m)) {
    ind <- arrayInd(i, dim(m))
    row <-  rows[ind[1,1]]
    col <-  cols[ind[1,2]]
    test <- get_year(row) > get_year(col)
    if(test) m[i] <- NA
  }
  return(m)
}
