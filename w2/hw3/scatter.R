data <- read.csv("data/population.csv")

#plot(data$JWMNP, data$WAGP)

#plot(data$JWMNP, data$WAGP, pch=19)#change dot style

#plot(data$JWMNP, data$WAGP, pch=19, cex=0.5)#make point smaller

#plot(data$JWMNP, data$WAGP, pch=19, cex=0.5, col=data$SEX)#import third variable, sex

#percentage.age <- data$AGE / max(data$AGE)
#plot(data$JWMNP, data$WAGP, pch=19, col=data$SEX, cex = percentage.age)#point size vary with the age

#overlaying lines/ points
#plot(data$JWMNP, data$WAGP, pch=19, col=data$SEX, cex = percentage.age)
#lines(rep(100, dim(data)[1]),data$WAGP, lwd=5, col="grey")
#points(seq(100,0, length=10), seq(0,2e5, length=10), cex=1, col="red")

#library(Hmisc)
#age.group = cut2(data$AGE, g=4)
#plot(data$JWMNP, data$WAGP, col=age.group, pch=19, cex=0.6)

#too many points
x = rnorm(1e5)
y = rnorm(1e5)
#use sample
#sampled.indices <- sample(1e5, size=1000, replace=F)
#plot(x[sampled.indices], y[sampled.indices])

#or smooth scatter plot
#smoothScatter(x,y)#cool

library(hexbin)

hbo <- hexbin(x,y)
plot(hbo)#cool!
