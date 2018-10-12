#  Course          :  
#  First Name      : Khasha
#  Last Name       : Dehnad
#  Id              : 12345
#  purpose         :  

## Step 0 clean up!!!


rm(list=ls())

#install.packages('randomForest')

library(randomForest)

bc<-
  read.csv("C://AIMS/Stevens_/2018_DataMining/Raw_Data/breast-cancer-wisconsin.data.csv",
           na.strings = "?")

bc2<-na.omit(bc)


index <- seq (1,nrow(bc2),by=5)
test<-bc2[index,]
training<-bc2[-index,]


fit <- randomForest( factor(Class)~., data=training[,-1], importance=TRUE, ntree=1000)
importance(fit)
varImpPlot(fit)
Prediction <- predict(fit, test[,-1])
table(actual=test$Class ,Prediction)


wrong<- (test$Class!=Prediction )
error_rate<-sum(wrong)/length(wrong)
error_rate 



