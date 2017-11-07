setwd("/Users/jm/joshualmitchell.github.io/MATH5345/lec/")
delivery_data <- read.table("Data.Example3.1.Delivery.txt", header=T)

# Chapter 6

x <- rnorm(10)
y <- rnorm(10)
fit1 <- lm(y ~ x)
print(influence.measures(fit1))
# Influence measures of fit1

delivery.lm <- lm(formula = DeliveryTime.y ~ NumberCases.x1 + Distance.x2, data = delivery_data)

# all of these are used to check for outliers

# dfb.1_ - The intercept. We're checking if dfb > 2 / sqrt(n), which in this case is 0.4
# dfb.NC.1 - NC (number of cases)
# dfb.Ds.2 - Distance
# dffit - Checking if it's greater than 2 * sqrt(p / n) 
# cov.r - We're checking if it's less than 1. If < 1 then it's more likely to be an outlier.
# cook.d - Cook Distance (D_i). If D_i > 1, then it's more likely to be an outlier.

# hat (h_ii) - Checking if data point's h_ii is > (2p / n) where p is # params (betas), n is number of data points.
# In this case, it's 0.24. So we're looking to see if it's hat value is greater than 0.24
# If it is, it could be an outlier.

# inf <-- means influencial points. look at the points with the most stars

print(influence.measures(delivery.lm))

install.packages("car")
library(car)

# ?vif

vif(lm(prestige ~ income + education, data=Duncan))
vif(lm(prestige ~ income + education + type, data=Duncan))

# VIF_j = 1 / (1 - R^2_j) where R^2_j is the coefficient of multiple determination 
# obtained from regressing x_j on the other regressor variables.

# Variance inflation factors (VIF) measure how much the variance
# of the estimated regression coefficients are inflated 
# as compared to when the predictor variables are not linearly related. 
# It is used to explain how much amount multicollinearity (correlation between predictors) 
# exists in a regression analysis.

# The Variance Inflating Factor (VIF) tells you how much higher the variance σ^2 
# is when your regressors are correlated compared to when they are uncorrelated.

# my.index (1:10)[mat[, 3] < (0.2)]

