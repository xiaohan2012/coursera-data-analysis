fileUrl <- "http://earthquake.usgs.gov/earthquakes/catalogs/eqs7day-M1.txt"
#download.file(fileUrl,destfile="./data/earthquakeData.csv",method="curl")
#date.downloaded <- "Thu Jan 31 15:05:25 2013"
data <- read.csv("data/earthquakeData.csv")

ncol(data)
nrow(data)
dim(data)
names(data)#column names
sapply(data[1,],class)#column datatypes

quantile(data$Lon)#or boxplot(data$Lon) for better viz
summary(data)

unique(data$Version)#like set in Python
# [1] 1 0 9 4 5 6 3 8 2 A D B 7 C
#Levels: 0 1 2 3 4 5 6 7 8 9 A B C D
table(data$Version)#frequency

#  0   1   2   3   4   5   6   7   8   9   A   B   C   D 
#146 181 367  62  31  23  22  12  17  69  11   3   1   2

table(data$Version,data$Src)#cool, isn't?
#   
#     ak  ci  hv  mb  nc  nm  nn  pr  se  us  uu  uw
#  0   0  37   0   0  78   0   0  31   0   0   0   0
#  1  96   0  14   0  59   0   0   0   0   0   0  12
#  2 179  84  12   6  68   0   0   0   0   1  11   6
#  3  15   4   0   0  30   0   0   0   0   2   3   8
#  4   0   2   1   0   9   0   0   0   0  12   7   0
# .... omitted

#any NA for Lat?
any(is.na(data$Lat))#False

#no missing value for Version?
all(!is.na(data$Version))#True

#subsetting
data[ data$Lat>0 & data$Lon>0, c("Lat","Lon")]
#        Lat      Lon
#24  49.8770 150.7514
#86  10.5744 126.9572
#96  16.9495  96.1267
#99  10.4223 126.9224

#Or subsetting using the subset function, achieves the same result
subset(data,Lat>0 & Lon>0, select = c("Lat","Lon"))


#colSum, colMeans
#rowSum, rowMeans
#are alse quite handy
