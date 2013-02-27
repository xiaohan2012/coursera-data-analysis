library(Hmisc)
library(lattice)

source("script/preprocess.R")

lines <- cut2(data$Open.CREDIT.Lines, g=20)
ir <- data$Interest.Rate

fico.ranges <- cut2(data$FICO.Range.Upper, g=4)

plot(bwplot(ir~lines | fico.ranges, layout=c(2,2)))

#boxplot(ir~lines)

meds <- sapply(split(ir, lines), median)

