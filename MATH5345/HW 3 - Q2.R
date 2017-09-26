# Joshua Mitchell - MATH 5345 - HW 3 - Q2
setwd("/Users/jm/joshualmitchell.github.io/MATH5345")
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

# Find test statistic: 

B_1_hat <- -7.404

SS_T <- sum((y - mean(y))^2)
S_xy <- sum((y * (x - mean(x))))
S_xx <- sum((x - mean(x))^2)
SS_res <- SS_T - B_1_hat * S_xy
n <- 16
MS_res <- SS_res / (n - 2)
SE <- sqrt(MS_res / S_xx)
t_0 <- B_1_hat / SE
t_0 # -0.5994534

# Reject if |t_0| > t_alpha/2, n-2

# |-0.5994534| > 2.145 (t_0.05/2, 14)

# Therefore, accept H_0

##########################
# d) Calculate and plot the 95% confidence and prediction bands.
##########################

# prepare plot, fit model, get predictions,
# add lines for confidence limits and regression line, add points
plot(y~x,type="n", xlim=c(15, 18.5), ylim=c(-25, 150))
m = lm(y~x)
wx = par("usr")[1:2] # This is just to get two numbers to generate new “X’ observations. 
new.x = seq(wx[1],  wx[2], len=100)
conf = predict(m, new=data.frame(x=new.x), interval="conf")
# This “conf” is a matrix with three columns: “fit”, “lwr”, “upr”. 
lines(new.x,conf[,"fit"], col="black", lwd=2)
lines(new.x,conf[,"lwr"], col="blue", lty=3)
lines(new.x,conf[,"upr"], col="blue", lty=3)
points(x,y,pch=16,col="steelblue")

pred = predict(m, new=data.frame(x=new.x), interval="pred")

lines(new.x,pred[,"lwr"], col="red", lty=3)
lines(new.x,pred[,"upr"], col="red", lty=3)

# A 100(1 - alpha)% CI on B_1 is:

# B_1_hat - t_alpha/2_n-2 * se(B_1_hat) <= B_1 <= B_1_hat + t_alpha/2_n-2 * se(B_1_hat)

lower <- B_1_hat - (2.145 * SE)
lower # -33.89744
upper <- B_1_hat + (2.145 * SE)
upper # 19.08944

# So, the CI is: (-33.89744, 19.08944)