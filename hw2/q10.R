data.pop <- read.csv("data/population.csv")
data.housing <- read.csv("data/housing.csv")
data.merged <- merge(data.pop, data.housing, by = "SERIALNO")

print(dim(data.merged))
