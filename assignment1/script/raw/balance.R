library(Hmisc)
library(lattice)

source("script/preprocess.R")

balance <- cut2(data$Revolving.CREDIT.Balance, g=10)
ir <- data$Interest.Rate

fico.ranges <- cut2(data$FICO.Range.Upper, g=4)

'
plot(bwplot(ir~balance | fico.ranges, layout=c(2,2),panel = function(x,y,...){
  panel.bwplot(x,y,...)
  panel.lmline(x,y,col="red",...) 
}))
'
boxplot(ir~lines)

meds <- sapply(split(ir, balance), median)

