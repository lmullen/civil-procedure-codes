plot_graph <- function(g) {
  plot(g, edge.width = E(g)$weight * 5, layout = layout.fruchterman.reingold,
       edge.arrow.size= 0.25, vertex.size = 5)
}

# "CA1851" goes in, 1851L comes out
extract_date <- function(x) {
  require(stringr)
  as.integer(str_extract(x, "\\d{4}"))
}

# "CA1851" goes in, "CA" comes out
extract_state <- function(x) str_sub(x, 1, 2)

extract_code_names <- function(section_names) {
  splits <- str_split(section_names, "-")
  vapply(splits, `[`, character(1), 1)
}
