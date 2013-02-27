set.seed(678910)
data.matrix <- matrix(rnorm(400),nrow=40)

set.seed(678910)
for(i in 1:40){
  coin.flip1 <- rbinom(1,1,0.5)
  coin.flip2 <- rbinom(1,1,0.5)
  if (coin.flip1){
    data.matrix[i,] = data.matrix[i,] + rep(c(0,3), each=5)
  }
  if (coin.flip2){
    data.matrix[i,] = data.matrix[i,] + rep(c(0,3), 5)
  }
}

#heatmap(data.matrix)
image(t(data.matrix)[,nrow(data.matrix):1])
