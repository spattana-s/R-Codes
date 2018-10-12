############################################## ### ###### ############################################## ###
#  Major      : Business Intelligence and Analytics 
#  Subject    : CS-513/Knowledge Discovery in Databses 
#  Purpose    : SVM IRIS Dataset
#  First Name : Sanjay Kumar 
#  Last Name  : Pattanayak
#  Id			    : 10431486
#  Date       : May9th 2018

############################################## ### SOLUTION ############################################## ###
## Step 0 clean up!!!


rm(list=ls())


#load IRIS data
data("iris")
View(iris)
sum(is.na(iris))
#EDA/summary of data
summary(iris)
str(iris)
#create test train data
train<-iris[c(T,T,T,T,F),]
test<-iris[c(F,F,F,F,T),]

#load library
library(e1071)

#train model
svm.model<-svm(Species~.,data=train)

#fit the model on test
pred.svm1<-predict(svm.model,test)

#Confusion Matrix
table(SVM_Prediction=pred.svm1,Actual=test$Species)

#Error Rate
SVM.wrong<-sum(pred.svm1!=test$Species)
SVM_error_rate<-SVM.wrong/length(pred.svm1)
#Error Rate of SVM model
print(paste('Accuracy of SVM Model is about:',round(SVM_error_rate*100,2),'%'))
SVM_error_rate
