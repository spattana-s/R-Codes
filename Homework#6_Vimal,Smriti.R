
#  Course          : CS 513B
#  First Name      : Smriti 
#  Last Name       : Vimal
#  Id              : 10430059
#  purpose         : HW6


#########################################################


## remove all objects
rm(list=ls())


setwd('D:/Smriti MS/CS513/hw06')

#load Data
bcData<-read.csv('breast-cancer-wisconsin.data.csv',na.strings = '?')

#check for NAs - #16 NAs in Dataset
sum(is.na(bcData))



### remove all the records with missing value

?na.omit()
bcData2<-na.omit(bcData)
set.seed(123)
?ifelse
View(bcData2)
str(bcData2$Class)
#converting dependent variable to factor
bcData2$Class<-as.factor(bcData2$Class)
#removing Sample Column as it is an identifier column
bcData2<-bcData2[,2:11]

#split into training and testing
index<-sort(sample(nrow(bcData2),round(.25*nrow(bcData2))))
training<-bcData2[-index,]
test<-bcData2[index,]

#Random Forest
library(randomForest)
fit <- randomForest( Class~., data=training, importance=TRUE, ntree=2000)
fit
summary(fit)
features<-importance(fit)
varImpPlot(fit)
Prediction <- predict(fit, test)
table(actual=test[,10],Prediction)

wrong<- (test[,10]!=Prediction )
error_rate<-sum(wrong)/length(wrong)
paste0('The Random Forest model gives an Error Rate of:',round(error_rate*100,2),'%')
#Mean Decrease in Accuracy the number or proportion of observations that are incorrectly 
#classified by removing the feature (or values from the feature)
paste0('The three most important factors in terms of Mean Decrease Accuracy are:F6, F1 and F2')

#Naiive Bayes
library(class) 
library(e1071)
nBayes_all <- naiveBayes(Class ~., data =training)

## Naive Bayes classification using all variables 

Predicted_Class<-predict(nBayes_all,test)


table(NBayes_all=Predicted_Class,Class=test$Class)
NB_wrong<-sum(Predicted_Class!=test$Class)
NB_error_rate<-NB_wrong/length(Predicted_Class)
paste0('The Naive Bayes model gives an Error Rate of:',round(NB_error_rate*100,2),'%')





