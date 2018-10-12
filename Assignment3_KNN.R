#  Major      : Business Intelligence and Analytics 
#  Subject    : CS-513/Knowledge Discovery in Databses 
#  Purpose    : Assignment-3/K Nearest Neighbor 
#  First Name : Sanjay Kumar 
#  Last Name  : Pattanayak
#  Id			    : 10431486
#  Date       : Mar'15th 2018



############################################## ### QUESTION 3.2 ############################################## ###

## 3.2 Load the "breast-cancer-wisconsin.data.csv" from CANVAS (see the description bellow) 

##a.	Remove the rows with missing values
##b.	Store every fifth record in a "test" dataset starting with the first record
##c.	Store the rest in the "training" dataset
##d.	Use knn with k=1 and classify the test dataset
##e.	Measure the performance of knn
##f.	Repeat the above steps with k=2, k=5, k=10.



############################################## ### SOLUTION 1 ############################################## ###

#Remove Objects from a Specified Environment 
rm(list=ls())


#Assign CSV file name
BCW<-file("C://Users/sanja/Google Drive/2ndSem/CS513_KDD_KashaDehnad/Assignments/Assignment2/breast-cancer-wisconsin.data.csv",'r')

#Read CSV file and name the file as EDA_BCW. 
#Remove any row with a missing value in any of the columns.
EDA_BCW<-na.omit(read.csv(BCW, header = TRUE))

#Close the CSV file
close(BCW)

#Check the Dataframe
View(EDA_BCW)

#Check the type of DF
typeof(EDA_BCW)

#Check the Structure of Dataframe
str(EDA_BCW)

#I.	Summarizing each column (e.g. min, max, mean )
## II.	Identifying missing values
summary(EDA_BCW)


mmnorm<-function(x,minx,maxx){z<-((x-minx)/(maxx-minx))
return(z)
}


EDA_BCW_normalized <- as.data.frame(
  cbind(Sample=EDA_BCW[,1],
        F1=mmnorm(EDA_BCW[,2],min(EDA_BCW[,2]),max(EDA_BCW[,2])),
        F2=mmnorm(EDA_BCW[,3],min(EDA_BCW[,3]),max(EDA_BCW[,3])),
        F3=mmnorm(EDA_BCW[,4],min(EDA_BCW[,4]),max(EDA_BCW[,4])),
        F4=mmnorm(EDA_BCW[,5],min(EDA_BCW[,5]),max(EDA_BCW[,5])),
        F5=mmnorm(EDA_BCW[,6],min(EDA_BCW[,6]),max(EDA_BCW[,6])),
        F6=mmnorm(EDA_BCW[,7],min(EDA_BCW[,7]),max(EDA_BCW[,7])),
        F7=mmnorm(EDA_BCW[,8],min(EDA_BCW[,8]),max(EDA_BCW[,8])),
        F8=mmnorm(EDA_BCW[,9],min(EDA_BCW[,9]),max(EDA_BCW[,9])),
        F9=mmnorm(EDA_BCW[,10],min(EDA_BCW[,10]),max(EDA_BCW[,10])),
        Class=EDA_BCW[,11]
  )
)

View(EDA_BCW_normalized)

str(EDA_BCW_normalized)

summary(EDA_BCW_normalized)


training <- EDA_BCW_normalized[c(F,T,T,T,T),]
test <- EDA_BCW_normalized[c(T,F,F,F,F),]
View(test)
View(training)

View(training[,c(F,T,T,T,T,T,T,T,T,T,F)])
View(test[,c(F,T,T,T,T,T,T,T,T,T,F)])
library(class)
?knn()
predict <- knn(training[,c(F,T,T,T,T,T,T,T,T,T,F)],test[,c(F,T,T,T,T,T,T,T,T,T,F)],training[,c(F,F,F,F,F,F,F,F,F,F,T)],k=1)
table(Prediction=predict,Actual=test[,c(F,F,F,F,F,F,F,F,F,F,T)])



predict <- knn(training[,c(F,T,T,T,T,T,T,T,T,T,F)],test[,c(F,T,T,T,T,T,T,T,T,T,F)],training[,c(F,F,F,F,F,F,F,F,F,F,T)],k=2)
table(Prediction=predict,Actual=test[,c(F,F,F,F,F,F,F,F,F,F,T)])



predict <- knn(training[,c(F,T,T,T,T,T,T,T,T,T,F)],test[,c(F,T,T,T,T,T,T,T,T,T,F)],training[,c(F,F,F,F,F,F,F,F,F,F,T)],k=5)
table(Prediction=predict,Actual=test[,c(F,F,F,F,F,F,F,F,F,F,T)])



predict <- knn(training[,c(F,T,T,T,T,T,T,T,T,T,F)],test[,c(F,T,T,T,T,T,T,T,T,T,F)],training[,c(F,F,F,F,F,F,F,F,F,F,T)],k=10)
table(Prediction=predict,Actual=test[,c(F,F,F,F,F,F,F,F,F,F,T)])

