#Linear regression, basic assumption
#1, Variance is *constant*
#2, You are summarizing a *linear* trend
#3, You have all the right terms in the model
#4, There are no big outliers

y <- rnorm(100, mean=seq(0,3,length=100), sd=seq(0,3,length=100))
x <- seq(0,3,length=100)

fit <- lm(y ~ x)

par(mfrow=c(1,2))
plot(x,y,pch=19)
abline(fit, col="red", lwd=3)

plot(x, fit$residuals, pch=19)
abline(c(0,0), col="red", lwd=3)


