data(warpbreaks)
data <- warpbreaks
aov.obj1 <- aov(breaks ~ tension + wool, data=data)
aov.obj2 <- aov(breaks ~ wool + tension, data=data)
