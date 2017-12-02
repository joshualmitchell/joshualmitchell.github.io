setwd("/Users/jm/joshualmitchell.github.io/MATH5345/proj")
library(leaps)
library(car)
library(xtable)
library(locfit)

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
    # str(regressor_column)
    # str(resid(model))
    plot(resid_vs_regr,  main=title, xlab=xname, ylab=yname)
    abline(h = 0, col="red")
  }
}

displayPartialRegressionPlots <- function(response, regressors, df) {
  # response : string 
  # regressors : c("regressor1", "regressor2"...)
  # df : data frame containing your data (only the regressors/response you actually use)
  for (regressor in regressors){
    if (!is.factor(df[, match(regressor, names(df))])) {
      regr <- names(df) %in% c(regressor)
      no_regressor_data <- df[!regr]
      formula_reg <- as.formula(paste(response, " ~ .", sep = ""))
      lm_no_regressor <- lm(formula_reg, data=no_regressor_data)
      
      resp <- names(df) %in% c(response)
      no_response_data <- df[!resp]
      formula_resp <- as.formula(paste(regressor, " ~ .", sep = ""))
      lm_otherRegressor_toRest <- lm(formula_resp, data=no_response_data)
      title <- paste(paste("resid(Missing ", regressor, sep=''), paste(paste(") vs resid(", regressor, sep=''), " vs Rest)", sep=''))
      xname <- paste(paste("resid(", regressor, sep=''), " vs Rest)", sep='')
      yname <- paste(paste("resid(Missing ", regressor, sep=''), ")", sep='')
    
      plot(resid(lm_otherRegressor_toRest), resid(lm_no_regressor), main=title, xlab=xname, ylab=yname)
      abline(h = 0, col="red")
    }
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

str(autodata)
cor(autodata[ ,1:7])
pairs(autodata[, 1:8])

# Let's check constant variance:

##############################################################################
####### Residual Plots:
##############################################################################

lm7 <- lm(mpg_c ~ wgt_c + modelyr_mvd + origin_mvd + hp_c + displ_c + cylnum_mvd + acc_c, data = autodata)

xtable(summary(lm7))
xtable(anova(lm7))

par(mar=c(2, 2, 2, 2))
par(mfrow=c(3,3))

# Fitted Values Residual Plot
plot(lm7$fitted.values, resid(lm7), main="Residuals vs Fitted", xlab="Fitted Values", ylab="Residuals")
abline(h = 0, col="red")

# Random Normal Residual Plot
qqnorm(resid(lm7), main="Residuals vs R-Norm", xlab="Random Normal", ylab="Residuals")
qqline(resid(lm7))

# Individual Residual Plots (per regressor)
colnames <- colnames(autodata)
colnames <- c(colnames)
regressors <- setdiff(colnames, c("mpg_c"))

displayResidualPlots(lm7, regressors, autodata)

lm7_vif <- vif(lm7)
lm7_vif <- as.data.frame(lm7_vif)
xtable(lm7_vif)

par(mar=c(2, 2, 2, 2))
par(mfrow=c(2,2))

displayPartialRegressionPlots("mpg_c", regressors, autodata)

# It looks like displacement brings in barely any information.
# Weight seems to have information.

# Let's look at a partial F test for Displacement, Weight, Cylinders, and HP:

no_disp_model.reduced <- lm(mpg_c ~ wgt_c + modelyr_mvd + origin_mvd + hp_c + cylnum_mvd + acc_c, data = autodata)
no_wgt_model.reduced <- lm(mpg_c ~ modelyr_mvd + origin_mvd + hp_c + displ_c + cylnum_mvd + acc_c, data = autodata)
no_hp_model.reduced <- lm(mpg_c ~ wgt_c + modelyr_mvd + origin_mvd + displ_c + cylnum_mvd + acc_c, data = autodata)
no_cyl_model.reduced <- lm(mpg_c ~ wgt_c + modelyr_mvd + origin_mvd + hp_c + displ_c + acc_c, data = autodata)


anova(no_disp_model.reduced, lm7) # F: 9.8867,   Pr(>F): 0.001795,   significance: **
anova(no_wgt_model.reduced, lm7)  # F: 104.63    Pr(>F): 2.2e-16     significance: ***
anova(no_hp_model.reduced, lm7)   # F: 1.6075    Pr(>F): 0.2056      significance: none
anova(no_cyl_model.reduced, lm7)  # F: 2.5285    Pr(>F): 0.1126      significance: none 

parFchart <- list(Regressor = c("Displacement", "Weight", "HP", "Cylinder Num"), 
                  F_Statistic = c(9.8867, 104.63, 1.6075, 2.5285), 
                  P_Value = c(0.001795, 0.000001, 0.2056, 0.1126),
                  Significance = c("**", "***", "none", "none"))
parFchart <- as.data.frame(parFchart)

xtable(parFchart)

# Two problems: correlation and non constant variance. 

##############################################################################
####### Apply log transformation due to horseshoe pattern:
##############################################################################

lm7_log <- lm(log(mpg_c) ~ wgt_c + modelyr_mvd + origin_mvd + hp_c + displ_c + cylnum_mvd + acc_c, data = autodata)

par(mar=c(2, 2, 2, 2))
par(mfrow=c(3,3))

plot(lm7_log$fitted.values, resid(lm7_log), main="[T] Residuals vs Fitted", ylab="Residuals", xlab="Fitted Values")
abline(h = 0, col="red")

# Much better! Let's check normality again:
qqnorm(resid(lm7_log), main="[T] Residuals vs R-Norm", xlab="Random Normal", ylab="Residuals")
qqline(resid(lm7_log))
# Still mostly normal, but now it has a lower left tail

# Individual Residual Plots (per regressor)
colnames <- colnames(autodata)
colnames <- c(colnames)
regressors <- setdiff(colnames, c("mpg_c"))

displayResidualPlots(lm7_log, regressors, autodata)

lm7_log_vif <- vif(lm7_log)
lm7_log_vif <- as.data.frame(lm7_log_vif)
xtable(lm7_log_vif)

par(mar=c(2, 2, 2, 2))
par(mfrow=c(2,2))

displayPartialRegressionPlots("log(mpg_c)", regressors, autodata)

# Let's look at a partial F test for Displacement, Weight, Cylinders, and HP:

no_disp_model.reduced <- lm(log(mpg_c) ~ wgt_c + modelyr_mvd + origin_mvd + hp_c + cylnum_mvd + acc_c, data = autodata)
no_wgt_model.reduced <- lm(log(mpg_c) ~ modelyr_mvd + origin_mvd + hp_c + displ_c + cylnum_mvd + acc_c, data = autodata)
no_hp_model.reduced <- lm(log(mpg_c) ~ wgt_c + modelyr_mvd + origin_mvd + displ_c + cylnum_mvd + acc_c, data = autodata)
no_cyl_model.reduced <- lm(log(mpg_c) ~ wgt_c + modelyr_mvd + origin_mvd + hp_c + displ_c + acc_c, data = autodata)


anova(no_disp_model.reduced, lm7_log) # F: 8.3922,   Pr(>F): 0.003985,   significance: **
anova(no_wgt_model.reduced, lm7_log)  # F: 126.68    Pr(>F): 2.2e-16     significance: ***
anova(no_hp_model.reduced, lm7_log)   # F: 9.0956    Pr(>F): 0.002734    significance: **
anova(no_cyl_model.reduced, lm7_log)  # F: 6.3481    Pr(>F): 0.01216     significance: *

parFchart <- list(Regressor = c("Displacement", "Weight", "HP", "Cylinder Num"), 
                  F_Statistic = c(8.3922, 126.68, 9.0956, 6.3481), 
                  P_Value = c(0.003985, 0.000001, 0.002734, 0.01216),
                  Significance = c("**", "***", "**", "*"))
parFchart <- as.data.frame(parFchart)
xtable(parFchart)

# Knowing that there's correlation between variables, let's look at interaction terms

##############################################################################
#######  Interaction terms:
##############################################################################

# Possible Interaction Terms:
# wgt_c * hp_c * displ_c * cylnum_mvd
# wgt_c * hp_c * displ_c
# wgt_c * hp_c * cylnum_mvd
# wgt_c * displ_c * cylnum_mvd
# hp_c * displ_c * cylnum_mvd
# wgt_c * hp_c
# wgt_c * displ_c 
# wgt_c * cylnum_mvd
# hp_c * displ_c
# hp_c * cylnum_mvd
# displ_c * cylnum_mvd

# So let's build a model with all 7 regressors and all of those interaction terms
# (since those 4 had the high VIFs)
# and see what's the most significant.

lm_interaction <- lm(mpg_c ~ wgt_c + modelyr_mvd + origin_mvd + hp_c 
                     + displ_c + cylnum_mvd + acc_c + 
                       wgt_c * hp_c + hp_c * displ_c + 
                       wgt_c * hp_c * displ_c * cylnum_mvd + 
                       wgt_c * hp_c * displ_c + 
                       wgt_c * hp_c * cylnum_mvd + 
                       wgt_c * displ_c * cylnum_mvd + 
                       hp_c * displ_c * cylnum_mvd + 
                       wgt_c * hp_c +
                       wgt_c * displ_c +
                       wgt_c * cylnum_mvd + 
                       hp_c * displ_c + 
                       hp_c * cylnum_mvd + 
                       displ_c * cylnum_mvd, data=autodata)

lm_interaction_log <- lm(log(mpg_c) ~ wgt_c + modelyr_mvd + origin_mvd + hp_c 
                     + displ_c + cylnum_mvd + acc_c + 
                       wgt_c * hp_c + hp_c * displ_c + 
                       wgt_c * hp_c * displ_c * cylnum_mvd + 
                       wgt_c * hp_c * displ_c + 
                       wgt_c * hp_c * cylnum_mvd + 
                       wgt_c * displ_c * cylnum_mvd + 
                       hp_c * displ_c * cylnum_mvd + 
                       wgt_c * hp_c +
                       wgt_c * displ_c +
                       wgt_c * cylnum_mvd + 
                       hp_c * displ_c + 
                       hp_c * cylnum_mvd + 
                       displ_c * cylnum_mvd, data=autodata)

summary(lm_interaction)
# R_sq : 0.8762, AR_sq: 0.8699
anova(lm_interaction)
# MS_res: 7.9
summary(lm_interaction_log)
# R_sq : 0.9045, AR_sq: 0.8996
anova(lm_interaction_log)
# MS_res: 0.012

i_vs_ni <- list(Model = c("Interaction", "Transformed + Interaction"), R_Sq = c(0.8762, 0.9045), AR_Sq = c(0.8699, 0.8996), MS_res = c(7.9, 0.012))
i_vs_ni <- as.data.frame(i_vs_ni)
xtable(i_vs_ni)
# It looks like, even taking into account the interactions, the log transformation
# helps the model explain more of the relationship.

# So now, let's look at building our model from all of these regressors.

full <- lm_interaction_log
null <- lm(log(mpg_c) ~ 1, data=autodata)

# Perform "forward" selection starting from the NULL model and set up the scope to have an upper = FULL model. 

forw <- step(null, scope=list(lower=null, upper=full), direction="forward")
# Chosen: lm(log(mpg_c) ~ wgt_c + modelyr_mvd + origin_mvd + hp_c + acc_c + wgt_c:hp_c, data = autodata)
lm.forw <- lm(log(mpg_c) ~ wgt_c + modelyr_mvd + origin_mvd + hp_c + acc_c + wgt_c:hp_c, data = autodata)
summary(lm.forw)
# Multiple R-squared:  0.8918,	Adjusted R-squared:  0.8899 
anova(lm.forw)
# MS_res: 0.013

back <- step(full, data=autodata, direction="backward")
# Chosen: lm(log(mpg_c) ~ wgt_c + modelyr_mvd + origin_mvd + hp_c + displ_c + cylnum_mvd + acc_c + wgt_c:hp_c + hp_c:displ_c + wgt_c:displ_c + wgt_c:cylnum_mvd + hp_c:cylnum_mvd + displ_c:cylnum_mvd + wgt_c:hp_c:cylnum_mvd + wgt_c:displ_c:cylnum_mvd + hp_c:displ_c:cylnum_mvd, data = autodata)
lm.back <- lm(log(mpg_c) ~ wgt_c + modelyr_mvd + origin_mvd + hp_c + displ_c + cylnum_mvd + acc_c + wgt_c:hp_c + hp_c:displ_c + wgt_c:displ_c + wgt_c:cylnum_mvd + hp_c:cylnum_mvd + displ_c:cylnum_mvd + wgt_c:hp_c:cylnum_mvd + wgt_c:displ_c:cylnum_mvd + hp_c:displ_c:cylnum_mvd, data = autodata)
summary(lm.back)
# Multiple R-squared:  0.9044,	Adjusted R-squared:  0.9001  
anova(lm.back)
# MS_res: 0.012

# Roughly the same summary as forward, maybe a little better

# Stepwise Selection
stepwise <- step(null, scope = list(upper=full), data=autodata, direction="both")
# Chosen: lm(log(mpg_c) ~ wgt_c + modelyr_mvd + origin_mvd + hp_c + acc_c + wgt_c:hp_c, data = autodata)
lm.stepwise <- lm(log(mpg_c) ~ wgt_c + modelyr_mvd + origin_mvd + hp_c + acc_c + wgt_c:hp_c, data = autodata)
# Same model as forward, same summary (roughly) as all of them.
summary(lm.stepwise)
# Multiple R-squared:  0.8918,	Adjusted R-squared:  0.8899 
anova(lm.stepwise)
# MS_res: 0.013

bestModels <- list(Selection_Method = c("Forward", "Backward", "Stepwise"),
                  Num_Regressors = c(6, 16, 6),
                  R_Sq = c(0.8918, 0.9044, 0.8918), 
                  Adj_R_Sq = c(0.8899, 0.9001, 0.8899),
                  MS_res = c(0.013, 0.012, 0.013))

bestModels <- as.data.frame(bestModels)
bestModels
xtable(bestModels)

par(mar=c(2, 2, 2, 2))
par(mfrow=c(2,2))

# 28ti_resfittednorm

plot(lm.forw$fitted.values, resid(lm.forw), main="FW: Residuals vs Fitted", ylab="FW: Residuals", xlab="Fitted Values")
abline(h = 0, col="red")

qqnorm(resid(lm.forw), main="FW: Residuals vs R-Norm", xlab="Random Normal", ylab="FW: Residuals")
qqline(resid(lm.forw))

plot(lm.back$fitted.values, resid(lm.back), main="BK: Residuals vs Fitted", ylab="BK: Residuals", xlab="Fitted Values")
abline(h = 0, col="red")

qqnorm(resid(lm.back), main="BK: Residuals vs R-Norm", xlab="Random Normal", ylab="BK: Residuals")
qqline(resid(lm.back))

lm.forw.vif <- vif(lm.forw)
lm.forw.vif <- as.data.frame(lm.forw.vif)
lm.forw.vif
xtable(lm.forw.vif)

lm.back.vif <- vif(lm.back)
lm.back.vif <- as.data.frame(lm.back.vif)
lm.back.vif
xtable(lm.back.vif)

lm.stepwise.vif <- vif(lm.stepwise)
lm.stepwise.vif <- as.data.frame(lm.stepwise.vif)
lm.stepwise.vif
xtable(lm.stepwise.vif)

data_with_inflpnts_fw <- influence.measures(lm.forw)
inflpnts_fw <- which(apply(data_with_inflpnts_fw$is.inf, 1, any)) 
data_wo_inflpnts_fw <- autodata[-inflpnts_fw,] # 371 / 391 = 0.9488491 -> 5.11509% infl

data_with_inflpnts_bk <- influence.measures(lm.back)
inflpnts_bk <- which(apply(data_with_inflpnts_bk$is.inf, 1, any)) 
data_wo_inflpnts_bk <- autodata[-inflpnts_bk,] # 355 / 391 -> 9.2072% influential points

common_infl_pnts <- intersect(inflpnts_bk, inflpnts_fw) # 14

no_infl_forw_back <- list(Model = c("Forward", "Backward"), Num_Infl_Pnts = c(20, 36), Percent_Infl_Pnts = c("5.12%", "9.21%"), Common_Infl_Pnts = 14)
no_infl_forw_back <- as.data.frame(no_infl_forw_back)
xtable(no_infl_forw_back)

lm.forw.wo.infl <- lm(log(mpg_c) ~ wgt_c + modelyr_mvd + origin_mvd + hp_c + acc_c + wgt_c:hp_c, data = data_wo_inflpnts_fw)
lm.back.wo.infl <- lm(log(mpg_c) ~ wgt_c + modelyr_mvd + origin_mvd + hp_c + displ_c + cylnum_mvd + acc_c + wgt_c:hp_c + hp_c:displ_c + wgt_c:displ_c + wgt_c:cylnum_mvd + hp_c:cylnum_mvd + displ_c:cylnum_mvd + wgt_c:hp_c:cylnum_mvd + wgt_c:displ_c:cylnum_mvd + hp_c:displ_c:cylnum_mvd, data = autodata)

summary(lm.forw.wo.infl) # Multiple R-squared:  0.9092,	Adjusted R-squared:  0.9074 
summary(lm.back.wo.infl) # Multiple R-squared:  0.9044,	Adjusted R-squared:  0.9001 
anova(lm.forw.wo.infl) # MS_res: 0.0099
anova(lm.back.wo.infl) # MS_res: 0.012

no_infl_forw_back <- list(Model = c("Forward w/o Infl", "Backward w/o Infl"), R_Sq = c(0.9092, 0.9044), AR_Sq = c(0.9074, 0.9001), MS_res = c(0.0099, 0.012))
no_infl_forw_back <- as.data.frame(no_infl_forw_back)
xtable(no_infl_forw_back)

# I would personally choose the forward model since the key statistics (R^2, etc)
# are around the same as the backward model, but the forward model is a lot more
# forgiving of influential points.
