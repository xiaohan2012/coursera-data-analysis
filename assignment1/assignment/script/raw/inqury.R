library(Hmisc)
library(lattice)

source("script/preprocess.R")

inquiry <- cut2(data$Inquiries.in.the.Last.6.Months, g=5)
ir <- data$Interest.Rate

fico.ranges <- cut2(data$FICO.Range.Upper, g=4)



pdf("inquiry.pdf", width=9, height=4)

plot(bwplot(ir~inquiry | fico.ranges, layout=c(2,2),
            xlab="Times of Being Inquired in the last 6 months",ylab="Interest Rate",main="Relationship between Interest Rate and Times of Being Inquired under different FICO scores",
            panel = function(x,y,...){
              panel.bwplot(x,y,...)
              panel.lmline(x,y,col="red",...) 
            }))

dev.off()
#boxplot(ir~inquiry)

meds <- sapply(split(ir, balance), median)
