data <- read.csv("data/population.csv")
#barplot(table(data$CIT), col="blue")
#hist(data$CIT,col="blue")
#barplot(table(data$AGEP))
hist(data$AGEP,breaks=1000)
#histgram can be drawn at certain intervals, the step can be coarse or fine.
#barplot is more straightforward/lower-level, I think
