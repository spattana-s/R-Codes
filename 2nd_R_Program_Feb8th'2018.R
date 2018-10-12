

myfirstname<-"Sanjay"
mylastname<-"Pattanayak"
myfirstlast<-c(myfirstname,mylastname)
myfirstlast
rm('myfirstname')
myfirstname
mylastname
myfirstname<-"Jack"
avector<-c(1,2,3,4)
avector
names(avector)<-c("one","two","three","four")
typeof(avector)
elementnames<-names(avector)
elementnames


x<-1:9
x
typeof(x)
is.vector(x)
length(x)

cat<-c("good","bad","good","bad","bad","bad","good")
cat
typeof(cat)
cat2<-factor(cat)
cat2
typeof(cat2)

cat3<-as.integer(cat)
cat4<-as.integer(cat2)
cat3
cat4



cat5<-factor(cat.levels=(c("good","bad"))
)
cat5


days<-c("Monday","Sunday","Tuesday","Wednesday","Thursday","Saturday")
days
days_factor<-factor(days)
days_factor

days_factor<-factor(days,levels = (c("Monday","Sunday","Tuesday","Wednesday","Thursday","Saturday","Friday"))
)

is.factor(days_factor)

x<-1:9                    
x
is.matrix(x)
mx1<-matrix(x, nrow = 3, ncol = 3, byrow = FALSE)
mx1
is.matrix(mx1)


colnames(mx1)<-c("col1","col2","col3")
rownames(mx1)<-c("row1","row2","row3")
mx1
dimnames(mx1)<-list(c("a","b","c"), c("d","e","f"))
mx1


#matrix multiplication

#mxmul<- mxt1%*%mxt2

#matrix addition

#mtrix transpose

mxt1<-t(mx1)
mxt1

#Inverse of a mtrix

invmx1<-solve(mx1)

