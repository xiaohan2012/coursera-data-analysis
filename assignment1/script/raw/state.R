library(Hmisc)
library(lattice)


source("script/preprocess.R")

state <- data$State
ir <- data$Interest.Rate

state <- order.by.median(state,ir)

fico.ranges <- cut2(data$FICO.Range.Upper, g=4)

#plot(bwplot(ir~state | fico.ranges, layout=c(4,1)))
boxplot(ir~state,cex.axis=0.7)
