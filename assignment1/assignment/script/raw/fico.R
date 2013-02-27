library(Hmisc)
library(lattice)

source("script/preprocess.R")

fico <- cut2(data$FICO.Range.Upper, g=5)
ir <- data$Interest.Rate

pdf("fico.pdf", width=8,height=4)
boxplot(ir~fico,
        main="Relationship between FICO score and loan interest rate",
        xlab="FICO Score",
        ylab="Interest rate")

dev.off()
