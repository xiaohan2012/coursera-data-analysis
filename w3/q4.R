load("data/q4.rda")
data <- dataSet
km <- kmeans(data, centers=2, nstart=100)
plot(data$x,data$y, col=km$cluster)
points(km$centers, col=c("black","red"), pch=19)
