data <- read.csv("data/population.csv")

#png("graph.png", height=480, width=480*2)
pdf("graph.pdf", height=4, width=8)

par(mfrow=c(1,2))
hist(rnorm(1000),col="blue")
mtext(text="feng",side=1,line=3)
plot(data$JWMNP, data$WAGP, xlab="xlab", ylab="wages", main="ylab versus xlab", cex.lab=2, cex.axis=1.5, col=data$SEX)
legend(150,2e5, legend=c("male","female"), col=c("red","black"), pch=19, cex=1)
mtext(text="feng",side=3,line=1)

dev.off()#or dev.copy2pdf
