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









