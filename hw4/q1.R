#download.file("https://spark-public.s3.amazonaws.com/dataanalysis/movies.txt",destfile="data/movies.txt",method="curl")
data <- read.table("data/movies.txt",sep="\t", header=T,quote="")
fit1 <- lm(data$score ~ data$box.office)
fit2 <- lm(data$score ~ data$box.office + data$running.time)

ordered.index <- order(data$running.time)
data1 <- data[ordered.index,]
data1 <- data1[1:138,]
plot(data1$score~data1$running.time)

fit.140 <- lm(data$score ~ data$running.time)
fit.138 <- lm(data1$score ~ data1$running.time)

fit3 <- lm(data$score ~ data$running.time + data$rating + data$rating * data$running.time )
