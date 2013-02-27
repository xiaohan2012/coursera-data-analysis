library(Hmisc)
library(lattice)

source("script/preprocess.R")
#ai <- cut2(data$Amount.Funded.By.Investors, g=4)
ai <- cut2(data$Amount.Requested, g=4)

ir <- data$Interest.Rate
fico.ranges <- cut2(data$FICO.Range.Upper, g=6)

pdf("amount.by.investor.pdf", width=9, height=4)
plot(bwplot(ir ~ ai | fico.ranges, xlab="Loan Amount Requested",ylab="Interest Rate",main="Relationship between Interest Rate and Loan Amount Requested under different FICO scores",
            panel=function(x,y,...){
              panel.bwplot(x,y,...)
              panel.lmline(x,y,col="red",...)              
            }))
#plot(bwplot(ir ~ ai))
dev.off()

#pdf("ar.pdf")
'
plot(0,0,type="n", ylim=c(0,0.25), xlim=c(0.5,4.5))
for(fico.range in levels(fico.ranges)){
  idx <- fico.ranges == fico.range
  x <- ai[idx]
  y <- ir[idx]
  y <- sapply(split(y,x), median)
  #print(y)
  lines(y,type="o")
}
'
#dev.off()
'
plot(data$Amount.Requested, data$Amount.Funded.By.Investors,
     xlab="Requsted loan amount",
     ylab="Amount funded by investor",
     main="Relationship between requsted loan amount and amount funded by investor")
'
