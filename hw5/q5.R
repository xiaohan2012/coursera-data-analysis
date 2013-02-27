library(MASS)
data(quine)
lm1 = lm(log(Days + 2.5) ~.,data=quine)
selected.fit <- step(lm1)
