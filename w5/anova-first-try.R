#download.file("http://www.rossmanchance.com/iscam2/data/movies03RT.txt", destfile="./data/movies.txt")
data <- read.table("data/movies.txt", sep="\t", header=T, quote="")
aov.obj1 <- aov(data$score ~ data$rating + data$genre)
print(summary(aov.obj1)) #aov.obj1 and aov.obj2 are different, because this is a unbalanced dateset
aov.obj2 <- aov(data$score ~ data$genre + data$rating)
print(summary(aov.obj2))


