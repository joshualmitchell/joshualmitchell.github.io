# Joshua Mitchell - MATH 5345 - HW 3 - Q1
setwd("/Users/jm/joshualmitchell.github.io/MATH5345")
data <- read.table("Ex2.7data.txt", header=T)
data

x = data$hydro
y = data$purity

##########################
# a) Fit Linear Model
##########################
m = lm(y~x) # Fit the model (i.e. generate coefficients for your best fit line)
m # B_0 = 77.86, B_1 = 11.80

# So y_hat = 77.86 + 11.80x

##########################
# b) Test the hypothesis that H_0 : B_1 = 0, where as H_a : B_1 /= 0
##########################

B_1_hat <- 11.80

SS_T <- sum((y - mean(y))^2)
S_xy <- sum((y * (x - mean(x))))
S_xx <- sum((x - mean(x))^2)
S_xx # 1.064975
SS_res <- SS_T - B_1_hat * S_xy
n <- 20
MS_res <- SS_res / (n - 2)
MS_res #12.93596
SE <- sqrt(MS_res / S_xx)
t_0 <- B_1_hat / SE
t_0 # 3.38573

# We reject H_0 if |t_0| > t_alpha/2, n-2.
# 3.38612 > t_alpha/2, n-2
# 3.38612 > 2.101
# Therefore, reject H_0

##########################
# c) Calculate R^2
##########################
summary(m)$r.squared # 0.3891224

##########################
# d) Find a 95% Confidence Interval on the slope, B_1
##########################

# A 100(1 - alpha)% CI on B_1 is:

# B_1_hat - t_alpha/2_n-2 * se(B_1_hat) <= B_1 <= B_1_hat + t_alpha/2_n-2 * se(B_1_hat)

lower <- B_1_hat - (2.101 * SE)
lower # 4.478
upper <- B_1_hat + (2.101 * SE)
upper # 19.12

# So, the CI is: (4.478, 19.12)

##########################
# e) Find a 95% Confidence Interval on y | x_0 where x_0: x = 1
##########################

# Let dif = sqrt(MS_res * (1/n + (x_0 - mean(x))^2 / S_xx))

# A 100(1 - alpha)% CI on y | x_0 where x_0 : x = 1 is:

# y_hat - dif <= y <= y_hat + dif

x_0 <- 1
B_0_hat <- 77.8633
y_hat <- B_0_hat + B_1_hat * x_0

dif <- 2.101 * sqrt(MS_res * (1/n + (x_0 - mean(x))^2 / S_xx))
dif
lower <- y_hat - dif
lower # 87.51104
upper <- y_hat + dif
upper # 91.81964

# So, the CI is: (87.51104, 91.81964)