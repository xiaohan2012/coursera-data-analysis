load("data/samsungData.rda")
data <- samsungData
data.subject1 <- data[data$subject==1,]
activity <- as.numeric(as.factor(data.subject1$activity))

km <- kmeans(data.subject1[,-c(562,563)], centers=6, nstart=1)
print(table(km$cluster, activity))
