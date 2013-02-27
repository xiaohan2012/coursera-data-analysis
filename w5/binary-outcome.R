load("data/ravensData.rda")
data <- ravensData
aov.obj <- aov(data$ravenWinNum ~ data$ravenScore + data$opponentScore)
fit <- lm(data$ravenWinNum ~ data$ravenScore)
#plot(data$ravenScore,fit$fitted)

#using logistic regression
log.fit <- glm(data$ravenWinNum ~ data$ravenScore, family="binomial")
print(summary(log.fit))
plot(data$ravenScore, log.fit$fitted)

exp(log.fit$coefficients)
#odd ratio greater than 1 means increases chances for 1
#less than 1 means decreases chances for 1

exp(confint(log.fit))
#ravenScore interval covers 1 means there is no significant relationship between raven score and its winning
