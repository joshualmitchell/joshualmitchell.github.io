setwd("/Users/jm/Desktop/MATH 5345/")
data <- read.table("Ex2.13data.txt", header=T)
data

x = data$index
y = data$days

##########################
# a) Scatter Plot
##########################

plot(x, y, xlab="Index", ylab="Days", pch=19, main="Scatterplot of Index vs Days")

##########################
# b) Estimate the prediction equation (y = B0 + B1x)
##########################

model = lm(y~x) # Fit the model (i.e. generate coefficients for your best fit line)
model 
# B_0_hat = 183.596, B_1_hat = -7.404 -----> y = 183.596 -7.404x

##########################
# c) Test for significance of the regression
##########################

# Failing to reject H_0: B_1 = 0 is equivalent to saying:
# there is no linear relationship between y and x
SS_T <- sum((y - mean(y))^2)
S_xy <- sum((y * (x - mean(x))))
S_xx <- sum((x * mean(x))^2)
SS_res = SS_T <- (-7.404) * S_xy
n <- 16
MS_res <- SS_res / (n - 2)
SE <- sqrt(MS_res / S_xx)
t_0 <- -7.404 / SE
t_0 # -1783.677

# Reject if |t_0| > t_alpha/2, n-2

# 1783.677 > 2.145 (t_0.05/2, 14)

# Therefore, reject H_0

##########################
# d) Calculate and plot the 95% confidence and prediction bands.
##########################

prd <- predict(model,newdata=data.frame(x=x),interval = c("confidence"), 
             level = 0.95,type="response")

prd

# predict.lm(model, interval="confidence")

plot(x, y, xlab="Index", ylab="Days", pch=19, main="Confidence Interval")

lines(x,prd[,1], lwd=2)
lines(x,prd[,2],col="red",lty=2)
lines(x,prd[,3],col="red",lty=2)

# A 100(1 - alpha)% CI on B_1 is:

# B_1_hat - t_alpha/2_n-2 * se(B_1_hat) <= B_1 <= B_1_hat + t_alpha/2_n-2 * se(B_1_hat)

lower <- -7.404 - (2.145 * SE)
lower # -7.412904
upper <- -7.404 + (2.145 * SE)
upper # -7.395096

# So, the CI is: (-7.412904, -7.395096)