library(ElemStatLearn)
data(zip.train)


par(mfrow=c(1,2))

im8 = zip2image(zip.train,8)
image(im8)

im18 = zip2image(zip.train,18)
image(im8)

svd8 <- svd(im8)
svd18 <- svd(im18)


plot(svd8$d^2/sum(svd8$d^2))
plot(svd18$d^2/sum(svd18$d^2))
