library(lattice)
library(Hmisc)

source("script/preprocess.R")

ir <- data$Interest.Rate
el <- data$Employment.Length
fico.ranges <- cut2(data$FICO.Range.Upper, g=6)

par(mfrow=c(2,3))
for(fico.range in levels(fico.ranges)){
  indices <- fico.ranges == fico.range
  x <- el[indices]
  y <- ir[indices]
  
  medians <- sapply(split(y,x),median)
  ordered.levels <- levels(x)[order(medians, decreasing=T)]
  x <- factor(x, levels=ordered.levels)
  boxplot(y~x, axes=F)

  axis(2)
  axis(1,at=1:length(levels(x)), labels=ordered.levels,padj=1,cex.axis=0.8)
}

#plot(bwplot(ir~el | fico))



