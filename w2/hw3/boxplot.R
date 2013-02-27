data <- read.csv("data/population.csv")
#boxplot(data$AGEP)
boxplot(data$AGEP ~ as.factor(data$DDRS),varwidth=T, col = c("magenta","red"), names= c("yes","no"))
