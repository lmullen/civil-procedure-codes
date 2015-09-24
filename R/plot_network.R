plot_network <- function(g, graph_title = "Network graph") {
  require("igraph")
  l <- layout.fruchterman.reingold(g, weights = E(g)$weight) * 10
  # http://stackoverflow.com/questions/5968612/how-do-i-lengthen-edges-in-an-igraph-network-plot-layout-fruchterman-reingold
#   l <- layout.fruchterman.reingold(g, niter = 500,
#                                    area = vcount(g) ^ 2.3,
#                                    repulserad = vcount(g) ^ 2.8)
  par(mar = c(0,0,1,0))
  plot(g, edge.width = E(g)$weight * 12, layout = l,
       edge.arrow.size = 0.15, vertex.size = 5)
  title(graph_title)
}
