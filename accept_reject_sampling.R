s <- 100000
y <- rbeta(s, 2, 3)
u <- runif(s, 0, 1)
y_support <- seq(0.01, 0.99, length=1000)
m <- max(dbeta(y_support, 2, 5)/dbeta(y_support, 2, 3))
accepted <- u <= (((1/m)*(dbeta(y, 2, 5)/dbeta(y, 2, 3))))
sum(y[accepted]>0.5)/sum(accepted)