# install.packages("leaps")
# install.packages("car")
# install.packages("alr3")
library(leaps)
library(car)
library(xtable)
library(alr3)

# ?regsubsets. # No documentation for ‘regsubsets.’ in specified packages and libraries
setwd("/Users/jm/joshualmitchell.github.io/MATH5345/HW7/")

########################################################################################
###################### Question 1
########################################################################################

## A

q1data <- read.table("HW7Q1data.txt", header=T)
glm.1 <- glm(y ~ x1 + x2, family=binomial(link=logit), data=q1data)
summary(glm.1)
anova(glm.1)

## D

new <- data.frame(x1 = 45000, x2 = 5)
predict(glm.1, new) # 1.214124
# 1.214124 : 1 --> p / 1 - p = 1.214124 --> p = 1.214124(1 - p) --> 2.214124p = 1.214124 = 0.548354112

## E

glm.2 <- glm(y ~ x1 + x2 + (x1)*(x2), family=binomial(link=logit), data=q1data)
