
#  Major      : Business Intelligence and Analytics 
#  Subject    : CS-513/Knowledge Discovery in Databses 
#  Purpose    : Assignment-7/Artificial Neural Network
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
#Implement a neural network model, with 10 hidden nodes, to classify the cells in the "Wisconsin breast cancer" 
#(wisc_bc_data.csv) dataset into malignant and benign.  

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
bc<-read.csv(BCW, header=TRUE)


#Close the CSV file
close(BCW)

#Perform EDA
View(bc)
sum(is.na(bc))

### perform EDS

summary(bc)
mean(bc$F2)
mean(bc$F6)
apply(bc[,c(-1,-11)],2,mean)


### remove all the records with missing value
### see mfv and median for other strategies
?na.omit()

#Making file with length euqal to bc file length but with value=1 for Benign class
benign<-ifelse(bc$Class==2,1,0)
#Making file with length euqal to bc file length but with value=1 for Malignant class
malignant<-ifelse(bc$Class==4,1,0)

#Perform EDA
str(benign)
summary(benign)
View(benign)

#Remove all NA values
bc2<- na.omit(data.frame(bc,benign,malignant))
#Perform EDA
View(bc2)
summary(bc2)
sum(is.na(bc2))
str(bc2)

#Create index
index <- seq (1,nrow(bc2),by=5)

#Make test file from index number and bc2 file
test<-bc2[index,]
#Make test file from index number and bc2 file
training<-bc2[-index,]

#Import library Neuralnet
library("neuralnet")
?neuralnet()

#Train with neuralnet with hidden nodes =10
net_bc2  <- neuralnet(benign+malignant~F1+F2+F3+F4+F5+F6+F7+F8+F9
                      ,training, hidden=10, threshold=0.01)


 

#Plot the neural network
plot(net_bc2)
?compute
#Test the data on test data set
net_bc2_results <-compute(net_bc2, test[,c(-1,-11,-12,-13)]) 
View(net_bc2_results)
class(net_bc2_results$net.result)
 

str(net_bc2_results)
#Create dataframe with test and Neural net values
resutls<-data.frame(Actual_Benign=test$benign,
                    Actual_Malignant=test$malignant,
                    ANN_Benign=round(net_bc2_results$net.result[,1]),
                    ANN_Malignant=round(net_bc2_results$net.result[,2]))


resutls2<-data.frame(Actual_Benign=test$benign,
                    Actual_Malignant=test$malignant,
                    ANN_Benign=round(net_bc2_results$net.result[,1]),
                    ANN_Malignant=round(net_bc2_results$net.result[,2])
                    ,Prediction=ifelse(round(net_bc2_results$net.result[,1])==1,'B','M'))

#Frequency table
table(Actual=resutls2$Actual_Malignant,Prediction=resutls2$Prediction)

#Calculating error rate
wrong<- (round(net_bc2_results$net.result[,1])!=test$benign )
error_rate<-sum(wrong)/length(wrong)
error_rate







