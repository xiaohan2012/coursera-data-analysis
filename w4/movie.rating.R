#download.file("http://www.rossmanchance.com/iscam2/data/movies03RT.txt",destfile="./data/movies.txt")
data <- read.table("./data/movies.txt",sep="\t", header=T,quote="")

plot(data$score ~ jitter(as.numeric(data$rating)), pch=19,xaxt="n")
axis(side=1, at=unique(as.numeric(data$rating)), labels=unique(as.character(data$rating)))

score.means <- tapply(data$score, data$rating, mean)
points(1:4, score.means, pch="-", col="red", cex=5)

fit <- lm(data$score ~ as.factor(data$rating))
print(summary(fit))

#What is the relationship between G and the other three?
print(confint(fit))

'
                                2.5 %    97.5 %
(Intercept)                  53.42478 81.875222
as.factor(data$rating)PG    -28.11385  2.928133
as.factor(data$rating)PG-13 -26.47100  2.841772
as.factor(data$rating)R     -26.80328  2.763285
'
#as the confidence interval covers zero for PG,PG-13 and R, this indicates there is no difference between them and G average score(the intercept)

#What is the relationship between R and the other three?
#we need to rebuild the model
releveled.factor <- factor(as.factor(data$rating), levels=c("R","G","PG","PG-13"))
#or use relevel function
releveled.factor <- relevel(as.factor(data$rating), ref="R")

fit2 <- lm(data$score ~ releveled.factor)
print(summary(fit2))
print(confint(fit2))

#how to estimate the difference between any of the two types of movies
#use anova, analysis of variance
print(anova(fit))

#or use Tukey's method,this one is more straight-forward to me

print(TukeyHSD(aov(data$score ~ releveled.factor)))
