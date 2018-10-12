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

install.packages("rpart")
install.packages("rpart.plot")     # Enhanced tree plots
install.packages("rattle")         # Fancy tree plot
install.packages("RColorBrewer")   # colors needed for rattle
library(rpart)
library(rpart.plot)  			# Enhanced tree plots
library(rattle)           # Fancy tree plot



library(RColorBrewer)     # colors needed for rattle

dsn<-read.csv("C://Users/sanja/Google Drive/2ndSem/CS513_KDD_KashaDehnad/R_Raw_Data/Titanic_rows.csv")


mytree<-rpart(Survived~.,data=dsn)
mytree
table(dsn$Survived,dsn$Sex)
library(rpart.plot)
prp(mytree)

fancyRpartPlot(mytree)
