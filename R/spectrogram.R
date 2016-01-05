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
n_columns <- 40

white_list <- c("CA1850", "NY1850", "WI1849", "CA1851", "OR1854", "IN1852")
other_maker <- function(x, white_list) {
  ifelse(is.na(x), NA, ifelse(x %in% white_list, x, "Other"))
}
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

