#download.file("http://apps.who.int/gho/athena/data/GHO/WHOSIS_000008.csv?profile=text&filter=COUNTRY:*;SEX:*",destfile="data/hunger.csv")

data <- read.csv("data/hunger.csv")
data <- data[data$Sex != "Both sexes",]

plot(data$Numeric ~ data$Year, col=(data$Sex == "Male")*1+1, pch=19)

fit1 <- lm(data$Numeric ~ data$Year + data$Sex)#note the formula, considering female numeric with year and a constant addition for male
#abline(c(fit1$coeff[1],fit1$coeff[2]), col="red",lwd=4)
#abline(c(fit1$coeff[1]+fit1$coeff[3],fit$coeff[2]), col="black",lwd=4)

fit2 <- lm(data$Numeric ~ data$Year + data$Sex + data$Sex*data$Year)#note the formula, considering female numeric with year, a constant addition for male and also male's numeric relationship between year
#abline(c(fit1$coeff[1],fit1$coeff[2]), col="red",lwd=4)
#abline(c(fit1$coeff[1]+fit1$coeff[3],fit$coeff[2]), col="black",lwd=4)

#PS:
#Note the interactions between continues variables
