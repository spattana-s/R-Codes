#  First Name       : Khasha
#  Last Name        : Dehnad   
#  Purpose          : Apply naive bayes to the breast cancer data 
#                   :  
#  Creation date    : 

rm(list=ls())

bc<-
  read.csv("C://AIMS/Stevens_/2018_DataMining/Raw_Data/breast-cancer-wisconsin.data.csv",
           na.strings = "?")

bc2<-na.omit(bc)


#install.packages('e1071', dependencies = TRUE)

library(class) 
library(e1071)

## main functions used in this program
?read.csv()
?naiveBayes()
?tabulate();  tabulate(c(2,3,3,5), nbins = 10);
?table()
?ftable()
?as.character()

index <- seq (1,nrow(bc2),by=5)
test<-bc2[index,]
training<-bc2[-index,]


nBayes_bc2 <- naiveBayes(factor(Class)~., data =training[,-1])

## Naive Bayes classification using all variables 

category_all<-predict(nBayes_bc2,test[,-1]  )


table(NBayes=category_all,Survived=test$Class)
NB_wrong<-sum(category_all!=test$Class )
NB_error_rate<-NB_wrong/length(category_all)
NB_error_rate
