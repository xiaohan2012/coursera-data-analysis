data <- matrix(rnorm(400),nrow=40)
for(i in 1:nrow(data)){
  data[i,] <- rep(c(0,1),each=5)
}
#heatmap(data)

svd1 <- svd(data)

par(mfrow=c(1,3), pch=19)

image(t(data)[,nrow(data):1])
plot(svd1$d)
plot(svd1$d/sum(svd1$d))
