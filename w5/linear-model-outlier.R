x <- seq(0,3,length=100)
y <- rcauchy(100)

par(mfrow=c(1,2))

slopes = rep(NA, 100)
for(i in 1:100){
  fit <- lm(y[-i] ~ x[-i])
  slopes[i] = fit$coeff[2]
}
plot(slopes, pch=19)

plot(x,y,pch=19)
fit1 <- lm(y~x)
abline(fit1, col="red", lwd=3)

#using robust linear regression can remove the outlier for you

library(MASS)

rfit <- rlm(y~x)
print(rfit$coeff)
print(fit1$coeff)

abline(rfit, col="blue", lwd=3)

#plot(fit) to see the default linear regression analysis plot
