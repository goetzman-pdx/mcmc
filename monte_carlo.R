s <- 10000
x <- rbeta(s, 2, 5)
# P(X > 0.5)
sum(x>0.5)/s

# E[X]
mean(x)

# Median X
quantile(x, 0.5)

# P(X > Y)
y <- rbeta(s, 2, 2)
sum(x>y)/s