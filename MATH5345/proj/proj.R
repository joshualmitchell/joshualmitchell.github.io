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

hist(autodata$mpg_c, xlab="Miles per gallon", ylab="Number of cars with x miles per galon")
barplot(table(autodata$cylnum_mvd), main="Occurrences of cars with x cylinders", xlab="Number of Cylinders", ylab="Frequency")
hist(autodata$displ_c, main="Occurrences of cars with x displacement", xlab="Displacement Amount", ylab="Frequency")
hist(as.numeric(autodata$hp_c), xlab="Miles per gallon", ylab="Number of cars with x miles per galon")
hist(autodata$wgt_c, xlab="Weight", ylab="Number of cars that weigh x")
hist(autodata$acc_c, xlab="Acceleration", ylab="Number of cars with x acceleration")
barplot(table(autodata$modelyr_mvd), main="Occurrences of cars with x model year", xlab="Model Year", ylab="Frequency")
barplot(table(autodata$origin_mvd), main="Occurrences of cars with x origin type", xlab="Origin Type", ylab="Frequency")

# Step 2: Fit a multiple linear regression model
# -- Use lm to fit y ~ x1, x2 ..
# -- Get estimated linear model, R2, ANOVA, test significance of regression

full <- lm(mpg_c ~ cylnum_mvd + displ_c + hp_c + wgt_c + acc_c + modelyr_mvd + origin_mvd, data=autodata) 
null <- lm(mpg_c ~ 1, data=autodata) 

# Perform "forward" selection starting from the NULL model and set up the scope to have an upper = FULL model. 

forw <- step(null, scope=list(lower=null, upper=full), direction="forward")
forw.lm <- lm(mpg_c ~ wgt_c + modelyr_mvd + origin_mvd, data = autodata)
summary(forw.lm)
anova(forw.lm)

# Backwards Selection

back <- step(full, data=autodata, direction="backward")
back.lm <- lm(mpg_c ~ cylnum_mvd + displ_c + as.numeric(hp_c) + wgt_c + modelyr_mvd + 
                origin_mvd, data = autodata)
summary(back.lm)
anova(back.lm)

# Stepwise Selection

stepwise<- step(null, scope = list(upper=full), data=autodata, direction="both")
stepwise.lm <- lm(mpg_c ~ wgt_c + modelyr_mvd + origin_mvd, data = autodata)
summary(stepwise.lm)
anova(stepwise.lm)

# Per Regressor Selection (using regsub)

regsub.exhaust<-regsubsets(mpg_c ~ cylnum_mvd + displ_c + hp_c + wgt_c + acc_c + modelyr_mvd + origin_mvd, data=autodata, nbest = 1, nvmax = NULL,force.in = NULL, force.out = NULL, intercept=TRUE, method = "exhaustive")
regsub.exhaust

summary.out <- summary(regsub.exhaust)
summary.out

# Results:
# 1: wgt_c
# R^2: 0.6923, AR^2: 0.6915404, MSQ: 18.8, CP: 273.677433 (- 2) = 271.677433

# 2: wgt_c + modelyr_mvd
# R^2: 0.8082216, AR^2: 0.8072331, MSQ: 11.8, CP: 26.818489 (- 3) = 23.818489

# 3: wgt_c + modelyr_mvd + origin_mvd (suggested in forward and stepwise selection)
# R^2: 0.8175810, AR^2: 0.8161669, MSQ: 11.2, CP: 8.720387 (- 4) = 4.720387

# 4: wgt_c + modelyr_mvd + origin_mvd + acc_c
# R^2: 0.8182576, AR^2: 0.8163742, MSQ: 11.2, CP: 9.267651 (- 5) = 4.267651

# 5: wgt_c + modelyr_mvd + origin_mvd + hp_c + displ_c
# R^2: 0.8200523, AR^2: 0.8177153, MSQ: 11.1, CP: 7.413791 (- 6) = 1.413791

# 6: wgt_c + modelyr_mvd + origin_mvd + hp_c + displ_c + cylnum_mvd (suggested in backwards selection)
# R^2: 0.8212921, AR^2: 0.8184998, MSQ: 11.1, CP: 6.751394 (- 7) = -0.249

# 7: wgt_c + modelyr_mvd + origin_mvd + hp_c + displ_c + cylnum_mvd + acc_c
# R^2: 0.8216420, AR^2: 0.8183822, MSQ: 11.1, CP: 8.000000 (- 8) = 0

# 7 appears to fit all our criteria: maximized R^2 and AR^2, minimized MSQ, CP - p = 0..
# Let's check normality and constant variance:

lm7 <- lm(mpg_c ~ wgt_c + modelyr_mvd + origin_mvd + hp_c + displ_c + cylnum_mvd + acc_c, data = autodata)
qqline(resid(lm7)) 
# Mostly normal except for the upper right tail...
plot(lm7$fitted.values, resid(lm7))
# Oooh, has kind of a horseshoe pattern, let's apply a log transformation:
lm7 <- lm(log(mpg_c) ~ wgt_c + modelyr_mvd + origin_mvd + hp_c + displ_c + cylnum_mvd + acc_c, data = autodata)
plot(lm7$fitted.values, resid(lm7))
# Much better! Let's check normality again:
qqnorm(resid(lm7))
qqline(resid(lm7))
# Still mostly normal, but now it has a lower left tail in addition to an upper right..

# Some partial regression plots:

# wgt_c - Contributes some!
lm7_no_wgt <- lm(log(mpg_c) ~ modelyr_mvd + origin_mvd + hp_c + displ_c + cylnum_mvd + acc_c, data = autodata)
lm7_wgt_to_rest <- lm(wgt_c ~ modelyr_mvd + origin_mvd + hp_c + displ_c + cylnum_mvd + acc_c, data = autodata)
plot(resid(lm7_no_wgt), resid(lm7_wgt_to_rest))

# modelyr_mvd - Contributes some!
lm7_no_modelyr <- lm(log(mpg_c) ~ wgt_c + origin_mvd + hp_c + displ_c + cylnum_mvd + acc_c, data = autodata)
lm7_modelyr_to_rest <- lm(modelyr_mvd ~ wgt_c + origin_mvd + hp_c + displ_c + cylnum_mvd + acc_c, data = autodata)
plot(resid(lm7_no_modelyr), resid(lm7_modelyr_to_rest))

# origin_mvd - Looks really weird - 3 horizontal layers on top of each other??
lm7_no_origin <- lm(log(mpg_c) ~ wgt_c + modelyr_mvd + hp_c + displ_c + cylnum_mvd + acc_c, data = autodata)
lm7_origin_to_rest <- lm(origin_mvd ~ wgt_c + modelyr_mvd + hp_c + displ_c + cylnum_mvd + acc_c, data = autodata)
plot(resid(lm7_no_origin), resid(lm7_origin_to_rest))

# acc_c - Looks like it doesn't contribute much
lm7_no_acc <- lm(log(mpg_c) ~ wgt_c + origin_mvd + hp_c + displ_c + cylnum_mvd + modelyr_mvd, data = autodata)
lm7_acc_to_rest <- lm(acc_c ~ wgt_c + origin_mvd + hp_c + displ_c + cylnum_mvd + modelyr_mvd, data = autodata)
plot(resid(lm7_no_acc), resid(lm7_acc_to_rest))

# cylnum_mvd - Looks like it doesn't contribute much
lm7_no_cylnum <- lm(log(mpg_c) ~ wgt_c + origin_mvd + hp_c + displ_c + acc_c + modelyr_mvd, data = autodata)
lm7_cylnum_to_rest <- lm(cylnum_mvd ~ wgt_c + origin_mvd + hp_c + displ_c + acc_c + modelyr_mvd, data = autodata)
plot(resid(lm7_no_cylnum), resid(lm7_cylnum_to_rest))

# hp_c - Looks like it doesn't contribute much
lm7_no_hp <- lm(log(mpg_c) ~ wgt_c + origin_mvd + cylnum_mvd + displ_c + acc_c + modelyr_mvd, data = autodata)
lm7_hp_to_rest <- lm(hp_c ~ wgt_c + origin_mvd + cylnum_mvd + displ_c + acc_c + modelyr_mvd, data = autodata)
plot(resid(lm7_no_hp), resid(lm7_hp_to_rest))

# displ_c - Looks like it doesn't contribute much, maybe BARELY a linear relationship
lm7_no_displ <- lm(log(mpg_c) ~ wgt_c + origin_mvd + cylnum_mvd + hp_c + acc_c + modelyr_mvd, data = autodata)
lm7_displ_to_rest <- lm(displ_c ~ wgt_c + origin_mvd + cylnum_mvd + hp_c + acc_c + modelyr_mvd, data = autodata)
plot(resid(lm7_no_displ), resid(lm7_displ_to_rest))


# Let's check influential points:

print(influence.measures(lm7))
# We have at least 7 seemingly influential points (of the first 65 or so)

vif(lm7)
# wgt_c        modelyr_mvd origin_mvd  hp_c       displ_c     cylnum_mvd   acc_c 
# 10.822442    1.243182    1.770100    9.968706   21.775021   10.738102    2.623655

# -- test if each β =0, make residual plots to check the key assumptions,
# -- investigate the relationship 
# -- (1) between different predictors (e.g., check VIF), 

plot(autodata$cylnum_mvd, autodata$displ_c,
     pch = 18, 
     cex = 1.0, 
     col = "blue", 
     main = "Displacement vs Number of Cylinders", 
     xlab = "Cylinder Number", 
     ylab = "Displacement")

# -- (2) between y and predictors (e.g., using partial regression plots, and so on)
# Step 3: Fix the assumption violation problems and refit a model
# -- If necessary, transform your data, then refit a model, do variable selection, etc.
# -- repeat step 2, then step 3 again until you get satisfied with your data analysis results.

# Step 4: Summarize your data analysis results

summary(autodata.lm.full)
anova(autodata.lm.full)

autodata$hp_c <- as.numeric(as.character(autodata$hp_c))

autodata.lm.full <- lm(mpg_c ~ cylnum_mvd + displ_c + hp_c + wgt_c + acc_c + modelyr_mvd + origin_mvd, data=autodata) 

summary(autodata.lm.full)
anova(autodata.lm.full)

# Latent variable discrete choice (structural equations model)
# Latent variables - not directly observed but rather inferred from observed variables (factor analysis, PCA, HMM, structured equation models)
