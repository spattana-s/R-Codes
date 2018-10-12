#  First Name      : Khasha
#  Last Name       : Dehnad
#  Id              : 12345
#  purpose         : performing cluster analysis on IRIS dataset


rm(list=ls())

bc<-
  read.csv("C://AIMS/Stevens_/2018_DataMining/Raw_Data/breast-cancer-wisconsin.data.csv",
           na.strings = "?")

bc2<-na.omit(bc)

?hclust
?dist
?cutree

bc2_dist<-dist(bc2[,c(-1,-11)])
hclust_resutls<-hclust(bc2_dist,method ="average" )
hclust_2<-cutree(hclust_resutls,2)
table(Hclust=hclust_2,Actual=bc2[,11])


?kmeans

kmeans_2<- kmeans(bc2[,c(-1,-11)],2,nstart = 10)
kmeans_2$cluster
table(kmeans_2$cluster,bc2[,11])
