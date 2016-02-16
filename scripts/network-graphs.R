library(dplyr)
library(igraph)
library(ggplot2)
library(ggraph)
library(stringr)
load("cache/corpus-lsh.rda")
source("R/helper.R")
set.seed(82892)

# We will keep edges that have at least a certain number of shared connections
# OR a percentage of borrowings that is greater than than a set percentage, but
# we will keep at most a certain number of edges per code.
minimum_n <- 50
minimum_percent <- 0.20
top_matches <- 2

edges_n <- summary_matches %>%
  filter(!is.na(match_code),
         sections_borrowed >= minimum_n | percent_borrowed >= minimum_percent) %>%
  select(borrower_code, match_code, sections_borrowed) %>%
  group_by(borrower_code) %>%
  top_n(top_matches, sections_borrowed) %>%
  ungroup()

codes_g <- graph_from_data_frame(edges_n, directed = TRUE)
node_distances <- distances(codes_g,
                            mode = "out",
                            to = c("NY1848", "NY1849", "NY1850",
                                   "NY1851", "NY1853"),
                            algorithm = "unweighted") %>%
                    apply(1, min, na.rm = TRUE)
nodes_n <- data_frame(name = names(node_distances),
                      distance = node_distances)

codes_g <- graph_from_data_frame(edges_n, directed = TRUE, vertices = nodes_n)

min_state_sections <- 100
max_state_connections <- 2

states_edges <- summary_matches %>%
  mutate(borrower_state = extract_state(borrower_code),
         match_state = extract_state(match_code),
         borrower_date = extract_date(borrower_code),
         match_date = extract_date(match_code)) %>%
  filter(!is.na(match_code),
         borrower_date >= match_date,
         borrower_state != match_state) %>%
  group_by(borrower_state, match_state) %>%
  summarize(sections_borrowed = sum(sections_borrowed)) %>%
  filter(sections_borrowed >= min_state_sections) %>%
  top_n(max_state_connections, sections_borrowed)

state_nodes <- read.csv("regions.csv")

states_g <- graph_from_data_frame(states_edges, directed = TRUE,
                                  vertices = state_nodes)

save(codes_g, states_g, file = "cache/network-graphs.rda")
