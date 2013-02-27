library(lattice)
library(Hmisc)

source("preprocess.R")
ir <- data$Interest.Rate
ll <- data$Loan.Length
fico <- cut2(data$FICO.Range.Upper, g=6)

pdf("figure/loan.length.pdf", width=8, height=4)
plot(bwplot(ir~ll|fico,xlab="Loan Duration",ylab="Interest Rate",main="Relationship between Interest Rate and Loan Duration under different FICO scores",
            panel = function(x,y,...){
  panel.bwplot(x,y,...)
  panel.lmline(x,y,col="red",...)
  }))
dev.off()
"
par(mfrow=c(2,3))
for(l in levels(fico)){
  selected.indices <- fico==l
  x <- ll[selected.indices]
  y <- ir[selected.indices]
  plot(x,y, main=l)
}

"
'
ir.60 <- ir[ll=="60 months"]
fico.60 <- fico[ll=="60 months"]
plot(sapply(split(ir.60, fico.60), median), type="o",ylim=c(0,0.22))

ir.30 <- ir[ll=="36 months"]
fico.30 <- fico[ll=="36 months"]
points(sapply(split(ir.30, fico.30), median), type="o")
'
