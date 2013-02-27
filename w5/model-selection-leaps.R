library(leaps)
data <- read.table("data/movies.txt", sep="\t", header=T, quote="")

data <- data[,-1]
regsub <- regsubsets(score~., data=data)
plot(regsub)
