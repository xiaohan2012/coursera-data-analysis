set.seed(1234)
x <- rnorm(12, mean=c(1,2,3), sd=0.2)
y <- rnorm(12, mean=c(1,2,1), sd=0.2)

plot(x, y, col=rep(c(1,2,3),4), pch=19)
text(x+0.05, y+0.05, labels=as.character(1:12))

coords <- data.frame(x=x, y=y)
dist.matrix = dist(coords)

hclust.obj <- hclust(dist.matrix)
plot(hclust.obj)
