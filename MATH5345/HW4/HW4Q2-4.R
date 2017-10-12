setwd("/Users/jm/joshualmitchell.github.io/MATH5345/HW4")
data <- read.table("3.1data.txt", header=T)
data

# Strip into y and x:

last_column <- ncol(data)
x = data[,c(2:last_column)]
y = data[,1]

####################################################
#Q1: a) ############################################
####################################################

model <- lm(y ~ x$x2 + x$x7 + x$x8, data=data)
# xtable(model) # Used to generate LaTeX versions

####################################################
#Q1: b) ############################################
####################################################

anova(model)
# xtable(anova(model))

# Failing to reject H_0: B_1 = B_2 = ... B_k is equivalent to saying:
# there is no linear relationship between y and any of the regressor variables.

# Find test statistic:

# SS_T = SS_R + SS_Res
# SS_R = B_hat\pr X\pr y - (sumin y_i)^2 / n, SS_Res = y\pr y - B_hat\pr X\pr y
# SS_R = B_hat\pr X\pr y - (sumin y_i)^2 / n
# SS_Res = y\pr y - B_hat\pr X\pr y
# SS_T = SS_R + SS_Res


# Reject H0 if F_0 > F_afa, k, n - k - 1


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

####################################################
#Q1: c) ############################################
####################################################

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

####################################################
#Q4: a) ############################################
####################################################

model.resid = resid(model)
qqnorm(model.resid, main = "Games Won vs Passing Yards / Rushing",
       xlab = "Passing Yards / % Rushing / Opponents Rushing", ylab = "Games Won")
qqline(model.resid)

####################################################
#Q4: b) ############################################
####################################################

plot(model$fitted.values, model.resid)

####################################################
#Q4: c) ############################################
####################################################

plot(x$x2, model.resid)
plot(x$x7, model.resid)
plot(x$x8, model.resid)

####################################################
#Q4: d) ############################################
####################################################

model_wo_x2 = lm(y~x$x7+x$x8)
x2_tl_x7_x8 = lm(x$x2~x$x7+x$x8)
plot(resid(model_wo_x2)~resid(x2_tl_x7_x8), xlab = "x2 residuals regressed against x7, x8",
     ylab = "y residuals regressed against x7, x8")

model_wo_x7 = lm(y~x$x2+x$x8)
x7_tl_x2_x8 = lm(x$x7~x$x2+x$x8)
plot(resid(model_wo_x7)~resid(x7_tl_x2_x8), xlab = "x7 residuals regressed against x2, x8",
     ylab = "y residuals regressed against x2, x8")

model_wo_x8 = lm(y~x$x7+x$x2)
x8_tl_x7_x2 = lm(x$x8~x$x7+x$x2)
plot(resid(model_wo_x8)~resid(x8_tl_x7_x2), xlab = "x8 residuals regressed against x7, x2",
     ylab = "y residuals regressed against x7, x2")
