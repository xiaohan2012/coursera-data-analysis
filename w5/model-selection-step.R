data <- read.table("data/movies.txt", sep="\t", header=T, quote="")
data <- data[,-1] #remove the first column, movie name

fit <- lm(score ~ . , data=data)

final.fit <- step(fit)
