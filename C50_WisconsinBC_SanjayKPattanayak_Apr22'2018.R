
#  Major      : Business Intelligence and Analytics 
#  Subject    : CS-513/Knowledge Discovery in Databses 
#  Purpose    : Assignment-5/Create C4.5 classification tree
#  First Name : Sanjay Kumar 
#  Last Name  : Pattanayak
#  Id			    : 10431486
#  Date       : Apr'24th 2018
############################################## ### QUESTION 1 ############################################## ###
#5.1 Use Excel to construct a C4.5 decision tree to classify salary based on the other variables. 

############################################## ### QUESTION 2 ############################################## ###

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



#5.2Use the C5.0 methodology to develop a classification model for the Diagnosis.  


############################################## ### SOLUTION 1 ############################################## ###


#########################################################
##  Step 0: Clear the environment and load the data
##           
##
#########################################################



rm(list=ls())

#Assign CSV file name
BCW<-file("C://Users/sanja/Google Drive/2ndSem/CS513_KDD_KashaDehnad/Assignments/Assignment5_C50/breast-cancer-wisconsin.data.csv",'r')


#Read CSV file and name the file as EDA_BCW
dsn<-read.csv(BCW, header = TRUE)


#Close the CSV file
close(BCW)

### remove all the records with missing value(Not Required here as question states not to remove missing values)

#?na.omit()
#dsn2<-na.omit(dsn)
set.seed(123)
#?ifelse

View(dsn)

summary(dsn)

str(dsn)

#Converting the features into Factors
cols <- c("F1", "F2", "F3", "F4", "F5", "F6", "F7", "F8", "F9", "Class")
dsn[,cols] <- data.frame(apply(dsn[cols], 2, as.factor))


str(dsn)

index<-sort(sample(nrow(dsn),round(.25*nrow(dsn))))
training<-dsn[-index,]
test<-dsn[index,]


#install.packages("C50", repos="http://R-Forge.R-project.org")
#install.packages("C50")
library('C50')
View(dsn)
str(dsn)
summary(dsn)

# C50  classification 
#library('C50')
C50_class <- C5.0( Class~.,data=training )

summary(C50_class )
#dev.off()
plot(C50_class)
C50_predict<-predict( C50_class ,test , type="class" )
table(actual=test[,11],C50=C50_predict)
wrong<- (test[,11]!= C50_predict)
c50_rate<-sum(wrong)/length(test[,11])
c50_rate

##################

#Removing the Sample column as that is the identifier column and is not a factor in classification

dsn2<-dsn[,-1]
View(dsn2)

index1<-sort(sample(nrow(dsn2),round(.25*nrow(dsn2))))
training1<-dsn2[-index1,]
test1<-dsn2[index1,]


str(dsn2)


# C50  classification 
#library('C50')
C50_class <- C5.0(Class~.,data=training )

summary(C50_class )
#dev.off()
plot(C50_class)
C50_predict<-predict( C50_class ,test , type="class" )
table(actual=test[,10],C50=C50_predict)
wrong<- (test[,10]!= C50_predict)
c50_rate<-sum(wrong)/length(test[,10])
c50_rate


