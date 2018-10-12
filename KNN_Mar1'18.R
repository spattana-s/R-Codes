library()
installed.packages()
library(class)
?knn()
data()
data("iris")
View(iris)
data(iris)

?sample()
range_1_100<-1:100
sample(range_1_100,80)
smpl80<-sort(sample(range_1_100,80))
smpl80
?sort

nrow(iris)*.65
idx<-sort(sample(nrow(iris),as.integer(.65*nrow(iris))))
idx

training<-iris[idx,]

test<-iris[-idx,]

test

training


library(class)
?knn



training2<-training[,-5]
test2<-test[,-5]
outcome<-training[,5]
knn(training[,-5],test[,-5],training[,5])


predict<-knn(training[,-5],test[,-5],training[,5],k=3)
table(Prediction=predict, Actual=test[,5])


mmnorm<-function(x,minx,maxx){z<-((x-minx)/(maxx-minx))
return(z)
}


mmnorm(5,0,10)


iris_normalized <- as.data.frame(
  cbind(Sepal.Length=mmnorm(iris[,1],min(iris[,1]),max(iris[,1])),
        Sepal.Width=mmnorm(iris[,2],min(iris[,2]),max(iris[,2])),
        Petal.Length=mmnorm(iris[,3],min(iris[,3]),max(iris[,3])),
        Petal.Width=mmnorm(iris[,4],min(iris[,4]),max(iris[,4])),
        Species=iris[,5]
  )
)

idx <- sort(sample(nrow(iris_normalized),as.integer(.65*nrow(iris_normalized))))

training <- iris_normalized[idx,]
test <- iris_normalized[-idx,]


View(training[,-5])
View(test[,-5])

?knn()
predict <- knn(training[,-5],test[,-5],training[,5],k=3)
table(Prediction=predict,Actual=test[,5])



