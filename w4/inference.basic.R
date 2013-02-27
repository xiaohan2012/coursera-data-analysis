library(UsingR)
data(galton)
fit <- lm(galton$child ~ galton$parent)
#lines(galton$parent, fit$fitted, col="red", lwd=3)

pop.size <- 1e6
fake.data <- data.frame(parent=rep(NA,pop.size), child=rep(NA,pop.size))
fake.data$parent <- rnorm(pop.size, mean=mean(galton$parent), sd=sd(galton$parent))
fake.data$child <- fit$coef[1] + fit$coef[2] * fake.data$parent + rnorm(pop.size, sd=sd(fit$residual))

smoothScatter(fake.data$parent, fake.data$child, pch=19)
abline(fit, col="red", lwd=5)


#sampling a smaller set

idx <- sample(1:1e6,50)
subdata <- fake.data[idx,]

plot(subdata$parent, subdata$child, pch=19, col="gray")

fit2 <- lm(subdata$child ~ subdata$parent)
abline(fit2,col="blue")
abline(fit,col="red")

#sampling multiple times
smoothScatter(fake.data$parent, fake.data$child, pch=19)

fits <- vector(length=100, mode="list")

for(i in 1:100){
  idx <- sample(1:1e6,50)
  subdata <- fake.data[idx,]
  fit.temp <- lm(subdata$child ~ subdata$parent)
  fits[[i]] <- fit.temp
}

for(i in 1:100){  
  abline(fits[[i]],col="blue", lty=2)
}
abline(fit, col="red", lwd=5)

par(mfrow=c(1,2))
hist(sapply(fits,function (x){x$coef[1]}), breaks=50, xlab="Intercept")
