library(Hmisc)
library(lattice)


source("script/preprocess.R")

ownership <- data$Home.Ownership
ir <- data$Interest.Rate

ownership <- order.by.median(ownership,ir)

fico.ranges <- cut2(data$FICO.Range.Upper, g=4)

plot(bwplot(ir~ownership | fico.ranges, layout=c(4,1)))
#boxplot(ir~ownership,cex.axis=0.7)
