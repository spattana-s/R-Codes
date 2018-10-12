#########################################################
##  Purpose: Create pretty classification tree
##  Developer: KD         
##
#########################################################

#########################################################
##  Step 0: Clear the environment
##           
##
#########################################################
rm(list=ls())


#########################################################
##  Step 1: Load the relavent packages
##           
##
#########################################################
installed.packages()

#install.packages("rpart")  # CART standard package
?install.packages()

#install.packages("rpart")
#install.packages("rpart.plot")     # Enhanced tree plots
#install.packages("rattle")         # Fancy tree plot
#install.packages("RColorBrewer")   # colors needed for rattle
library(rpart)
library(rpart.plot)  			# Enhanced tree plots
library(rattle)           # Fancy tree plot
library(RColorBrewer)     # colors needed for rattle
  
#########################################################
 
##  Step 2:  example
##           
##
#########################################################
 


rm(list=ls())

dsn<-
  read.csv("C://AIMS/Stevens_/CS513_datamining/Other/Titanic_rows.csv")
 

#View(dsn) 
#attach(dsn)
#detach(dsn)

set.seed(123)
?ifelse


index<-sort(sample(nrow(dsn),round(.25*nrow(dsn))))
training<-dsn[-index,]
test<-dsn[index,]

?rpart()
#Grow the tree 
CART_class<-rpart( Survived~.,data=training)
rpart.plot(CART_class)


CART_predict<-predict(CART_class,test)
str(CART_predict)
CART_predict_cat<-ifelse(CART_predict[,1]<=.5,'Yes','No')
table(Actual=test[,4],CART=CART_predict_cat)
CART_wrong<-sum(test[,4]!=CART_predict_cat)
CART_error_rate<-CART_wrong/length(test[,4])
CART_error_rate
CART_predict2<-predict(CART_class,test, type="class")
CART_wrong2<-sum(test[,4]!=CART_predict2)
CART_error_rate2<-CART_wrong2/length(test[,4])
CART_error_rate2 



rm(list=ls())
traininginput<-runif(50,min=0,max=100)
trainingoutput<-sqrt(traininginput)
trainingdata<-cbind(traininginput,trainingoutput)
colnames(trainingdata)<-c("Input","Output")
install.packages("neuralnet")
library("neuralnet")
net.sqrt<-neuralnet(Output~Input,trainingdata,hidden = 10,threshold = 0.01)
plot(net.sqrt)
testdata<-as.data.frame((1:10)^2)
View(testdata)
net.results<-compute(net.sqrt, testdata)
cleanoutput<-cbind(testdata,sqrt(testdata),as.data.frame(net.results$net.result))
colnames(cleanoutput)<-c("Input","Expected Output","Neural Net Output")
