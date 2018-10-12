##########################################################################
#  Major      : Business Intelligence and Analytics 
#  Subject    : Social network Analysis 
#  Purpose    : Network measurements Assignment#3
#  First Name : Sanjay Kumar 
#  Last Name  : Pattanayak
#  Id			    : 10431486
#  Date       : September'22nd 2018
##########################################################################

#Create the graph nodes and edges.
g = graph(edges = c(1,2,2,3,2,4,3,5,4,5,4,6,5,6,5,7,5,8,6,7), n = 8, directed = FALSE)
#Check if the graph is directed or not
is.directed(g)
#Check the graph 
summary(g)
#Name the nodes
V(g)$name = c('A', 'B', 'C', 'D','E','G','H','F')
#Check the graph 
summary(g)
#Plot the graph
plot(g)
#Get the degree of graph
degree(g)
degree(g,normalized = T)
#Make degree table
table(degree(g))
#Plot the degree table
plot(degree(g))
#Check density of graph
edge_density(g, loops = FALSE)
edge_density(g, loops = TRUE)
edge_density(simplify(g), loops=FALSE)    
#Check betweenness
betweenness(graph = g,normalized = F)
betweenness(graph = g,normalized = T)
#Check closeness
closeness(g)
closeness(g, vids = V(g), mode = c("all"),weights = NULL, normalized = FALSE)
#Check eigenvector centrality
evcent(g)$vector
#Check centralization
centralization.degree(g)
