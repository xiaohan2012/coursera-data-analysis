set.seed(1234)
x <- rnorm(12, mean=c(1,2,3), sd=0.2)
y <- rnorm(12, mean=c(1,2,1), sd=0.2)

plot(x,y)

coords <- data.frame(x=x, y=y)
km.obj <- kmeans(coords, centers=3)
plot(x, y, col=km.obj$cluster, pch=19)
points(km.obj$centers, pch=3, col=1:3)

