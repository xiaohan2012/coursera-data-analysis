library(glm2)
data(crabs)

fit <- glm(Satellites ~ Width, data=crabs, family="poisson")
