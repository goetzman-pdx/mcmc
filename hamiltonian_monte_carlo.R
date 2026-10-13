m <- 39.2
epsilon <- 0.2; L <- 5
s <- 10000
x_s <- NULL
x_s <- c(x_s, 0.5)
for (loop in 2:s) {
  
  x <- x_s[loop-1]
  # generate momentum
  phi <- rnorm(1, 0, sqrt(m))
  phi_start <- phi
  # leapfrog
  for (frog_loop in 1:L) {
    
    phi <- phi + (epsilon/2)*(1/x - 4/(1-x))
    x <- x + epsilon*(1/m)*phi
    phi <- phi + (epsilon/2)*(1/x - 4/(1-x))
    
  }
  # generate r
  a <- dbeta(x, 2, 5, log=TRUE)
  b <- dbeta(x_s[loop-1], 2, 5, log=TRUE)
  c <- dnorm(phi, 0, sqrt(m), log=TRUE)
  d <- dnorm(phi_start, 0, sqrt(m), log=TRUE)
  r <- a - b + c - d
  # accept or reject proposal
  u <- log(runif(1, 0, 1))
  if (u < r) { x_s[loop] <- x } else { x_s[loop] <- x_s[loop-1] }
  
}
mean(x_s)