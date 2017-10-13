# MATH 5345 HW 4 Q2 - Q4 - Joshua Mitchell
setwd("/Users/jm/joshualmitchell.github.io/MATH5345/lec/")
wind_data <- read.table("5.2windmdata.txt", header=T)
wind_data

# Step 1: Get Data
# - lm (y ~ x)
# - get summary statistics
# - lm.1 = lm(y ~ x)
# - plot residuals: plot(lm.1$residuals, lm.1$fitted)

last_column <- ncol(wind_data)
wind_vel_x = wind_data[,2] # Wind Velocity
dc_output_y = wind_data[,3] # DC Output

modsn <- lm(dc_output_y ~ wind_vel_x)

summary(modsn)
anova(modsn)

modsn.res <- modsn$residuals
plot(wind_vel_x, dc_output_y)
plot(wind_vel_x, modsn.res)
plot(dc_output_y, modsn.res)

plot(fitted(modsn), modsn.res)

# Step 2: Do transformation (to a new y: y' or a new x: x')
# - lm(y'~x') or lm(y'~x) or lm(y~x') (i.e. x' = 1/x)
# get summary statistics
# plot residuals

new_x <- 1 / wind_vel_x

lm.2 <- lm(dc_output_y ~ new_x)
lm.2
lm.2.res <- lm.2$residuals
summary(lm.2)
anova(lm.2)

plot(fitted(lm.2), lm.2.res)
abline(h=0) # Falls within "A band" and doesn't have a curve

# data --> model --> decide it needs to be transformed (modify x) --> transformed model (y ~ 1/x) 
# --> new data (x) --> put into transformed model --> y 

# new data (x) --> transform x --> put into new (Transformed) model --> y (the predicted value)

