# The `white_list` argument takes either a count numeric, in which case it
# white lists at most that number of codes to be explicitly named in the viz,
# or a character vector of codes to white list.
spectrogram <- function(code, matches_df, num_cols = 50,
                        white_list = NULL, title = NULL,
                        base_size = 12, base_family = "",
                        legend_size = 0.5) {
  require(dplyr)
  require(stringr)
  require(ggplot2)

  # Get just the genuine matches for the code of interest
  matches_df <- matches_df %>%
    filter(borrower_code == code)

  # Create the white list of codes that we want to explicitly name in the viz.
  if (is.null(white_list)) {
    white_list <- white_list_maker(matches_df)
  } else if (is.numeric(white_list)) {
    white_list <- white_list_maker(matches_df, num_codes = white_list)
  }

  # Make all other codes "other"
  matches_df <- matches_df %>%
    mutate(match_code = other_maker(match_code, white_list))

  # Assign the positions in the heatmap
  matches_df <- matches_df %>%
    arrange(borrower_section) %>%
    mutate(.,
           column = col_vector(nrow(.), num_cols),
           row = row_vector(nrow(.), num_cols),
           match_code = as.factor(match_code))

  # Create the title
  if (is.null(title))
    title <- str_c("Borrowed sections in ", code)

  # Make the plot
  matches_df %>%
  ggplot(aes(x = column, y = -row, fill = match_code)) +
  geom_tile(color = "lightgray") +
  theme_minimal(base_size = base_size, base_family = base_family) +
  coord_equal() +
  labs(x = NULL, y = NULL, fill = "Section borrowed from") +
  ggtitle(label = title) +
  theme(legend.position = "bottom",
        axis.ticks = element_blank(),
        axis.line = element_blank(), axis.text = element_blank(),
        panel.background = element_blank(), panel.grid = element_blank(),
        legend.key.size = unit(legend_size, "cm"),
        plot.margin = unit(c(0, 0, 0, 0), "cm"),
        plot.title = element_text(hjust = 0.5)) +
  scale_fill_manual(na.value = "white",
                    values = c(
                      AZ1865 = "lightpink3",
                      AZ1887 = "lightpink3",
                      CA1850 = "palevioletred1",
                      CA1851 = "firebrick2",
                      CA1858 = "firebrick3",
                      CA1868 = "indianred1",
                      CA1872 = "darkred",
                      DC1857 = "mediumorchid",
                      GB1852 = "mediumorchid",
                      IA1839 = "mediumorchid",
                      ID1881 = "mediumorchid4",
                      IL1866 = "mediumorchid",
                      IN1843 = "mediumorchid",
                      IN1852 = "chartreuse4",
                      LA1844 = "purple4",
                      MA1858 = "mediumorchid",
                      MN1859 = "lightblue2",
                      MO1849 = "gold3",
                      MT1865 = "maroon3",
                      NE1866 = "mediumorchid",
                      NV1861 = "mediumpurple4",
                      NV1869 = "mediumorchid4",
                      NY1829 = "darkorchid1",
                      NY1848 = "darkorange",
                      NY1849 = "goldenrod1",
                      NY1850 = "peru",
                      NY1851 = "goldenrod4",
                      NY1853 = "orange3",
                      NY1876 = "mediumorchid",
                      NY1879 = "mediumpurple1",
                      OR1854 = "chocolate1",
                      OR1862 = "chocolate1",
                      Other  = "lightgray",
                      TX1855 = "mediumorchid",
                      WI1849 = "deepskyblue1",
                      WI1856 = "deepskyblue3",
                      WI1858 = "deepskyblue4"
                    ))
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

white_list_maker <- function(df, num_codes = 5) {
  df %>%
    count(match_code) %>%
    top_n(num_codes, n) %>%
    arrange(desc(n)) %>%
    filter(!is.na(match_code)) %>%
    `$`("match_code")
}
