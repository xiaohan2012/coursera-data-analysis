library(UsingR)
data(galton)
fit <- lm(galton$child ~ galton$parent)

pop.size <- 1e6
fake.data <- data.frame(parent=rep(NA,pop.size), child=rep(NA,pop.size))
fake.data$parent <- rnorm(pop.size, mean=mean(galton$parent), sd=sd(galton$parent))
fake.data$child <- fit$coef[1] + fit$coef[2] * fake.data$parent + rnorm(pop.size, sd=sd(fit$residual))

fits <- vector(length=100, mode="list")

for(i in 1:100){
  idx <- sample(1:1e6,50)
  subdata <- fake.data[idx,]
  fit.temp <- lm(subdata$child ~ subdata$parent)
  fits[[i]] <- fit.temp
}

plot(1:100, type="n")

for(i in 1:100){
  cint <- confint(fits[[i]])
  lower <- cint[1,1]
  upper <- cint[1,2]
  if(lower > fit$coef[1] | upper < fit$coef[1]) color="red"
  else color="gray"
  segments(lower, i, upper, i, col=color)
}
lines(rep(fit$coef[1],200),seq(1,100,length=200),col="black",lwd=5)
