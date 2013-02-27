library(Hmisc)
library(lattice)

source("script/preprocess.R")

income <- cut2(data$Monthly.Income, g=5)
ir <- data$Interest.Rate

fico.ranges <- cut2(data$FICO.Range.Upper, g=4)

obj <- bwplot(ir~income | fico.ranges, layout=c(2,2))
plot(obj)
#boxplot(ir~income)
