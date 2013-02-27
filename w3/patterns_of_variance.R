set.seed(678910)
data <- matrix(rnorm(400), nrow=40)

set.seed(678910)
for(i in 1:40){
  coin.flip1 <- rbinom(1,1,0.5)
  coin.flip2 <- rbinom(1,1,0.5)
  if(coin.flip1) data[i,] <- data[i,] + rep(c(0,5), each=5)
  if(coin.flip2) data[i,] <- data[i,] + rep(c(0,5), 5)
}
hclust.obj <- hclust(dist(data))
data <- data[hclust.obj$order,]
#heatmap(data)

par(mfrow=c(1,4))
image(t(data)[,nrow(data):1])

svd1 <- svd(scale(data))
plot(svd1$v[,1], pch=19)
plot(svd1$v[,2], pch=19)
plot(svd1$d/sum(svd1$d))
