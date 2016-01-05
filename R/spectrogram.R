
# Threshold is set to 0 because in `get_best_matches()` we already applied a
# threshold of `0.1`: in other words, if it didn't meet that minimum, we don't
# consider it a match at all. Here we will have the option to increase the limit
# but won't exercise it by default.
spectrogram <- function(code, matches_df, num_cols = 40, threshold = 0.0,
                        white_list = NULL) {
  require(dplyr)

  # Get just the genuine matches for the code of interest
  matches_df <- matches_df %>%
    filter(borrower_code == code) %>%
    filter(score >= threshold)

  # Create the white list of codes that we want to explicitly name in the viz.

}

col_vector <- function(n, cols) {
  r <- trunc(n / cols)
  remainder <- n %% cols
  if (remainder > 0)
    c(rep(1:cols, r), 1:remainder)
  else
    c(rep(1:cols, r))
}

row_vector <- function(n, cols) {
  out <- NULL
  for (i in seq_len((n / cols) + 1)) {
    out <- c(out, rep(i, cols))
  }
  out[1:n]
}

other_maker <- function(x, white_list) {
  ifelse(is.na(x), NA, ifelse(x %in% white_list, x, "Other"))
}

white_list_maker <- function(df, n = 5) {
  df %>%
    count(match_code) %>%
    top_n(n, n) %>%
    arrange(desc(n)) %>%
    filter(!is.na(match_code)) %>%
    `$`("match_code")
}

white_list <- c("CA1850", "NY1850", "WI1849", "CA1851", "OR1854", "IN1852")

best_section_matches("WA1855", scores, threshold = 0.3) %>%
  mutate(match_code = other_maker(match_code, white_list)) %>%
  mutate(.,
         column = col_vector(nrow(.), n_columns),
         row = row_vector(nrow(.), n_columns),
         match_code = as.factor(match_code)) %>%
  ggplot(aes(x = column, y = -row, fill = match_code)) +
  geom_tile(color = "lightgray") +
  theme_minimal(base_size = 16) +
  coord_equal() +
  labs(x = NULL, y = NULL, title = "Borrowed sections in WA1855",
       fill = "Section borrowed from") +
  theme(legend.position = "bottom",
        axis.ticks = element_blank(),
        axis.line = element_blank(), axis.text = element_blank(),
        panel.background = element_blank(), panel.grid = element_blank()) +
  scale_fill_brewer(type = "qual", na.value = "gray", palette = 6)

