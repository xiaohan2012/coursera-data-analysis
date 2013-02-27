#Connections are quite handy for IO because it provides the same interface for other program to interact with different types of data resources

#like gzfile
con <- gzfile("data/camera.csv.gz","r")#remember to add "r"
data <- read.csv(con)
close(con)#remember to close the connection
print(head(data))

#Or use file
con <- file("data/camera.csv","r")
data <- read.csv(con)
close(con)
print(head(data))

#readLines, important params, n-> nmber of lines to read, encoding -> you get it
con <- file("data/camera.csv","r")
lines <- readLines(con)
print(head(lines))
close(con)

#Or from the web
#con <- url("http://simplystatistics.org","r")
#lines <- readLines(con)
#close(con)
#print(head(lines))


#Json in R
library(RJSONIO)
#download.file(url="https://data.baltimorecity.gov/api/views/dz54-2aru/rows.json?accessType=DOWNLOAD", destfile="data/camera.json", method="curl")
data.json <- fromJSON("data/camera.json")

#write table to file
#use write.table, opposite to read.table
#important params: file, sep, quote, sep, row.names, col.names

data.csv <- read.csv("data/camera.csv")
destfile = file("data/camera.5.cols.csv","w")
write.table(data.csv[,-1], sep=",", file=destfile)#[,-1] means exclude the last column
close(destfile)

data.csv <- read.csv("data/camera.5.cols.csv")
print(length(names(data.csv)))

#save R object into file
save(data.csv,data.json,file="data/some_vars.rda")
rm(list=ls())
print(ls())
load(file="data/some_vars.rda")
print(ls())

#snap shot of the whole working space
#add one more variable
feng <- "sb"
save.image(file="data/snapshot.rda")
rm(list=ls())
print(ls())
load("data/snapshot.rda")
print(ls())

#paste and paste0, paste0 is just paste with sep set to ""
#they can be used to concatenate strings
print(paste("hello","world"))
print(paste0("heelo"," ","world"))


#webpage scraping
#use the XML package to perform XPath Query
library(XML)

#more resources
