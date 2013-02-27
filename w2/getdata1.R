#Get data from the Internet
#use download.file
#important parameters url, destfile and method(for https in Mac and Linux)

#download.file(url="https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD",destfile="data/camera.csv", method="curl")

print(list.files("data"))

data <- read.table("data/camera.csv", sep=",", head=T)
#or simply read.csv("data/camera.csv")
print(head(data))

#Or read xlsx file
#download.file(url="https://data.baltimorecity.gov/api/views/dz54-2aru/rows.xlsx?accessType=DOWNLOAD", destfile="data/camera.xlsx", method="curl")
print(list.files("data"))

##file.choose() is quite useful but less reproducible
##a little eggache in Linux, because you have to type it
#data <- read.csv(file.choose())

#loading excel file
#read.xlsx2 is faster than xlsx
library(xlsx)
data <- read.xlsx2("data/camera.xlsx", sheetIndex=1)

