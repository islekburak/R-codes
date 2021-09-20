library(networkD3)
nodes = read.csv("nodes.csv", sep=";" , header=TRUE)
links = read.csv("links.csv", sep=";" , header=TRUE)
my_color <- 'd3.scaleOrdinal() .domain(["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","r","a1","a2","a3","a4","a5","a6","a7","a8","a9","a10"]) .range(["#FB6F92","#FFB3C6","#FFE5EC","#CCCCFF","#E6CCFF","#FFCCFF","#FFCCE6","#FFCCCC","#FFE6CC","#FFFFCC","#E6FFCC","#CCFFCC","#CCFFFF","#FF7E79","#FFD579","#FFFD78","#D5FC79","#CCCCFF","#E6CCFF","#FFCCFF","#FFCCE6","#FFCCCC","#FFE6CC","#FFFFCC","#E6FFCC","#CCFFCC","#CCFFFF"])'
sankeyNetwork(Links = links, Nodes = nodes,
              Source = "source", Target = "target",
              Value = "value", NodeID = "name",
              fontSize= 12, nodeWidth = 30, colourScale=my_color, NodeGroup = "group", iterations=0, sinksRight=FALSE)
# save the widget
# library(htmlwidgets)
# saveWidget(p, file=paste0( getwd(), "/HtmlWidget/sankeyColor3.html"))

#NodeGroup yanına LinkGroup="group" eklersen flowlar FZD nodelarının rengine dönüyor.