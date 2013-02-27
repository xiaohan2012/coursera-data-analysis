library(UsingR)
data(galton)
par(mfrow=c(1,2))

hist(galton$child, breaks=100)
hist(galton$parent, breaks=100)

par(mfrow=c(1,1))
plot(galton$parent, galton$child, pch=19)

near68 <- galton[abs(galton$parent-68)<1,]
points(near68$parent,near68$child, pch=19, col="red")

near68.mean <- mean(near68$child)
lines(seq(67,69,length=100),rep(near68.mean,100), col="red", lwd=8)

#fit the children's and parents' height
fit <- lm(galton$child ~ galton$parent)
lines(galton$parent, fit$fitted, col="red", lwd=3)

#fitting the residual and parents' height
fit <- lm(fit$residual ~ galton$parent)
plot(galton$parent , fit$residual)
lines(galton$parent, fit$fitted, col="red", lwd=3)
