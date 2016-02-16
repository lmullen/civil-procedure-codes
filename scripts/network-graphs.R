library(dplyr)
library(igraph)
library(ggplot2)
library(ggraph)
library(stringr)
load("cache/corpus-lsh.rda")
source("R/helper.R")
set.seed(82892)

minimum_n <- 50
top_matches <- 2

edges_n <- summary_matches %>%
  filter(!is.na(match_code),
         sections_borrowed >= minimum_n) %>%
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

nodes_n <- nodes_n %>%
  filter(distance != Inf)
edges_n <- edges_n %>%
  filter(borrower_code %in% nodes_n$name,
         match_code %in% nodes_n$name)

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
  filter(sections_borrowed >= 100) %>%
  top_n(max_state_connections, sections_borrowed)

state_nodes <- read.csv("regions.csv")

states_g <- graph_from_data_frame(states_edges, directed = TRUE,
                                  vertices = state_nodes)

save(codes_g, states_g, file = "cache/network-graphs.rda")
