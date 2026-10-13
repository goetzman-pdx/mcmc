s <- 100000
x <- rbeta(s, 2, 5)
x <- rbeta(s, 2, 3)
# With Imporance Sampling
mean((y > 0.8) * dbeta(y, 2, 5)/dbeta(y, 2, 3))
# Without Importance Sampling
mean((x > 0.8))