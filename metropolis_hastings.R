s <- 10000
x_s <- NULL
x_s <- c(x_s, 0.5)
for (loop in 2:s) {
  
  # random walk
  x <- rnorm(1, x_s[loop-1], 1)
  # generate r
  a <- dbeta(x, 2, 5, log=TRUE)
  b <- dbeta(x_s[loop-1], 2, 5, log=TRUE)
  c <- dnorm(x, 0, 1, log=TRUE)
  d <- dnorm(x_s[loop-1], 0, 1, log=TRUE)
  r <- a - b + c - d
  # accept or reject proposal
  u <- log(runif(1, 0, 1))
  if (u < r) { x_s[loop] <- x } else { x_s[loop] <- x_s[loop-1] }
  
}
mean(x_s)