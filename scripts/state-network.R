library(tidyverse)
library(igraph)
library(ggraph)

load("cache/corpus-lsh.rda")
load("cache/network-graphs.rda")

set.seed(7833)
network_g <- ggraph(states_g, "igraph", algorithm = "nicely") +
  geom_edge_fan(aes(edge_width = sections_borrowed,
                    alpha = sections_borrowed),
                arrow = arrow(type = "closed", ends = "first",
                              length = unit(0.3, "inches"),
                               angle = 25)) +
  geom_node_point(aes(color = as.factor(region)), size = 9) +
  scale_edge_width("Sections borrowed", range = c(1, 2), guide = "none") +
  scale_edge_alpha(range = c(0.5, 0.5), guide = "none") +
  # scale_color_manual(name = "Region",
  #                    values = c("New York" = "#ff0000",
  #                               "Midwest" = "#1d91c0",
  #                               "South" = "#41b6c4",
  #                               "West" = "#7fcdbb",
  #                               "New England" = "#c7e9b4")) +
  scale_color_brewer(name = "Region", palette = "Set3") +
  ggforce::theme_no_axes() +
  geom_node_text(aes(label = name), size = 6, family = "Palatino") +
  labs(title = "The migration of the Field Code",
       subtitle = "States connected by legislative borrowings of civil procedure") +
  theme(legend.position = "bottom",
        panel.border = element_blank(),
        text = element_text(family = "Palatino"),
        legend.title = element_text(size = 18),
        legend.text = element_text(size = 15),
        plot.title = element_text(size = 22, face = "bold"),
        plot.subtitle = element_text(size = 18))
print(network_g)
ggsave("out/state-network.svg", network_g, width = 12, height = 6.75)
