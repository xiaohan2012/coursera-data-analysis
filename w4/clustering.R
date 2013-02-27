source("myclust.R")

load("data/samsungData.rda")
data <- samsungData
data.subject1 <- data[data$subject==1,]
activity <- as.numeric(as.factor(data.subject1$activity))

par(mfrow=c(1,2))

plot(data.subject1[,1], col=activity, pch=19)
legend(150, 0, legend=unique(data$activity), col=unique(activity), pch=19)

plot(data.subject1[,2], col=activity, pch=19)
legend(150, -0.3, legend=unique(data$activity), col=unique(activity), pch=19)

dist.matrix <- dist(as.matrix(data.subject1[,1:3]))
hclust.obj <- hclust(dist.matrix)
myplclust(hclust.obj, lab.col=activity)
                    

#use two other better columns
par(mfrow=c(1,2))
plot(data.subject1[,10], col=activity, pch=19)
plot(data.subject1[,11], col=activity, pch=19)

par(mfrow=c(1,1))
dist.matrix <- dist(as.matrix(data.subject1[,10:12]))
hclust.obj <- hclust(dist.matrix)
myplclust(hclust.obj, lab.col=activity)
#red, black and green mixed together, we need a way to split them apart

#using svd to find the features
svd1 <- svd(scale(data.subject1[,-c(562,563)]))
par(mfrow=c(1,2))

plot(svd1$u[,1], col=activity, pch=19)
plot(svd1$u[,2], col=activity, pch=19)#this feature distinguish more on red, black and green

par(mfrow=c(1,1))

plot(svd1$v[,2], pch=19)

max.index <- order(svd1$v[,2], decreasing=T)[1:5]
dist.matrix <- dist(as.matrix(data.subject1[,c(10:12,max.index)]))
hclust.obj <- hclust(dist.matrix)
myplclust(hclust.obj, lab.col=activity)

