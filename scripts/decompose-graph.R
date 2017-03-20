library("textreuse")
library("dplyr")
library("igraph")
library("Matrix")
load(file = "cache/lsh-sections.rda")
load(file = "cache/corpus-sections-minash-n120-seed623.rda")

g <- section_scores %>%
  # filter(score > 0.05) %>%
  rename(weight = score) %>%
  graph_from_data_frame()
d <- decompose(g, min.vertices = 2)

l <- sapply(d, function(x) length(V(x)))

which.max(l)

m <- d[[1]] %>% as_adjacency_matrix(attr = "weight")
writeMM(m, file = "out/adjacency-matrix-biggest-subgraph.MM")

library("readr")
cluster2 <- read_csv("~/Dropbox/DocumentCluster/cluster2.csv")

docids <- cluster2$`1050`

cluster2docs <- sections[docids]
docs <- lapply(cluster2docs$doc, content)

length(docs)
docs[[4]]

m2[docids,docids] %>% as.matrix() %>% heatmap()
library(igraph)
g <- m[docids, docids] %>% as.matrix() %>% graph_from_adjacency_matrix(mode = "upper", weighted = TRUE)
plot(g)
