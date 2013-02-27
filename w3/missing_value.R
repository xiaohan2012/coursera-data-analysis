set.seed(678910)
data <- matrix(rnorm(400), nrow=40)
data[sample(1:400,size=40,replace=F)] <- NA
svd(scale(data))
