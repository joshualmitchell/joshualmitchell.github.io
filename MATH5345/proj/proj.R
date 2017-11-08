setwd("/Users/jm/joshualmitchell.github.io/pokecars")
library(leaps)
library(car)
autodata <- read.table("raw_auto-mpg.text", header=TRUE)
colnames(autodata) <- c("mpg_c", "cylnum_mvd", "displ_c", "hp_c", "wgt_c", "acc_c", "modelyr_mvd", "origin_mvd", "name_str")

# Step 1: Explore and check your data

# -- Using R functions: dim, summary, hist, plot, boxplot, table (for categorical variables)
# -- to check the dimension, distribution, potential outliers for data (y, x1, x2...)
# -- consider removing incorrect or "weird" data points (but be VERY careful)

dim(autodata)
summary(autodata)

# autodata$hp_c <- gsub("?",NA, autodata$hp_c, fixed = TRUE)
autodata <- subset(autodata, !autodata[ , 4] == "?")
autodata$hp_c <- as.numeric(as.character(autodata$hp_c))


# Check normality of "y" (we don't care about normality of x):
hist(autodata$mpg_c, main="MPG Frequency", xlab="Miles per gallon", ylab="Number of cars with x miles per galon")

# Make origin a factor (since it's not continuous)
autodata$origin_mvd <- as.factor(autodata$origin_mvd)

# Step 2: Fit a multiple linear regression model
# -- Use lm to fit y ~ x1, x2 ..
# -- Get estimated linear model, R2, ANOVA, test significance of regression

full <- lm(mpg_c ~ cylnum_mvd + displ_c + hp_c + wgt_c + acc_c + modelyr_mvd + origin_mvd, data=autodata) 
null <- lm(mpg_c ~ 1, data=autodata) 

# Perform "forward" selection starting from the NULL model and set up the scope to have an upper = FULL model. 

forw <- step(null, scope=list(lower=null, upper=full), direction="forward")
forw.lm <- lm(mpg_c ~ wgt_c + modelyr_mvd + origin_mvd + displ_c + hp_c + cylnum_mvd, data = autodata)
summary(forw.lm)
anova(forw.lm)

# Backwards Selection

back <- step(full, data=autodata, direction="backward")
back.lm <- lm(mpg_c ~ cylnum_mvd + displ_c + hp_c + wgt_c + modelyr_mvd + origin_mvd, data = autodata)
summary(back.lm)
anova(back.lm)

# Stepwise Selection

stepwise<- step(null, scope = list(upper=full), data=autodata, direction="both")
stepwise.lm <- lm(mpg_c ~ wgt_c + modelyr_mvd + origin_mvd + displ_c + hp_c + cylnum_mvd, data = autodata)
summary(stepwise.lm)
anova(stepwise.lm)

# All Possible Regressor Selection (using regsub)

regsub.exhaust<-regsubsets(mpg_c ~ cylnum_mvd + displ_c + hp_c + wgt_c + acc_c + modelyr_mvd + origin_mvd, data=autodata, nbest = 1, nvmax = NULL,force.in = NULL, force.out = NULL, intercept=TRUE, method = "exhaustive")
summary.out <- summary(regsub.exhaust)
summary.out

model_info <- cbind("# Regressors"=1:8, "R-squared"=summary.out$rsq, "adj R-squared"=summary.out$adjr2, "MS_res"=summary.out$rss/(nrow(autodata) - 2:9), "CP - p"=summary.out$cp - 2:9)

# Let's check normality and constant variance:

lm7 <- lm(mpg_c ~ wgt_c + modelyr_mvd + origin_mvd + hp_c + displ_c + cylnum_mvd + acc_c, data = autodata)

# Residual Plots:

plot(autodata$wgt_c, resid(lm7), main="Residuals vs Weight", ylab="Residuals", xlab="Weight")
# possibly do a squared transformation
abline(h = 0, col="red")
plot(autodata$modelyr_mvd, resid(lm7),  main="Residuals vs Model Year", xlab="Model Year", ylab="Residuals")
abline(h = 0, col="red")
plot(autodata$origin_mvd, resid(lm7),  main="Residuals vs Origin", xlab="Origin", ylab="Residuals")
abline(h = 0, col="red")
plot(autodata$hp_c, resid(lm7), main="Residuals vs HP", xlab="HP", ylab="Residuals")
# Possibly add a second beta for hp^2
abline(h = 0, col="red")
plot(autodata$displ_c, resid(lm7), main="Residuals vs Displacement", xlab="Displacement", ylab="Residuals")
abline(h = 0, col="red")
plot(autodata$cylnum_mvd, resid(lm7),  main="Residuals vs Cylinder Amount", xlab="Cylinder Amount", ylab="Residuals")
abline(h = 0, col="red")
plot(autodata$acc_c, resid(lm7),  main="Residuals vs Acceleration", xlab="Acceleration", ylab="Residuals")
abline(h = 0, col="red")

plot(lm7$fitted.values, resid(lm7), main="Residuals vs Fitted Values", xlab="Fitted Values", ylab="Residuals")
abline(h = 0, col="red")

# Oooh, has kind of a horseshoe pattern, let's apply a log transformation:
lm7 <- lm(log(mpg_c) ~ wgt_c + modelyr_mvd + origin_mvd + hp_c + displ_c + cylnum_mvd + acc_c, data = autodata)
plot(lm7$fitted.values, resid(lm7), main="[Transformed] Residuals vs Fitted Values", xlab="Residuals", ylab="Fitted Values")
abline(h = 0, col="red")

# Much better! Let's check normality again:
qqnorm(resid(lm7))
qqline(resid(lm7))
# Still mostly normal, but now it has a lower left tail

##################
### STARTING OVER
### ISH
##################

full <- lm(log(mpg_c) ~ cylnum_mvd + displ_c + hp_c + wgt_c + acc_c + modelyr_mvd + origin_mvd, data=autodata) 
null <- lm(log(mpg_c) ~ 1, data=autodata) 

# Perform "forward" selection starting from the NULL model and set up the scope to have an upper = FULL model. 

forw <- step(null, scope=list(lower=null, upper=full), direction="forward")
forw.lm <- lm(log(mpg_c) ~ wgt_c + modelyr_mvd + origin_mvd + hp_c + displ_c + cylnum_mvd, data = autodata)
summary(forw.lm)
# Multiple R-squared:  0.8819,	Adjusted R-squared:  0.8798 
anova(forw.lm)
# Mean Sq: 0.014


# Backwards Selection

back <- step(full, data=autodata, direction="backward")
back.lm <- lm(log(mpg_c) ~ cylnum_mvd + displ_c + hp_c + wgt_c + modelyr_mvd + origin_mvd, data = autodata)
# Same summary as forward
summary(back.lm)
anova(back.lm)

# Stepwise Selection

stepwise<- step(null, scope = list(upper=full), data=autodata, direction="both")
stepwise.lm <- lm(mpg_c ~ wgt_c + modelyr_mvd + origin_mvd + hp_c + displ_c + cylnum_mvd, data = autodata)
# Same as forward and backward
summary(stepwise.lm)
anova(stepwise.lm)

# Per Regressor Selection (using regsub)

regsub.exhaust<-regsubsets(log(mpg_c) ~ cylnum_mvd + displ_c + hp_c + wgt_c + acc_c + modelyr_mvd + origin_mvd, data=autodata, nbest = 1, nvmax = NULL,force.in = NULL, force.out = NULL, intercept=TRUE, method = "exhaustive")
summary.out <- summary(regsub.exhaust)
summary.out

# Results:
# 1: wgt_c
# R^2: 0.7665656, AR^2: 0.7659655, MSQ: 18.8, CP: 368.355467 (- 2) = 366.355467

# 2: wgt_c + modelyr_mvd
# R^2: 0.8710307, AR^2: 0.8703659, MSQ: 11.8, CP: 32.323543 (- 3) = 29.323543

# 3: wgt_c + modelyr_mvd + origin_mvd2
# R^2: 0.8734732, AR^2: 0.8724924, MSQ: 11.2, CP: 26.419955 (- 4) = 22.419955

# 4: wgt_c + modelyr_mvd + origin_mvd2 + origin_mvd3
# R^2: 0.8765522, AR^2: 0.8752729, MSQ: 11.1, CP: 18.456847 (- 5) = 13.456847

# 5: wgt_c + modelyr_mvd + origin_mvd2 + origin_mvd3 + hp_c
# R^2: 0.8790556, AR^2: 0.8774849, MSQ: 11.1, CP: 12.356194 (- 6) = 6.356194

# 6: wgt_c + modelyr_mvd + origin_mvd2 + origin_mvd3 + hp_c + displ_c
# R^2: 0.8799724, AR^2: 0.8780970, MSQ: 11.0, CP: 11.389496 (- 7) = 4.389496

# 7: wgt_c + modelyr_mvd + origin_mvd2 + origin_mvd3 + hp_c + displ_c + cylnum_mvd
# R^2: 0.8819156, AR^2: 0.8797574, MSQ: 10.9, CP: 7.101676 (- 8) = -0.898324
# Selected by forward, backward, and stepwise selection!

# 8: wgt_c + modelyr_mvd + origin_mvd2 + origin_mvd3 + hp_c + displ_c + cylnum_mvd + acc_c
# R^2: 0.8819470, AR^2: 0.8794747, MSQ: 10.9, CP: 9.000000 (- 9) = 0



# Let's check influential points:

print(influence.measures(lm7))
inflpnts <- influence.measures(lm7)
summary(inflpnts)
which(apply(inflpnts$is.inf, 1, any))

# remove studentized residuals larger than 3 and data points with cooks D > 4/n:

w <- abs(rstudent(lm7)) < 3 & abs(cooks.distance(lm7)) < 4/nrow(lm7$model)
lm7_2 <- update(lm7, weights=as.numeric(w))

summary(lm7_2) # They all become significant except displacement
# Multiple R-squared:  0.9196,	Adjusted R-squared:  0.9178
anova(lm7_2)
# Mean Sq Res: 0.009

# Should you include a regressor if it's not significant (no stars) but it increases all the metrics (R^2, etc)?

vif(lm7)

#             GVIF       Df GVIF^(1/(2*Df))
# wgt_c       11.065046  1        3.326416
# modelyr_mvd  1.299455  1        1.139936
# origin_mvd   2.092968  2        1.202792
# hp_c         9.981999  1        3.159430
# displ_c     22.873643  1        4.782640
# cylnum_mvd  10.738293  1        3.276934
# acc_c        2.623743  1        1.619797

vif(lm7_2)

#             GVIF       Df       GVIF^(1/(2*Df))
# wgt_c       15.219019  1        3.901156
# modelyr_mvd  1.317332  1        1.147751
# origin_mvd   2.110562  2        1.205312
# hp_c        10.563281  1        3.250120
# displ_c     27.099357  1        5.205704
# cylnum_mvd  11.552526  1        3.398901
# acc_c        2.663166  1        1.631921

# -- test if each β =0, make residual plots to check the key assumptions,
# -- investigate the relationship 
# -- (1) between different predictors (e.g., check VIF), 

# -- (2) between y and predictors (e.g., using partial regression plots, and so on)
# Step 3: Fix the assumption violation problems and refit a model
# -- If necessary, transform your data, then refit a model, do variable selection, etc.
# -- repeat step 2, then step 3 again until you get satisfied with your data analysis results.

# Step 4: Summarize your data analysis results

# Latent variable discrete choice (structural equations model)
# Latent variables - not directly observed but rather inferred from observed variables (factor analysis, PCA, HMM, structured equation models)
