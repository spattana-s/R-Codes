x<-rnorm(100)
x
head(x)
tail(x)
min(x)
mean(x)
mode(x)
frequency(x)
sd(x)
log10(10)
cos(0)
options(digits = 22)
pi
1/0
0/1
-1/0
0/0
y<-c(1,2,3,4,5,NA)
str(y)
rm.na(mean(y))
ls()
x*x
y*y
y[1]
y[5]
root1<-c((-3+sqrt(3**2-4*))/2))
root2<-c(-3-sqrt(3^2-4*))/2
3^2
3**2
x^2+3x+1=0
s1<-(-3-(sqrt(3^2-4*1*1)))/2
s2<-(-3+(sqrt(3^2-4*1*1)))/2
s1
x<-rnorm(100)
set.seed(1234)
x
x<-rnorm(100,mean=0.5,sd=.3)
mean(x)

sd(x)
hist(x,axis=FALSE)
?hist
axis=4
axis(4)
axis(1)


?paste()
paste("R String",1,sep=" hi ",collapse = "_")
data.frame(x=1:3,y=4:6)+2
data.frame(x=1:3,y=c("A","B","C"))+2
cube<-function(x){return(x*x*x)}
cube(1:5)
cuberoot<-function(x){return ((x)^(1/3))}
cuberoot(cube(1:5))
cuberoot(125)
cuberoot(27)
x<-seq(0,6,length=100)
x
y<-2*x+3+rnorm(100)
y
plot(x,y)
?plot(sin,0,2*pi)
f<-function(x){return (3*sin(x/2)+x)}
f(0)
f(pi)
f(-7:7)
curve(f,-7,7)
?sin
plot(sin,-pi,pi)
?cat()
?density
?"if"

