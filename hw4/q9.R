data(warpbreaks)
data <- warpbreaks
fit <- lm(data$breaks ~ relevel(data$tension,ref="H"))
print(confint(fit))
