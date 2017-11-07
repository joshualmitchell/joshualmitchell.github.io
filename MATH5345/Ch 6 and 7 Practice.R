setwd("/Users/jm/joshualmitchell.github.io/MATH5345/lec")
"Data.Example3.1.Delivery.txt"
x <- rnorm(10)
y <- rnorm(10)
fit1 <- lm(y ~ x)
print(influence.measures(fit1))
# Influence measures of fit1

