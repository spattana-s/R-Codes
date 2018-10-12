

#  Major      : Business Intelligence and Analytics 
#  Subject    : CS-513/Knowledge Discovery in Databses 
#  Purpose    : Assignment-8/Clustering
#  First Name : Sanjay Kumar 
#  Last Name  : Pattanayak
#  Id			    : 10431486
#  Date       : May'1st 2018

############################################## ### QUESTION 1 ############################################## ###

## Question -
#The "breast cancer dataset" in CANVAS was obtained from the University of Wisconsin Hospitals, 
#Madison from Dr. William H. Wolberg. The features in the dataset, described below, have been categorized from 1 to 10.
#Use these categorized features to answer the following questions.
#Implement a neural network model, with 10 hidden nodes, to classify the cells in the "Wisconsin breast cancer" 
#(wisc_bc_data.csv) dataset into malignant and benign.  

#Features                      Domain
#-- -----------------------------------------
#  Sample code number               id number
#F1. Clump Thickness               1 - 10
#F2. Uniformity of Cell Size       1 - 10
#F3. Uniformity of Cell Shape      1 - 10
#F4. Marginal Adhesion             1 - 10
#F5. Single Epithelial Cell Size   1 - 10
#F6. Bare Nuclei                   1 - 10
#F7. Bland Chromatin               1 - 10
#F8. Normal Nucleoli               1 - 10
#F9. Mitoses                       1 - 10
#Diagnosis Class:                 (2 for benign, 4 for malignant)



############################################## ### QUESTION 1 ############################################## ###
#Use the "Hierarchical" and K-means Clustering in R and the "average" linkage method to cluster 
#the records in the "Breast Cancer" dataset into two clusters. Use F1 to F9 for this exercise. 
#Delete rows with any missing value(s) first.

############################################## ### SOLUTION 1 ############################################## ###


#########################################################
##  Step 0: Clear the environment and load the data
##           
##
#########################################################


rm(list=ls())







# look at list of packages 
installed.packages() 
library()
library(class)
?knn()

remove(list=ls())


#Assign CSV file name
BCW<-file("C://Users/sanja/Google Drive/2ndSem/CS513_KDD_KashaDehnad/Assignments/Assignment5_C50/breast-cancer-wisconsin.data.csv",'r')


#Read CSV file and name the file as bc
bc<-read.csv(BCW, header=TRUE)

#Close the file
close(BCW)

#Perform EDA 
View(bc)


#Remove the NA values and copy it as another file
bc2<-na.omit(bc)

#Perform EDA 
View(bc2)
summary(bc2)

#Check the commands
?hclust
?dist

#Copy the file into another file bc3
#bc3 has only factors F1~F9
# Sample and Class are removed
bc3<-bc2[,-1]
bc3<-bc3[,-10]
View(bc3)

#Check the distribution of Class(Benign and Malignant) in bc file
table(bc$Class)
#Check the distribution of Class(Benign and Malignant) in bc2 file
table(bc2$Class)
#Making a file bc4 with only Class values
#Changing class values to 1 and 2 for class values of 2 and 4 respectively
bc4<-ifelse(bc2$Class==2,1,2)


#Hirerchial clustering
#Calculating distance between the Factors
bc3_dist<-dist(bc3)
bc3_dist

#Clustering with hclust command and default method ="complete"
hclust_results<-hclust(bc3_dist)
hclust_results
#Clustering at 2 levels
hclust_2<-cutree(hclust_results,2)
hclust_2

#Frequency table comapring with original data values
#table(hclust_2,bc2[,11])

table(hclust_2,bc4)
#Finding the error rate
wrong<- (hclust_2!=bc4 )
View(wrong)
error_rate<-sum(wrong)/length(wrong)
error_rate



#Hirerchial clustering "Average Method"
hclust_results1<-hclust(bc3_dist, method="average")
hclust_results1
#Cut dendogram at 2 cluster  level
hclust_3<-cutree(hclust_results1,2)
hclust_3

#Frequency table showing distribution
table(hclust_3,bc4)
#Finding Error rate
wrong2<- (hclust_3!=bc4 )
View(wrong2)
error_rate2<-sum(wrong2)/length(wrong2)
error_rate2


?kmeans
#kmeans clustering
kmeans_2<- kmeans(bc3,2,nstart=10)
#Checking the cluster
kmeans_2$cluster


#Frequency table
table(kmeans_2$cluster,bc2[,11])
table(kmeans_2$cluster,bc4)
table(kmeans_2$cluster)

#Calculating error rate
wrong1<- (kmeans_2$cluster!=bc4 )
View(wrong1)
error_rate1<-sum(wrong1)/length(wrong1)
error_rate1

