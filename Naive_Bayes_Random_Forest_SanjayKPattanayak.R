
#  Major      : Business Intelligence and Analytics 
#  Subject    : CS-513/Knowledge Discovery in Databses 
#  Purpose    : Assignment-5/Create C4.5 classification tree
#  First Name : Sanjay Kumar 
#  Last Name  : Pattanayak
#  Id			    : 10431486
#  Date       : Apr'24th 2018

############################################## ### QUESTION 1 ############################################## ###

## Question 2-The "breast cancer dataset" in CANVAS was obtained from the University of Wisconsin Hospitals, 
#Madison from Dr. William H. Wolberg. The features in the dataset, described below, have been categorized from 1 to 10.
#Use these categorized features to answer the following questions.
#Important: make sure your categories are represented by the "factor" data type in R and DO NOT replace the missing values.  

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
#7.1 Use the Naïve Bayes methodology to develop a classification model for the Diagnosis. 

############################################## ### QUESTION 1 ############################################## ###
#7.2 Use the Random Forest methodology to develop a classification model for the Diagnosis. What are the top three important features?
  
  
############################################## ### SOLUTION 1 ############################################## ###


#########################################################
##  Step 0: Clear the environment and load the data
##           
##
#########################################################


#install.packages('e1071', dependencies = TRUE)
 
library(class) 
library(e1071)

rm(list=ls())

#Assign CSV file name
BCW<-file("C://Users/sanja/Google Drive/2ndSem/CS513_KDD_KashaDehnad/Assignments/Assignment5_C50/breast-cancer-wisconsin.data.csv",'r')


#Read CSV file and name the file as EDA_BCW
dsn<-read.csv(BCW, header = TRUE)
#dsn<-na.omit(dsn)
#sum(is.na(dsn))
#Close the CSV file
close(BCW)

View(dsn)
### remove all the records with missing value(Not Required here as question states not to remove missing values)
dsn2<-dsn[,-1]

#?na.omit()
#dsn2<-na.omit(dsn)
set.seed(234)
#?ifelse

View(dsn2)

summary(dsn2)

str(dsn2)

#Converting the features into Factors
cols <- c("F1", "F2", "F3", "F4", "F5", "F6", "F7", "F8", "F9", "Class")
dsn2[,cols] <- data.frame(apply(dsn2[cols], 2, as.factor))


str(dsn2)

index<-sort(sample(nrow(dsn2),round(.25*nrow(dsn2))))
training<-dsn2[-index,]
test<-dsn2[index,]


nBayes_all <- naiveBayes(Class ~., data =training)

## Naive Bayes classification using all variables 

Predicted_Class<-predict(nBayes_all,test)


table(NBayes_all=Predicted_Class,Class=test$Class)
NB_wrong<-sum(Predicted_Class!=test$Class)
NB_error_rate<-NB_wrong/length(Predicted_Class)
paste0('The Naive Bayes model gives an Error Rate of:',round(NB_error_rate*100,2),'%')
NB_error_rate


#Random Forest
library(randomForest)
dsn2<-na.omit(dsn2)
str(dsn2)
index1<-sort(sample(nrow(dsn2),round(.25*nrow(dsn2))))
training1<-dsn2[-index1,]
test1<-dsn2[index1,]



fit <- randomForest( Class~., data=training1, importance=TRUE, ntree=2000)
fit
summary(fit)
features<-importance(fit)
varImpPlot(fit)
Prediction <- predict(fit, test1)
table(actual=test1[,10],Prediction)

wrong<- (test1[,10]!=Prediction )
error_rate<-sum(wrong)/length(wrong)
paste0('The Random Forest model gives an Error Rate of:',round(error_rate*100,2),'%')
#Mean Decrease in Accuracy the number or proportion of observations that are incorrectly 
#classified by removing the feature (or values from the feature)
paste0('The three most important factors in terms of Mean Decrease Accuracy are:F6, F2 and F3')
error_rate

