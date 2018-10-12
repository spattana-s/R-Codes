
#  Company    : Stevens 
#  Project    : R Bootcamp 
#  Purpose    : structures 
#  First Name  : Khasha
#  Last Name  : Dehnad
#  Id			    : 12345
#  Date       :
#  Comments   :

rm(list=ls())

############################################## ###
##   Step:
## 
##        matrix()
##        factor()
##        str()
##        %*%
##        t()
##        solve()
##        list()
##        rownames(),colnames()
##        dimnames()
##        data.frame()
##        View()
################### ###

## vector  ####
x<-1:9
mode(x)
typeof(x)
is.vector(x)
length(x)


## Factor()  ####
?factor()



cat<-c("good","bad","good","bad","bad","bad","good")


typeof(cat)
cat2<-factor(cat)
cat2
typeof(cat2)

cat3<-factor(cat,levels=(c("good","bad")))
cat3
catnumb<-as.numeric(cat3)



days<-c("Monday", "Sunday","Tuesday", "Wednesday"
        ,"Thursday",  "Saturday" )
days
days_factor<-factor(days)

days_factor<-factor(days,levels=(c("Monday", "Tuesday", "Wednesday"
                        ,"Thursday", "Friday", "Saturday", "Sunday"))
)

asint<-as.integer(days_factor)

mode(days)
typeof(days)
is.factor(days)

asnumb<-as.numeric(days)


days_factor<-factor(days)


days_factor
typeof(days_factor)
asnum_days_factor<-as.numeric(days_factor)
print(days_factor)


days_factor<-factor(days,levels=(c("Monday", "Tuesday", "Wednesday"
                                  ,"Thursday", "Friday", "Saturday", "Sunday"))
)

is.factor(days_factor)
 

## Matrix   ####
x<-1:9
?matrix()
is.matrix(x)
 
mx1<- matrix(x, nrow = 3, ncol = 3,byrow = FALSE)
is.matrix(mx1)
mx1


colnames(mx1)<-c("col1","col2","col3")
rownames(mx1)<-c("row1","row2","row3")
mx1

dimnames(mx1) <- list(c("a", "b","c"), c("d", "e","f"))
mx1


?str()
str(mx1)


mx1<- matrix(1:9, nrow = 3, ncol = 3,byrow = FALSE)
mx2<- matrix(c(2,0,1,4), nrow = 2, ncol = 2,byrow = FALSE) 




is.matrix(mx2)
colnames(mx2)<-c("c1","c2")
rownames(mx2)<-c("r1","r2")
mx2

## error appears 
mxadd<-mx1+mx2

mx1<- matrix(x, nrow = 3, ncol = 3,byrow = FALSE)
mx1

mx3<-matrix(11:19,nrow = 3, ncol = 3,byrow =TRUE)
mx3


mxadd1_3<-mx1+mx3
mx1
mx3
mxadd1_3


mxmult1_3<-mx1*mx3

mx1
mx3
mxmult1_3 


mxmult1_3_correct<- mx1 %*% mx3

mx1
mx3
mxmult1_3_correct
## matrix operations
 
mxt1<-t(mx1)
mxmult_correct<- mxt1 %*%mx1

## mx1 is singular matrix
invmx1<-solve(mx1)

 

## list   ####
my.lst <- list(34453, c("khasha", "Dehnad"), c(14.3,12,15,19))
my.lst



my.lst <- list(stud.id=34453, stud.name=c("First Name", "Last Name"), stud.marks=c(14.3,12,15,19))
is.list(my.lst)
mode(my.lst)
typeof(my.lst)
length(my.lst)

my.lst2<-list(seq=1:10,my.lst)




my.lst2[2]
 
 
my.lst2
str(my.lst2)




## data.frame   ####
my.dataset <- data.frame(site=c('A','B','C','D','E'),ph=c(7.4,6.3,8.6,7.2,8.9))
is.list(my.dataset)
is.data.frame(my.dataset)
is.matrix(my.dataset)
typeof(my.dataset)
length(my.dataset)

View(my.dataset)



data()


data(iris)

View(iris)
typeof(iris)
View(iris)
length(iris)
nrow(iris)
is.data.frame(iris)
y<-c(22,33,44)

ls()
## managing the enviornment
drop<-c("x","iris","drop")
?rm()
rm(list=drop)
?nrow()
nrow(iris)
rm(list=ls())

?read.csv

Titanic<-read.csv("C://Users/sanja/Google Drive/2ndSem/CS513_KDD_KashaDehnad/R_Raw_Data/Titanic_rows.csv")

View(Titanic)


avector<-c(1,2,3,4)
c
print(c)
second<-avector[2]
second
names(avector)<-c("first","second","third","fourth")
avector
typeof(avector)
avector[2]<-"E"
avector["second"]
avector[2]<-22
avector["second"]


my.lst <- list(34453, c("khasha", "Dehnad"), c(14.3,12,15,19))
my.lst
my.lst[2:3]
is.list(my.lst[2:3])
my.lst[2]
is.list(my.lst[2])
element2<-my.lst[[2]]
element2
is.list(element2)
is.vector(element2)
typeof(element2)
last_name<-my.lst[[2]][2]
last_name


data()



data(iris)
View(iris)
iris[2,3]
iris[4,3]
iris[,3]
iris[4,]
iris[10:15,3]
iris[10:15,1:3]

iris[c(3,5,10),c(3,2,4)]

tridcol_allrows<-iris[,-3]
tridcol_allrows
iris[3,]

subset2<-iris[c(T,F),c(2,3,4)]
subset2


mmnorm<-function(x,minx,maxx)
{z<-((x-minx)/(maxx-minx))
return(z)
}


mmnorm2<-function(x)
{z<-((x-min(x))/(max(x)-min(x)))
return(z)
}


myvector<-1:20
mmnorm2(myvector)

myvector<-1:20
mmnorm(myvector,min(myvector),max(myvector))


myvector<-1:20
maxx<-20
minx<-1
mmnorm4<-function(x)
{
  minx<-10
  z<-((x-minx)/(maxx-minx))
  y<-list(z,minx,maxx)
  return(y)
}
results<-mmnorm4(myvector)
results

results[[1]][2:10]

mmnorm4<-function(x)
{
  z<-((x-minx)/(maxx-minx))
  y<-list(z,minx,maxx)
  return(y)
}
results<-mmnorm4(myvector)
results




f_print<-function(x1,x2,x3,x4,x5)
{
  print(c('value of x1',x1))
  print(c('value of x2',x2))
  print(c('value of x3',x3))
  print(c('value of x4',x4))
  print(c('value of x5',x5))
}

f_print(1,2,3,4,5)


f_print(x2=10,x5=5,3,2,1)


data(iris)
length(iris)
nrow(iris)
iris_missing<-iris
View(iris_missing)
iris_missing[c(3,30,40),3]
iris_missing[c(3,30,40),3]<-NA
iris_missing[c(3,30,40),3]
summary(iris_missing)
boxplot(iris_missing[1:3])
hist(iris_missing$Sepal.Length)
pairs(iris_missing[1:2])
pairs(iris_missing[1:4])



?na.omit

?na.omit
iris_missing2<-na.omit(iris_missing)
length(iris_missing2)
nrow(iris_missing2)

installed.packages()



install.packages("modeest")
library(modeest)



?mlv


PL_mfv<-mlv(iris_missing$Petal.Length,method = "mfv", na.rm=TRUE)
PL_mfv
is.na(iris_missing$Petal.Length)
str(PL_mfv)



