library(tidyverse)
library(ggtree)
#to get node numbers
#ggtree(tree) + geom_text(aes(label=node), hjust=-.3, size=.7))

tree1 <- read.tree("/home/islekburak/Documents/adebalilab_presentation/new_tree.nw")
br <- list(c1=c("FZD4_HUMAN","FZD9_HUMAN","FZD10_HUMAN"),
           c2=c("FZD1_HUMAN","FZD2_HUMAN","FZD7_HUMAN"),
           c3=c("FZD5_HUMAN","FZD8_HUMAN"),
           c4=c("FZD3_HUMAN","FZD6_HUMAN"))
tree2 <- groupOTU(tree1, br)
p <- ggtree(tree2,aes(color=group),layout="rectangular", branch.length=TRUE,size=.7)  +
  #xlim(0, 40)+
  scale_color_manual(values=c("black","forestgreen","red","darkorange","blue")) +
  theme(legend.position="none") +
  geom_tiplab(size=2.5, align=TRUE, linetype = 3) +
  geom_hilight(node=61, fill="red", alpha=0.2)+
  geom_hilight(node=68, fill="steelblue", alpha=0.2)+
  geom_hilight(node=112, fill="pink", alpha=0.2)+
  geom_hilight(node=80, fill="aquamarine", alpha=0.2)+
  geom_hilight(node=94, fill="yellow", alpha=0.2)
p1 <- p + 
  geom_cladelabel(node=126, "SMO", offset=3, barsize=4 ,angle=90, offset.text=.5, hjust=.5, fontsize=4.5, align=TRUE) + 
  geom_cladelabel(68, "FZD3/6 Clade", offset=3, barsize=4, angle=90, offset.text=.5, hjust=0.5, fontsize=4.5, align=TRUE, color="blue") +
  geom_cladelabel(112, "FZD1/2/7 Clade", offset=3, barsize=4, angle=90, offset.text=.5, hjust=0.5, fontsize=4.5, align=TRUE, color="red") +
  geom_cladelabel(80, "FZD4/9/10 Clade", offset=3, barsize=4, angle=90, offset.text=.5, hjust=0.5, fontsize=4.5, align=TRUE, color="forestgreen") +
  geom_cladelabel(94, "FZD5/8 Clade", offset=3, barsize=4, angle=90, offset.text=.5, hjust=0.5, fontsize=4.5, align=TRUE,color="darkorange")


tree3 <- read.tree("/home/islekburak/Documents/adebalilab_presentation/new_tree.nw")
br <- list(c1=c("FZD4_HUMAN","FZD9_HUMAN","FZD10_HUMAN"),
           c2=c("FZD1_HUMAN","FZD2_HUMAN","FZD7_HUMAN"),
           c3=c("FZD5_HUMAN","FZD8_HUMAN"),
           c4=c("FZD3_HUMAN","FZD6_HUMAN"))
tree4 <- groupOTU(tree3, br)
p2 <- ggtree(tree4,aes(color=group),layout="circular", branch.length="none",size=.7)  +
  scale_color_manual(values=c("black","forestgreen","red","darkorange","blue")) +
  theme(legend.position="none") +
  geom_tiplab(size=2.6, offset=0.5) +
  geom_hilight(node=61, fill="red", alpha=0.2)+
  geom_hilight(node=68, fill="steelblue", alpha=0.2)+
  geom_hilight(node=112, fill="pink", alpha=0.2)+
  geom_hilight(node=80, fill="aquamarine", alpha=0.2)+
  geom_hilight(node=94, fill="yellow", alpha=0.2)
finalplot <-p1+p2
#plot(finalplot)
ggsave("treeplot.pdf", finalplot, device = "pdf", width = 17 , height = 10)