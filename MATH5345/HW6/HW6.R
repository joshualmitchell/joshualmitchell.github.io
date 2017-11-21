# install.packages("leaps")
# install.packages("car")
# install.packages("alr3")
library(leaps)
library(car)
library(xtable)
library(alr3)

# ?regsubsets. # No documentation for ‘regsubsets.’ in specified packages and libraries
setwd("/Users/jm/joshualmitchell.github.io/MATH5345/HW6/")

########################################################################################
###################### Question 1
########################################################################################

## A

q1data <- read.table("HW6Q1.txt", header=T)

q1data_modified = q1data[1:8, ]

q1lm <- lm(y ~ as.factor(x1) + as.factor(x2) + as.factor(x3), data=q1data)
q1lm_modified <- lm(y ~ as.factor(x1) + as.factor(x2) + as.factor(x3), data=q1data_modified)
qqnorm(q1data$y)
summary(q1lm)
plot(q1data$x1, resid(q1lm),  main="Residuals vs x1", xlab="x1", ylab="Residuals")
abline(h = 0, col="red")
plot(q1data$x2, resid(q1lm),  main="Residuals vs x2", xlab="x2", ylab="Residuals")
abline(h = 0, col="red")
plot(q1data$x3, resid(q1lm),  main="Residuals vs x3", xlab="x3", ylab="Residuals")
abline(h = 0, col="red")
plot(resid(q1lm), q1lm$fitted.values)
# plot(model) --> graph 4 indicates which points are "causing problems", graph 3 "scale location" for non-constant variance (lots of variance "in the middle" in this case)

## B

pureErrorAnova(q1lm)
pureErrorAnova(q1lm_modified)

########################################################################################
###################### Question 2
########################################################################################

q2data <- read.table("HW6Q2.txt", header=T)

## A
plot(q2data$visc, q2data$temp)

## B

q2lm <- lm(q2data$visc ~ q2data$temp)
summary(q2lm)
plot(q2lm$fitted.values, resid(q2lm))
abline(h = 0, col="red")

## C

q2lm <- lm(q2data$visc ~ q2data$temp + exp(q2data$temp))
summary(q2lm)
plot(q2lm$fitted.values, resid(q2lm), main="Residuals vs Fitted", xlab="Fitted", ylab="Residuals")
abline(h = 0, col="red")
plot(q2data$temp, resid(q2lm), main="Residuals vs Temp", xlab="Temp", ylab="Residuals")
abline(h = 0, col="red")
plot(exp(q2data$temp), resid(q2lm), main="Residuals vs e^(temp)", xlab="e^(temp)", ylab="Residuals")
abline(h = 0, col="red")

q2lm_t <- lm(log(q2data$visc) ~ q2data$temp + exp(q2data$temp))
summary(q2lm_t)
plot(q2lm_t$fitted.values, resid(q2lm_t), main="[Transformed] Residuals vs Fitted", xlab="Fitted", ylab="Residuals")
abline(h = 0, col="red")
plot(q2data$temp, resid(q2lm_t), main="[Transformed] Residuals vs Temp", xlab="Temp", ylab="Residuals")
abline(h = 0, col="red")
plot(exp(q2data$temp), resid(q2lm_t), main="[Transformed] Residuals vs e^(temp)", xlab="e^(temp)", ylab="Residuals")
abline(h = 0, col="red")

########################################################################################
###################### Question 3
########################################################################################

q3data <- read.table("HW6Q3.txt", header=T)

## A

q3lm <- lm(y ~ x1 + x2 + x3 + x4, data = q3data)
hist(q3data$y)
qqnorm(q3data$y)
qqline(q3data$y)
plot(q3lm$fitted.values, resid(q3lm), main="Residuals vs Fitted", xlab="Fitted", ylab="Residuals")
abline(h = 0, col="red")
plot(q3data$x1, resid(q3lm), main="Residuals vs x1", xlab="x1", ylab="Residuals")
abline(h = 0, col="red")
plot(q3data$x2, resid(q3lm), main="Residuals vs x2", xlab="x2", ylab="Residuals")
abline(h = 0, col="red")
plot(q3data$x3, resid(q3lm), main="Residuals vs x3", xlab="x3", ylab="Residuals")
abline(h = 0, col="red")
plot(q3data$x4, resid(q3lm), main="Residuals vs x4", xlab="x4", ylab="Residuals")
abline(h = 0, col="red")
summary(q3lm)

## C (this is just repeating A for C, B is below)

q3lm_data_with_infl <- influence.measures(q3lm)
q3lm_inflpnts <- which(apply(q3lm_data_with_infl$is.inf, 1, any)) 
data_wo_inflpnts <- q3data[-q3lm_inflpnts,]

q3lm_wo_infl <- lm(y ~ x1 + x2 + x3 + x4, data = data_wo_inflpnts)
hist(data_wo_inflpnts$y)
qqnorm(data_wo_inflpnts$y)
qqline(data_wo_inflpnts$y)
plot(q3lm_wo_infl$fitted.values, resid(q3lm_wo_infl), main="(sans-infl) Residuals vs Fitted", xlab="Fitted", ylab="Residuals")
abline(h = 0, col="red")
plot(data_wo_inflpnts$x4, resid(q3lm_wo_infl), main="(sans-infl) Residuals vs x4", xlab="x4", ylab="Residuals")
abline(h = 0, col="red")
summary(q3lm_wo_infl)
anova(q3lm_wo_infl)

## B

q3lm_log <- lm(log(y) ~ x1 + x2 + x3 + x4, data = q3data)

hist(log(q3data$y))
qqnorm(log(q3data$y))
qqline(log(q3data$y))

plot(q3lm_log$fitted.values, resid(q3lm_log), main="Residuals vs Fitted", xlab="Fitted", ylab="Residuals")
abline(h = 0, col="red")
plot(q3data$x1, resid(q3lm_log), main="Residuals vs x1", xlab="x1", ylab="Residuals")
abline(h = 0, col="red")
plot(q3data$x2, resid(q3lm_log), main="Residuals vs x2", xlab="x2", ylab="Residuals")
abline(h = 0, col="red")
plot(q3data$x3, resid(q3lm_log), main="Residuals vs x3", xlab="x3", ylab="Residuals")
abline(h = 0, col="red")
plot(q3data$x4, resid(q3lm_log), main="Residuals vs x4", xlab="x4", ylab="Residuals")
abline(h = 0, col="red")
summary(q3lm_log)

## C
q3lm_log_data_with_infl <- influence.measures(q3lm_log)
q3lm_log_inflpnts <- which(apply(q3lm_log_data_with_infl$is.inf, 1, any)) 
log_data_wo_inflpnts <- q3data[-q3lm_log_inflpnts,]

q3lm_log_wo_infl <- lm(log(y) ~ x1 + x2 + x3 + x4, data = log_data_wo_inflpnts)

hist(log(log_data_wo_inflpnts$y))
qqnorm(log(log_data_wo_inflpnts$y))
qqline(log(log_data_wo_inflpnts$y))
plot(q3lm_log_wo_infl$fitted.values, resid(q3lm_log_wo_infl), main="(sans-infl) (log) Residuals vs Fitted", xlab="Fitted", ylab="Residuals")
abline(h = 0, col="red")
plot(log_data_wo_inflpnts$x4, resid(q3lm_log_wo_infl), main="(sans-infl) (log) Residuals vs x4", xlab="x4", ylab="Residuals")
abline(h = 0, col="red")
summary(q3lm_log_wo_infl)
anova(q3lm_log_wo_infl)

########################################################################################
###################### Question 4
########################################################################################

## A
q4data <- read.table("HW6Q4.txt", header=T)
q4data
q4lm <- lm(y ~ x, data=q4data)
plot(q4data$x, q4data$y)
abline(q4lm, col="red") # regression line (y~x) 
summary(q4lm)

## B

plot(q4data$y, q4lm$fitted.values)
hist(q4data$y)

## C

plot(q4lm$fitted.values, resid(q4lm))
abline(h = 0, col="red")

## D

q4lm_t <- lm(y ~ x + I(x^2), data=q4data)
summary(q4lm_t)

## E

# y vs x^2 (scatterplot)
plot((q4data$x)^2, q4data$y)
# Predicted vs Observed (scatterplot)
plot(q4data$y, q4lm_t$fitted.values)
# Residuals vs Predicted
plot(q4lm_t$fitted.values, resid(q4lm_t))
abline(h = 0, col="red")

########################################################################################
###################### Question 5
########################################################################################

## A

q5data <- read.table("HW6Q5.txt", header=T)
q5lm <- lm(y ~ x1 + as.factor(x11), data=q5data)
summary(q5lm)

## B

q5lm_B <- lm(y ~ x1 + as.factor(x11) + (x1 * as.factor(x11)), data=q5data)
summary(q5lm_B)

plot()
