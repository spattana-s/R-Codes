
#  Major      : Business Intelligence and Analytics 
#  Subject    : CS-513/Knowledge Discovery in Databses 
#  Purpose    : Assignment-3/Exploratory Data Analysis 
#  First Name : Sanjay Kumar 
#  Last Name  : Pattanayak
#  Id			    : 10431486
#  Date       : Mar'4th 2018



############################################## ### QUESTION 1 ############################################## ###

## Question 1-Load the "breast-cancer-wisconsin.data.csv" from canvas into R and perform the EDA analysis by:
##  I.	Summarizing each column (e.g. min, max, mean )
## II.	Identifying missing values
##III.	Replacing the missing values with the "mode" (most frequent value) of the column.
## IV.	Displaying the frequency table of "Class" vs. F6
##  V.	Displaying the scatter plot of F1 to F6, one pair at a time
## VI.	Show histogram box plot for columns F7 to F9


############################################## ### SOLUTION 1 ############################################## ###

#Remove Objects from a Specified Environment 
rm(list=ls())

#Assign CSV file name
BCW<-file("C://Users/sanja/Google Drive/2ndSem/CS513_KDD_KashaDehnad/Assignments/Assignment2/breast-cancer-wisconsin.data.csv",'r')

#Read CSV file and name the file as EDA_BCW
EDA_BCW<-read.csv(BCW, header = TRUE)

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


##Finding the "mode" (most frequent value) of the column.
library(modeest)
PL_mfv<-mlv(EDA_BCW$F6 , method = "mfv",na.rm = TRUE)

#Check structure of PL_mfv
str(PL_mfv)

##III.	Replacing the missing values with the "mode" (most frequent value) of the column.
EDA_BCW[is.na(EDA_BCW$F6),"F6"]<-PL_mfv$M

#View the data table
View(EDA_BCW)

#Check the structure
str(EDA_BCW)

#Get the summary of the table
summary(EDA_BCW)
summary(EDA_BCW$F6)

## IV.	Displaying the frequency table of "Class" vs. F6
FT<-table(EDA_BCW$Class,EDA_BCW$F6)
FT
margin.table(FT,1)
margin.table(FT,2)


##  V.	Displaying the scatter plot of F1 to F6, one pair at a time
plot(EDA_BCW[,2:3])
plot(EDA_BCW[,2:4])
plot(EDA_BCW[,2:5])
plot(EDA_BCW[,2:6])
plot(EDA_BCW[,2:7])
plot(EDA_BCW[,3:4])
plot(EDA_BCW[,3:2])
plot(EDA_BCW[,3:5])
plot(EDA_BCW[,3:6])
plot(EDA_BCW[,3:7])
plot(EDA_BCW[,4:2])
plot(EDA_BCW[,4:3])
plot(EDA_BCW[,4:5])
plot(EDA_BCW[,4:6])
plot(EDA_BCW[,4:7])
plot(EDA_BCW[,5:2])
plot(EDA_BCW[,5:3])
plot(EDA_BCW[,5:4])
plot(EDA_BCW[,5:6])
plot(EDA_BCW[,5:7])
plot(EDA_BCW[,6:2])
plot(EDA_BCW[,6:3])
plot(EDA_BCW[,6:4])
plot(EDA_BCW[,6:5])
plot(EDA_BCW[,6:7])
plot(EDA_BCW[,7:1])
plot(EDA_BCW[,7:2])
plot(EDA_BCW[,7:3])
plot(EDA_BCW[,7:4])
plot(EDA_BCW[,7:5])
plot(EDA_BCW[,7:6])

pairs(EDA_BCW[2:7], main = "Scatter Plot")

## VI.	Show histogram box plot for columns F7 to F9
hist(EDA_BCW$F7)
hist(EDA_BCW$F8)
hist(EDA_BCW$F9)


############################################## ### QUESTION 2 ############################################## ###

##2- Delete all the objects from your R- environment. Reload the "breast-cancer-wisconsin.data.csv" from canvas 
##   into R. Remove any row with a missing value in any of the columns.

############################################## ### SOLUTION 2 ############################################## ###

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


