setwd("/Users/jm/joshualmitchell.github.io/MATH5345/TakeHomeFinal")
library(leaps)
library(car)
library(xtable)
library(locfit)

chemdata <- read.table("chemdata.txt", header=FALSE)
colnames(chemdata) <- c("valve", "numfailure", "months")

glm <- glm(numfailure ~ months, poisson(link=log), data = chemdata)
summary(glm)
anova(glm)

# Based on the Wald test statistic, months is statistically significant.

glm2 <- glm(numfailure ~ months + I(months^2), poisson(link=log), data = chemdata)
summary(glm2)
anova(glm2)

anova(glm2, test="Chisq")
