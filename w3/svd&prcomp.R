set.seed(12345)
data.matrix <- matrix(rnorm(400),nrow=40)

set.seed(678910)
for(i in 1:40){
  flag <- rbinom(1,1,0.5)
  if (flag==1){
    data.matrix[i,] = data.matrix[i,] + rep(c(0,3), each=5)
  }
}

par(mfrow=c(1,3), cex.lab=1.5)

image(t(data.matrix.ordered[nrow(data.matrix.ordered):1,]))

hclust.obj <- hclust(dist(data.matrix))
data.matrix.ordered <- data.matrix[hclust.obj$order,]

svd.obj <- svd(scale(data.matrix.ordered))#remember to scale

plot(svd.obj$u[,1], 40:1, ylab="Weight of the first feature for row observations")
plot(svd.obj$v[,1], ylab="Weight of the first feature for column observations")

#singular value comparision
par(mfrow=c(1,2), pch=19, cex.lab=1.5)
plot(svd.obj$d, ylab="Singular Value")
plot(svd.obj$d/sum(svd.obj$d), ylab="Percentage of variance explained")

#PCA and SVD are the same in some cases
par(mfrow=c(1,1),pch=19, cex.lab=1.5)
pca <- prcomp(data.matrix.ordered, scale=T)#remember to scale
plot(svd.obj$v[,1], pca$rotation[,1], ylab="Principal Component", xlab="SVD")
abline(c(0,1))

