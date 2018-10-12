library(igraph)
g = read.graph(file = "C://Users/sanja/Google Drive (spattana@stevens.edu)/3rdSem/BIA658-SNA/Assignments/HW3/lesmiserables.gml", format = "gml")
g
vcount(g)
ecount(g)
# plot
plot(g)
plot(g, layout=layout.fruchterman.reingold, vertex.size=5, vertex.label=NA)
plot(g, layout=layout.circle, vertex.size=5, vertex.label=NA)

# degree and degree distribution
degree(g)
hist(degree(g))
degree.distribution(g)
barplot(degree.distribution(g))

# vertex attribute - Is a character a main character?
vertex_attr_names(g)
get.vertex.attribute(g, "maincharacter")
V(g)$maincharacter
# Edge attribute - How many co-appearances each pair has?
E(g)$value

# Visualizing the vertex and edge attributes
node_color = ifelse(V(g)$maincharacter == 1, 'Red', 'Blue')
node_color
vertex_label = ifelse(V(g)$maincharacter == 1, V(g)$label, NA)
vertex_label
plot(g, layout=layout.fruchterman.reingold, vertex.size=5, vertex.label=vertex_label, vertex.color = node_color, edge.width=E(g)$value)

# Are main character and degree centrality related?
logistic_reg = glm(V(g)$maincharacter ~ degree(g), family = 'binomial' )
summary(logistic_reg)

