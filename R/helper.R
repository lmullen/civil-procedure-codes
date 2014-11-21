# Function to create ngrams
ngrammify <- function(data, n) {
  NGramTokenizer(data, Weka_control(min = n, max = n))
}

#' Remove unreasonable n-grams containing characters other than letters and spaces
#' @param ngrams A list of n-grams
#' @return Returns a list of filtered n-grams
filter_unreasonable_ngrams <- function(ngrams) {
  ngrams[!stringi::stri_detect_fixed(ngrams, "[^a-z ]")]
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
