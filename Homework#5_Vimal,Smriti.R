
#  Course          : CS 513B
#  First Name      : Smriti 
#  Last Name       : Vimal
#  Id              : 10430059
#  purpose         : HW5


#########################################################


## remove all objects
rm(list=ls())


setwd('D:/Smriti MS/CS513/hw05')

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


index<-sort(sample(nrow(bcData2),round(.25*nrow(bcData2))))
training<-bcData2[-index,]
test<-bcData2[index,]


install.packages("C50")
library('C50')

# C50  classification 
C50_class <- C5.0(training$Class~.,data=training )

summary(C50_class )
dev.off()
plot(C50_class)
C50_predict<-predict( C50_class ,test , type="class" )
table(actual=test[,10],C50=C50_predict)
wrong<- (test[,10]!=C50_predict)
error_rate<-sum(wrong)/length(test[,10])
paste0('The C 5.0 model gives an Error Rate of:',round(error_rate*100,2),'%')




