setwd("/Users/jm/Desktop/MATH 5345/")
data <- read.table("Ex2.7data.txt", header=T)
data

x = data$hydro
y = data$purity
mean(x)
mean(y)
plot(y~x, type="n") # Prepare the plot (i.e. make a blank graph)
m = lm(y~x) # Fit the model (i.e. generate coefficients for your best fit line)
##########################
# a) Fit Linear Model
##########################
m # B_0 = 77.86, B_1 = 11.80

# So y_hat = 77.86 + 11.80x

pred = predict(m, new=data.frame(x = x), interval="conf") # Predict y for those random x
pred

##########################
# b) Test the hypothesis that H_0 : B_1 = 0, where as H_a : B_1 /= 0
##########################

B_1_hat <- 11.80

SS_T <- sum((y - mean(y))^2)
S_xy <- sum((y * (x - mean(x))))
S_xx <- sum((x * mean(x))^2) #40.59437
S_xx # 40.59437
SS_res = SS_T <- B_1_hat * S_xy
n <- 20
MS_res <- SS_res / (n - 2)
MS_res #8.238891
SE <- sqrt(MS_res / S_xx)
t_0 <- B_1_hat / SE
t_0 # -1783.677

##########################
# c) Calculate R^2
##########################
summary(m)$r.squared

# add lines for confidence limits ad regression line, add points
# This "pred" is a matrix with 3 columns: fit, lwr (lower), upr (upper)
lines(new.x, pred[, "fit"], lwd=2)
lines(new.x, pred[, "lwr"], lty=3)
lines(new.x, pred[, "upr"], lty=3)
points(x, y, pch=16, col="steelblue")

### Alternative: Plot Confidence Band:

plot(y~x, type="n")
polygon(c(new.x, rev(new.x)), c(pred[, "lwr"], rev(pred[, "upr"])), border=NA, col=blues9[3])
lines(new.x, pred[,"fit"], lwd=2, col=blues9[8])
points(x, y, pch=16)
box()

dim(prop)

ym <- prop$ShearStrength.y
xm <- prop$Propellant.Age.x
prop.lm <- lm(ym~xm) # Fit a simple regression model

summary(prop.lm)
anova(prop.lm)

par(mfrow=c(2,2)) # par means parameter setting
plot(prop.lm) # plot(y~x) is the same thing as plot(x, y)