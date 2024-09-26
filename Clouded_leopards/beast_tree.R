library(ggplot2)
library(ggtree)
#if (!require("BiocManager", quietly = TRUE))
#    install.packages("BiocManager")
#BiocManager::install("treeio")

library(treeio)

felidae_mrca <- read.beast("beauti_mrca-felidae_atp8.tree")
ggtree(felidae_mrca) + 
  geom_tiplab(fontface = "italic") + 
  theme_tree2() + 
  expand_limits(x=4) +
  scale_x_continuous(labels = abs, breaks = -10:0) -> t1

revts(t1) + ggtitle("MRCA Felidae")
ggsave("tree_MRCA.png")

felidae_rate <- read.beast("beauti_rate-felidae_atp8.tree")
ggtree(felidae_rate) + 
  geom_tiplab(fontface = "italic") + 
  theme_tree2() + 
  expand_limits(x=3) +
  scale_x_continuous(labels = abs, breaks = -5:0) -> t2

revts(t2) + ggtitle("2% per my")
ggsave("tree_rate.png")