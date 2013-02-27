load("data/gaData.rda")
data <- gaData
data$julian = julian(data$date)
plot(data$julian, data$visit, pch=19, col="gray")
lm.fit <- lm(data$visit ~ data$julian)
pois.fit <- glm(data$visit ~ data$julian, family="poisson")

abline(lm.fit, col="red")
#Poission regression assumes a poission distribution of the data
lines(data$julian, pois.fit$fitted, col="blue")

#fitting rate

pois.fit1 <- glm(data$simplystats ~ data$julian, family="poisson", offset=log(data$visit + 1))
plot(data$julian,data$simplystats, pch=19, col="gray")
lines(data$julian, pois.fit1$fitted, col="red")
lines(data$julian, pois

#plot(data$julian,data$simplystats / (data$visit + 1), pch=19, col="gray")
#lines(data$julian, pois.fit1$fitted / (data$visit + 1), col="red")

