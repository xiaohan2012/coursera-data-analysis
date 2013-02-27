reviews <- read.csv("data/reviews.csv")
solutions <- read.csv("data/solutions.csv")

#change column names
names(reviews) <- gsub("_", "", names(reviews))
names(solutions) <- gsub("_", "", names(solutions))

#cut quantitative variable values into ranges
#and add an extra variable
reviews$timeleftranges <- cut(reviews$timeleft, seq(0,3600,600))
table(reviews$timeleftranges)

#or makes ranges each of which has approximated the same number of observations
#use cut2 in Hmisc
library(Hmisc)
similar.size.ranges <- cut2(reviews$timeleft,g=6)
table(similar.size.ranges)
table(similar.size.ranges,useNA="ifany") #include NA statistics

merge(reviews, solutions)

merge(reviews, solutions, all=T)

merge(reviews, solutions, by.x = "solutionid", by.y = "id")

#`order` function takes a list of vectors and order by cascadingly
ordered.index <- order(reviews$reviewerid, reviews$id)
ordered.reviews <- reviews[ordered.index,]
print(head(ordered.reviews))

data.pop <- read.csv("data/population.csv")
data.housing <- read.csv("data/housing.csv")


