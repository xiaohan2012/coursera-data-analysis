x <- seq(0,3,length=100)
y <- rnorm(100,mean=x^3)

fit <- lm(y~x)

par(mfrow=c(1,2))

plot(x,y,pch=19)
abline(fit, col="red", lwd=3)

plot(x,fit$residuals, pch=19)
abline(c(0,0), col="red", lwd=3)
