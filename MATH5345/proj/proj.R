setwd("/Users/jm/joshualmitchell.github.io/MATH5345/proj")
library(leaps)
library(car)

##############################################################################
####### Helper functions (for partial regression and residual plots):
##############################################################################

displayResidualPlots <- function(model, regressors, df) {
  # model : linear model
  # regressors : c("regressor1", "regressor2"...)
  # df : data frame containing your data (only the regressors/predictor you actually use)
  for (regressor in regressors){
    title <- paste("Residuals vs ", regressor, sep='')
    yname <- "Residuals"
    xname <- paste(regressor)
    resid_vs_regr <- data.frame(df[c(regressor)], resid(model))
    regressor_column <- c(df[c(regressor)])
    str(regressor_column)
    str(resid(model))
    plot(resid_vs_regr,  main=title, xlab=xname, ylab=yname)
    abline(h = 0, col="red")
  }
}

displayPartialRegressionPlots <- function(predictor, regressors, df) {
  # predictor : string 
  # regressors : c("regressor1", "regressor2"...)
  # df : data frame containing your data (only the regressors/predictor you actually use)
  for (regressor in regressors){
    regr <- names(df) %in% c(regressor)
    no_regressor_data <- df[!regr]
    formula_reg <- as.formula(paste(predictor, " ~ .", sep = ""))
    lm_no_regressor <- lm(formula_reg, data=no_regressor_data)
    
    pred <- names(df) %in% c(predictor)
    no_predictor_data <- df[!pred]
    formula_pred <- as.formula(paste(regressor, " ~ .", sep = ""))
    lm_otherRegressor_toRest <- lm(formula_pred, data=no_predictor_data)
    
    title <- paste(paste("resid(Missing ", regressor, sep=''), paste(paste(") vs resid(", regressor, sep=''), " vs Rest)", sep=''))
    xname <- paste(paste("resid(", regressor, sep=''), " vs Rest)", sep='')
    yname <- paste(paste("resid(Missing ", regressor, sep=''), ")", sep='')
    
    plot(resid(lm_otherRegressor_toRest), resid(lm_no_regressor), main=title, xlab=xname, ylab=yname)
    abline(h = 0, col="red")
  }
}

##############################################################################
####### Setup / Data clean-up:
##############################################################################

autodata <- read.table("raw_auto-mpg.text", header=TRUE)
colnames(autodata) <- c("mpg_c", "cylnum_mvd", "displ_c", "hp_c", "wgt_c", "acc_c", "modelyr_mvd", "origin_mvd", "name_str")

# Step 1: Explore and check your data

# -- Using R functions: dim, summary, hist, plot, boxplot, table (for categorical variables)
# -- to check the dimension, distribution, potential outliers for data (y, x1, x2...)
# -- consider removing incorrect or "weird" data points (but be VERY careful)

str(autodata)
summary(autodata)

# Check normality of "y" (we don't care about normality of x):
hist(autodata$mpg_c, main="MPG Frequency", xlab="Miles per gallon", ylab="Number of cars with x miles per galon")

# Make origin a factor (since it's not continuous)
autodata$origin_mvd <- as.factor(autodata$origin_mvd)

# Remove data points with missing horsepower values and set them to numeric columns
autodata <- subset(autodata, !autodata[ , 4] == "?")
autodata$hp_c <- as.numeric(as.character(autodata$hp_c))

# Remove name_str:
autodata <- subset(autodata, select=-c(name_str))

# All Possible Regressor Selection (using regsub)

regsub.exhaust<-regsubsets(mpg_c ~ cylnum_mvd + displ_c + hp_c + wgt_c + acc_c + modelyr_mvd + origin_mvd, data=autodata, nbest = 1, nvmax = NULL,force.in = NULL, force.out = NULL, intercept=TRUE, method = "exhaustive")
summary.out <- summary(regsub.exhaust)
summary.out

model_info <- cbind("# Regressors"=1:8, "R-squared"=summary.out$rsq, "adj R-squared"=summary.out$adjr2, "MS_res"=summary.out$rss/(nrow(autodata) - 2:9), "CP - p"=summary.out$cp - 2:9)
model_info

# Let's check constant variance:

##############################################################################
####### Residual Plots:
##############################################################################

lm7 <- lm(mpg_c ~ wgt_c + modelyr_mvd + origin_mvd + hp_c + displ_c + cylnum_mvd + acc_c, data = autodata)

# Fitted Values Residual Plot
plot(lm7$fitted.values, resid(lm7), main="Residuals vs Fitted Values", xlab="Fitted Values", ylab="Residuals")
abline(h = 0, col="red")

# Random Normal Residual Plot
qqnorm(resid(lm7), main="Residuals vs Random Normal", xlab="Random Normal", ylab="Residuals")
qqline(resid(lm7))

# Individual Residual Plots (per regressor)
colnames <- colnames(autodata)
colnames <- c(colnames)
regressors <- setdiff(colnames, c("mpg_c"))

displayResidualPlots(lm7, regressors, autodata)

##############################################################################
####### Partial Regression Plots:
##############################################################################

colnames <- colnames(autodata)
colnames <- c(colnames)
regressors <- setdiff(colnames, c("mpg_c"))

displayPartialRegressionPlots("mpg_c", regressors, autodata)

# Oooh, has kind of a horseshoe pattern, let's apply a log transformation:

##############################################################################
####### Apply log transformation due to horseshoe pattern:
##############################################################################

lm7 <- lm(log(mpg_c) ~ wgt_c + modelyr_mvd + origin_mvd + hp_c + displ_c + cylnum_mvd + acc_c, data = autodata)

plot(lm7$fitted.values, resid(lm7), main="[Transformed] Residuals vs Fitted Values", xlab="Residuals", ylab="Fitted Values")
abline(h = 0, col="red")

# Much better! Let's check normality again:
qqnorm(resid(lm7), main="[Transformed] Residuals vs Random Normal", xlab="Random Normal", ylab="Residuals")
qqline(resid(lm7))
# Still mostly normal, but now it has a lower left tail

##############################################################################
####### Model Selection:
##############################################################################

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
stepwise.lm <- lm(log(mpg_c) ~ wgt_c + modelyr_mvd + origin_mvd + hp_c + displ_c + cylnum_mvd, data = autodata)
# Same as forward and backward
summary(stepwise.lm)
anova(stepwise.lm)

# All Possible Regressor Selection (using regsub)

regsub.exhaust<-regsubsets(log(mpg_c) ~ cylnum_mvd + displ_c + hp_c + wgt_c + acc_c + modelyr_mvd + origin_mvd, data=autodata, nbest = 1, nvmax = NULL,force.in = NULL, force.out = NULL, intercept=TRUE, method = "exhaustive")
summary.out <- summary(regsub.exhaust)
summary.out

log_model_info <- cbind("# Regressors"=1:8, "R-squared"=summary.out$rsq, "adj R-squared"=summary.out$adjr2, "MS_res"=summary.out$rss/(nrow(autodata) - 2:9), "CP - p"=summary.out$cp - 2:9)
log_model_info

# At this point, Forward, Backward, and Stepwise tell us to choose the full model minus cylnum and acc
# Right before we add cylnum and acc, CP - p goes negative, which also indicates we should choose full - (cylnum + acc) model

final_lm <- lm(log(mpg_c) ~ wgt_c + modelyr_mvd + origin_mvd + hp_c + displ_c, data = autodata)
# R^2: 0.88    Adj R^2: 0.8781    MS_Res: 0.014

data_with_inflpnts <- influence.measures(final_lm)
inflpnts <- which(apply(data_with_inflpnts$is.inf, 1, any)) 
data_wo_inflpnts <- autodata[-inflpnts,] 
# 368/391 = 0.9411765 which means 5.9% of our data is influential points.

final_lm_2 <- lm(log(mpg_c) ~ wgt_c + modelyr_mvd + origin_mvd + hp_c + displ_c, data = data_wo_inflpnts)
# R^2: 0.9017    Adj R^2: 0.900    MS_Res: 0.011

# Multiple R-squared:  0.9037,	Adjusted R-squared:  0.9018,   MS_res: 0.0104
# without influential points

# VIFS:

# hp, disp, cylnum, and wgt appear to be similar (which makes sense because they should correlate)
# But, does correlation necessarily mean dependency?

lm7_vif <- vif(lm7)
lm7_vif <- as.data.frame(lm7_vif)
lm7_vif

final_lm_vif <- vif(final_lm)
final_lm_vif <- as.data.frame(final_lm_vif)
final_lm_vif

final_lm_2_vif <- vif(final_lm_2)
final_lm_2_vif <- as.data.frame(final_lm_2_vif)
final_lm_2_vif

# 
