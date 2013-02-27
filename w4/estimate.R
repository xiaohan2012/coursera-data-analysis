library(UsingR)
data(galton)
fit <- lm(galton$child ~ galton$parent)

pop.size <- 1e6
fake.data <- data.frame(parent=rep(NA,pop.size), child=rep(NA,pop.size))
fake.data$parent <- rnorm(pop.size, mean=mean(galton$parent), sd=sd(galton$parent))
fake.data$child <- fit$coef[1] + fit$coef[2] * fake.data$parent + rnorm(pop.size, sd=sd(fit$residual))

fits <- vector(length=100,mode="list")

for(i in 1:100){
  idx <- sample(1:1e6,50)
  subdata <- fake.data[idx,]
  fit.temp <- lm(subdata$child ~ subdata$parent)
  fits[[i]] <- fit.temp
}


par(mfrow=c(1,2))
hist(sapply(fits,function (x){coef(x)[1]}), xlab="Intercept", col="blue")
hist(sapply(fits,function (x){coef(x)[2]}), xlab="Slope", col="blue")

"
> summary(fits[[1]])

Call:
lm(formula = subdata$child ~ subdata$parent)

Residuals:
    Min      1Q  Median      3Q     Max 
-5.5668 -1.0738  0.2559  1.0241  5.0506 

Coefficients:
               Estimate Std. Error t value Pr(>|t|)   
(Intercept)     33.3792    11.9672   2.789  0.00755 **
subdata$parent   0.5062     0.1754   2.886  0.00582 **
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1 

Residual standard error: 2.131 on 48 degrees of freedom
Multiple R-squared: 0.1479,	Adjusted R-squared: 0.1302 
F-statistic: 8.332 on 1 and 48 DF,  p-value: 0.005824
"
hist(sapply(fits,function (x){coef(x)[1]}), xlab="Intercept", col="blue", freq=F)#freq=F is important
lines(seq(-10,60,length=100), dnorm(seq(-10,60,length=100), mean=fits[[1]]$coeff[1], sd=summary(fits[[1]])$coeff[1,2]), col="red", lwd=3)
