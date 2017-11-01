# install.packages("leaps")
# install.packages("car")
library(leaps)
library(car)
# ?regsubsets. # No documentation for ‘regsubsets.’ in specified packages and libraries
setwd("/Users/jm/joshualmitchell.github.io/MATH5345/HW5/")

nfl_data <- read.table("HW5NFL.txt", header=T)
# dim(nfl_data)
# nfl_data

########################################################################################
###################### Question 1
########################################################################################
full<-lm(y ~ ., data = nfl_data) # Fit a FULL linear model with all variables in the data. 
null<-lm(y ~ 1, data = nfl_data) # Fit a NULL model with just intercept. 

# Perform "forward" selection starting from the NULL model and set up the scope to have an upper = FULL model. 
# Question 1 (a)

forw <- step(null, scope=list(lower=null, upper=full), direction="forward")
forw.lm <- lm(y ~ x8 + x2 + x7 + x9, data = nfl_data)
summary(forw.lm)
anova(forw.lm)

# Question 1 (b)

back <- step(full, data= nfl_data, direction="backward")
back.lm <- lm(y ~ x2 + x7 + x8 + x9, data = nfl_data)
summary(back.lm)
anova(back.lm)

# Question 1 (c)

stepwise<- step(null, scope = list(upper=full), data=nfl_data, direction="both")
stepwise.lm <- lm(y ~ x8 + x2 + x7 + x9, data = nfl_data)
summary(stepwise.lm)
anova(stepwise.lm)

# Question 1 (d)

# Looking through each model's summary and anova, it looks like each one is identical
# (except for the order of regressors for backwards elimination: x2 + x7 + x8 + x9)
# x2, x7, x8, and x9 were all chosen to be the regressors.
# It looks like x2 and x8 are the most significant (at 3 and 2 stars)
# x7 was somewhat significant (one star) and x9 was barely significant enough to make it
# The multiple and adjusted R squared was the same for each model (0.8012, 0.7666)

########################################################################################
###################### Question 2
########################################################################################

regsub.exhaust<-regsubsets(y ~ x1 + x2 + x4 + x7 + x8 + x9, data = nfl_data, nbest = 1, nvmax = NULL,force.in = NULL, force.out = NULL, intercept=TRUE, method = "exhaustive")
regsub.exhaust

summary.out <- summary(regsub.exhaust)
summary.out
as.data.frame(summary.out$outmat)

# 1 regressor through 6 regressors:
summary.out$rss # [1] 148.87197  83.93820  69.87000  65.00435  63.13983  61.94123
# We want to minimize this: 61.94123

summary.out$cp # [1] 26.472221  6.457655  3.688101  4.038492  5.406361  7.000000
# 26.472221 - 2,  6.457655 - 3,  3.688101 - 4,  4.038492 - 5,  5.406361 - 6,  7.000000 - 7
# We want this to be as close to the number of parameters as possible: 7.000000 - 7

# From the documentation:

# Mallow Cp is used to decide on the number of predictors to include.
# The stopping rule is to start with the smallest model and gradually increase 
# the number of variables, and stop when Mallow Cp is approximately
# (number of regressors + 1, broken line) for the first time. 

# So, following this logic, it becomes somewhat close at 6.457655 - 3 before it goes negative.

summary.out$adjr2 # [1] 0.5271722 0.7227426 0.7595953 0.7666123 0.7630023 0.7564299
# We want this to be as close to 1 as possible: 0.7666123 (4 regressors)

summary.out$rsq # [1] 0.5446843 0.7432802 0.7863069 0.8011882 0.8068908 0.8105566
# We want this to be as close to 1 as possible: 0.8105566 (6 regressors)

which.min(summary.out$rss) # The model with 6 regressors.
summary.out$which[6,] # Intercept + x1 + x2 + x4 + x7 + x8 + + x9
min_rss.lm <- lm(y ~ x1 + x2 + x4 + x7 + x8 + + x9, data = nfl_data)

summary(min_rss.lm)
anova(min_rss.lm)

which.max(summary.out$adjr2) # The model with 4 regressors.
summary.out$which[4,] # Intercept + x2 + x7 + x8 + + x9
max_adjr2.lm <- lm(y ~ x2 + x7 + x8 + + x9, data = nfl_data)

summary(max_adjr2.lm)
anova(max_adjr2.lm)

which.max(summary.out$rsq) # The model with 6 regressors.
summary.out$which[6,] # Intercept + x1 + x2 + x4 + x7 + x8 + + x9
max_r2.lm <- lm(y ~ x1 + x2 + x4 + x7 + x8 + + x9, data = nfl_data)

summary(max_r2.lm)
anova(max_r2.lm)

# A final look: 

# RSS (which is MS_Res * (n - 2), so looking at RSS is similar to looking at MS_Res, we want both minimal)
# [1] 148.87197  83.93820  69.87000  65.00435  63.13983  61.94123
# CP
# [1] 26.472221  6.457655  3.688101  4.038492  5.406361  7.000000
# R^2 adj
# [1] 0.5271722 0.7227426 0.7595953 0.7666123 0.7630023 0.7564299
# R^2
# [1] 0.5446843 0.7432802 0.7863069 0.8011882 0.8068908 0.8105566

# Since, for models with 4, 5, and 6 regressors
# have approximately equal RSS's, R^2 adj's, and R^2's, 
# and the 6 regressor model has a CP - p equal to 0,
# All else being equal I'd go with the model with 6 regressors.
                          