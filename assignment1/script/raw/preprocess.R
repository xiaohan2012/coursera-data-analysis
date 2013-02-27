wordwrap<-function(x,len) paste(strwrap(x,width=len),collapse="\n")

percent2numeric <- function (s){
  as.numeric(substr(s,1,nchar(s)-1)) / 100 
}


order.by.median  <- function(x,y){
  medians <- sapply(split(y,x),median)
  ordered.levels <- levels(x)[order(medians, decreasing=T)]
  factor(x, levels=ordered.levels)
}

data <- read.csv("../../data/loansData.csv", stringsAsFactors = F)

data$Interest.Rate <- sapply(data$Interest.Rate, percent2numeric)
data$Debt.To.Income.Ratio <- sapply(data$Debt.To.Income.Ratio, percent2numeric)

data$FICO.Range.Upper <- sapply(data$FICO.Range, function (s) {as.numeric(strsplit(s,"-")[[1]][2])})
data$FICO.Range.Lower <- sapply(data$FICO.Range, function (s) {as.numeric(strsplit(s,"-")[[1]][1])})

#data$Loan.Length <- sapply(data$Loan.Length, function(s) {as.numeric(regmatches(s,regexpr("([0-9]+)",s)))})

data$Employment.Length <- sapply(data$Employment.Length, function(s,as.factor=T) {
  if(as.factor) {f <- factor}
  else {f <- function(x){x}}
  
  s <- strsplit(s," ")[[1]][1]
  if(s == "<") f(0)
  else if(s=="10+") f(10)
  else if(s=="n/a") f(NA)
  else f(as.numeric(s))
},T)


data$State <- sapply(data$State, as.factor)
data$Loan.Purpose <- sapply(data$Loan.Purpose, as.factor)

data$Home.Ownership <- sapply(data$Home.Ownership, as.factor)
data$Loan.Length <- sapply(data$Loan.Length, as.factor)


#print(sapply(data,class))

#plot(data$ir,data$fico,pch=19)
