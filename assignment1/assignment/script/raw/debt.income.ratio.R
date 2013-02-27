library(Hmisc)
library(lattice)

source("script/preprocess.R")

d2ir <- cut2(data$Debt.To.Income.Ratio, g=5)
ir <- data$Interest.Rate

fico.ranges <- cut2(data$FICO.Range.Upper, g=4)

plot(bwplot(ir~d2ir | fico.ranges, layout=c(4,1)))

