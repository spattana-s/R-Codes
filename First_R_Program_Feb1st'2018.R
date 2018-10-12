x<-25
x
hello<-"Hello World"
print(hello)
hello
y<-25
x+y

# ctrl + L to clear console

help()
help(c)
?c()
example(c)
help.start()


x<-c(1,2,2,5,5,10)

min(x)
max(x)
mean(x)

x<-c(1,2,2,NA,5,10)
min(x)
max(x)
mean(x)

?min()
min(x,na.rm=TRUE)

y<-mean(x,na.rm=TRUE)
y
summary(x)
summary(y)

ls()
?ls()
ll
help(rm())
?rm()
rm("x")
ls()
length(hello)
nchar(hello)
is.vector("hello")
mode(hello)

x1<-c(10,5,6,6,6,7)
x1
mode(x1)
x2<-c(1,2,3)
x2
x3<-x1+x2
x3
x4<-c(2,3,4,5)
x4
x5<-x1+x4

x6<-seq(from=10.2,to=26.5,by=2.1)
x6
typeof(x6)

x7<-1:6
x7
typeof(x7)

x8<-seq(from=1,to=6,by=1)
x8
typeof(x8)
x9<-as.integer(x8)
typeof(x9)
mode(x8)

