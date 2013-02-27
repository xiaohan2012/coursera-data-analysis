set.seed(12345)
data.matrix <- matrix(rnorm(400),nrow=40)
#image(data.matrix)
#heatmap(data.matrix)

set.seed(678910)
for(i in 1:40){
  flag <- rbinom(1,1,0.5)
  if (flag==1){
    data.matrix[i,] = data.matrix[i,] + rep(c(0,3), each=5)
  }
}

par(mfrow=c(1,3))

#heatmap(data.matrix)
hclust.obj <- hclust(dist(data.matrix))
data.matrix.ordered <- data.matrix[hclust.obj$order,]
image(t(data.matrix.ordered)[,nrow(data.matrix.ordered):1])
plot(rowMeans(data.matrix.ordered), 40:1, ylab="Row Means")
plot(colMeans(data.matrix.ordered), ylab="Column Means")
