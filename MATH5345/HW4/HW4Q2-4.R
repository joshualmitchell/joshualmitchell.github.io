# MATH 5345 HW 4 Q2 - Q4 - Joshua Mitchell
setwd("/Users/jm/joshualmitchell.github.io/MATH5345/HW4")
data <- read.table("3.1data.txt", header=T)
data

# Strip into y and x:

last_column <- ncol(data)
x = data[,c(2:last_column)]
y = data[,1]

####################################################
#Q2: c) ############################################
####################################################

x2 <- x$x2
x7 <- x$x7
x8 <- x$x8

model <- lm(y ~ x2 + x7 + x8, data=data)
summary(model)
# xtable(model) # Used to generate LaTeX versions

####################################################
#Q2: d) ############################################
####################################################

# summary(model)$r.squared # yields 0.7863069
# summary(model)$adj.r.squared # yields 0.7595953

####################################################
#Q2: f) ############################################
####################################################

confint(model)

# x$x7: (0.011855322, 0.376065098)

####################################################
#Q2: g) ############################################
####################################################

test_X <- data.frame(x2=2300, x7=56, x8=2100)
predict(model, test_X, interval="confidence")

####################################################
#Q3: a) ############################################
####################################################

# Strip into y and x:
model <- lm(y ~ x7 + x8, data=data)

####################################################
#Q3: b) ############################################
####################################################

summary(model)$r.squared
summary(model)$adj.r.squared

####################################################
#Q3: c) ############################################
####################################################

confint(model)

####################################################
#Q3: d) ############################################
####################################################

test_X <- data.frame(x7=56, x8=2100)
predict(model, test_X, interval="confidence")

####################################################
#Q3: e) ############################################
####################################################


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
