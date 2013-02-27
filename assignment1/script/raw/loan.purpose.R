library(Hmisc)
library(lattice)

source("script/preprocess.R")

lp <- factor(data$Loan.Purpose, labels=sapply(strsplit(levels(data$Loan.Purpose),"_"), paste, collapse=" "))
ir <- data$Interest.Rate

medians <- sapply(split(ir,lp),median)
ordered.levels <- levels(lp)[order(medians, decreasing=T)]
lp <- factor(lp, levels=ordered.levels)

fico.ranges <- cut2(data$FICO.Range.Upper, g=2)

par(mfrow=c(2,1))
for(fico.range in levels(fico.ranges)){
  indices <- fico.ranges == fico.range
  x <- lp[indices]
  y <- ir[indices]
  
  medians <- sapply(split(y,x),median)
  ordered.levels <- levels(x)[order(medians, decreasing=T)]
  x <- factor(x, levels=ordered.levels)
  boxplot(y~x, axes=F)

  axis(2)
  axis(1,at=1:length(levels(x)), labels=sapply(ordered.levels,wordwrap,len=10),padj=1,cex.axis=0.8)
}
#plot(bwplot(ir~lp , layout=c(1,4)))
#axis(2)
#axis(1,at=1:length(levels(lp)), labels=sapply(ordered.levels,wordwrap,len=10),padj=1,cex.axis=0.85)

