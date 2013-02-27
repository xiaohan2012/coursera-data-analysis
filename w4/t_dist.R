

xs <- seq(-5,5,length=100)
plot(xs,dnorm(xs), type="l", col="gray")
lines(xs,dt(xs,df=3),col="red")
lines(xs,dt(xs,df=10),col="blue")
