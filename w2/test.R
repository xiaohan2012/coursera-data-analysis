library(kernlab)
data(spam)#Load data

set.seed(3435)#ensure reproducibility

trainIndicator <- rbinom(nrow(spam), 1, 0.5)

trainSet <- spam[trainIndicator == 1,]
testSet <- spam[trainIndicator == 0,]

#exploratory data anaylysis

names(trainSet)

head(trainSet)

summary(trainSet)

table(trainSet$type)

#plot(trainSet$capitalAve ~ trainSet$type)

#plot(log10(trainSet$capitalAve + 1) ~ trainSet$type)#make it more disperse


#relationship between the first two predictors
#plot(log10(trainSet[,1:4] + 1))#don't forget the add 1 here

#clustering
#clusters <- hclust(dist(t(trainSet[,1:57])))#don't forget to transpose the matrix
#plot(clusters)

#new clustering
#clusters <- hclust(dist(t(log10(trainSet[,1:57] + 1))))#cool
#plot(clusters)

#statistical prediction/modeling
trainSet$numType <- as.numeric(trainSet$type) - 1
costFunction <- function(x,y){
  sum(x != (y > 0.5))
}
cvError = rep(NA,50)
library(boot)
for( i in 1:55) {
  lmFormula <- as.formula(paste("numType~",names(trainSet)[i],sep=""))
  #glmFit <- glm(lmFormula, family = "binomial", data = trainSet)
  #cvError[i] <- cv.glm(trainSet,glmFit, costFunction, 2)$delta[2]
}
#print(names(trainSet)[which(cvError == min(cvError))])
predictionModel <- glm(numType ~ charDollar, family = "binomial", data = trainSet)

#test and get measure of uncertainty/inaccuracy
predictedResult <- predict(predictionModel, testSet)
predictedSpam <- rep("nospam", nrow(testSet))
predictedSpam[predictionModel$fitted > 0.5] <- "spam"
print(table(predictedSpam, testSet$type))

