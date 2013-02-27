data <- read.csv("data/hunger.csv")
data <- data[data$Sex != "Both sexes",]

fit <- lm(data$Numeric ~ data$Year + data$WHO.region + data$Year * data$WHO.region)


