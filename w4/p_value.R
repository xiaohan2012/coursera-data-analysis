library(UsingR)
data(galton)
data <- galton
fit <- lm(data$child ~ data$parent)

x <- seq(-20,20,length=100)
plot(x, dt(x, df=nrow(data)-2), type="l", lwd=4, col="blue")


                           
