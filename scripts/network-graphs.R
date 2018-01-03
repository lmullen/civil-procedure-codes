suppressPackageStartupMessages(library(dplyr))
suppressPackageStartupMessages(library(igraph))
suppressPackageStartupMessages(library(ggplot2))
suppressPackageStartupMessages(library(ggraph))
suppressPackageStartupMessages(library(stringr))
load("cache/corpus-lsh.rda")
source("R/helper.R")
set.seed(82892)

# We will keep edges that have at least a certain number of shared connections
# OR a percentage of borrowings that is greater than than a set percentage, but
# we will keep at most a certain number of edges per code.
#
# We will also prune second edges if they come from a different state than the
# borrowing code AND are from the same state as a stronger borrowing.
minimum_n <- 50
minimum_percent <- 0.20
top_matches <- 2

edges_n <- summary_matches %>%
  filter(!is.na(match_code),
         sections_borrowed >= minimum_n |
           percent_borrowed >= minimum_percent) %>%
  select(borrower_code, match_code, sections_borrowed) %>%
  group_by(borrower_code) %>%
  top_n(top_matches, sections_borrowed) %>%
  arrange(desc(sections_borrowed)) %>%
  filter(!(extract_state(match_code) == head(extract_state(match_code), 1) &
             match_code != head(match_code, 1) &
             extract_state(match_code) != extract_state(borrower_code))) %>%
  ungroup()

codes_g <- graph_from_data_frame(edges_n, directed = TRUE)

the_field_codes <- c("NY1848", "NY1849", "NY1850", "NY1851", "NY1853",
                     "NY1864", "NY1873")

is_field_code <- function(x) {
  ifelse(x %in% the_field_codes, TRUE, FALSE)
}

node_distances <- distances(codes_g,
                            mode = "out",
                            to = the_field_codes,
                            algorithm = "unweighted") %>%
                    apply(1, min, na.rm = TRUE)
# Change labels of field codes
code_names <- names(node_distances)
node_distances <- ifelse(is.infinite(node_distances), NA_integer_, node_distances)
node_distances <- ifelse(node_distances >= 2, 2, node_distances)
node_distances <- as.character(node_distances)
node_distances <- ifelse(node_distances == "0", "Field code",
                         ifelse(node_distances == "1", "Original borrower",
                         ifelse(node_distances == "2", "Subsequent borrower",
                         node_distances)))
node_distances <- ifelse(is.na(node_distances), "Independent", node_distances)
nodes_n <- data_frame(name = code_names,
                      distance = node_distances,
                      field_code = is_field_code(name))

codes_g <- graph_from_data_frame(edges_n, directed = TRUE, vertices = nodes_n)

g_ids <- V(codes_g)$name
g_ids <- ifelse(g_ids == "DT1862", "ND1862", g_ids)
g_ids <- ifelse(g_ids == "DT1868", "ND1868", g_ids)
g_ids <- ifelse(g_ids == "DT1887", "SD1887", g_ids)
V(codes_g)$name <- g_ids

min_state_sections <- 100
max_state_connections <- 2

states_edges <- summary_matches %>%
  mutate(borrower_state = extract_state(borrower_code),
         match_state = extract_state(match_code),
         borrower_date = extract_date(borrower_code),
         match_date = extract_date(match_code)) %>%
  mutate(borrower_state = ifelse(borrower_state == "DT", "SD", borrower_state)) %>%
  filter(!is.na(match_code),
         borrower_date >= match_date,
         borrower_state != match_state) %>%
  group_by(borrower_state, match_state) %>%
  summarize(sections_borrowed = sum(sections_borrowed)) %>%
  filter(sections_borrowed >= min_state_sections) %>%
  top_n(max_state_connections, sections_borrowed)

state_nodes <- read.csv("scripts/regions.csv")

states_g <- graph_from_data_frame(states_edges, directed = TRUE,
                                  vertices = state_nodes)

save(codes_g, states_g, file = "cache/network-graphs.rda")
