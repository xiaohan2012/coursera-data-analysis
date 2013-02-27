data <- read.csv("data/population.csv")

dens <- density(data$AGEP)
male.dens <- density(data$AGEP[data$SEX==1])
plot(dens,lwd=5,col="orange")
lines(male.dens, lwd=3, col="blue")

#comparing multiple distributions is what histgram cannot do
