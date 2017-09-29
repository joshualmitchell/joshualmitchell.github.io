setwd("/Users/jm/joshualmitchell.github.io/MATH5345/proj")
autodata <- read.table("auto-mpg.text", header=T)
colnames(autodata) <- c("mpg", "cyls", "displ", "hp", "wgt", "acc", "modyr", "origin", "name")

# 1. mpg: continuous 
# 2. cylinders: multi-valued discrete 
# 3. displacement: continuous 
# 4. horsepower: continuous 
# 5. weight: continuous 
# 6. acceleration: continuous 
# 7. model year: multi-valued discrete 
# 8. origin: multi-valued discrete 
# 9. car name: string (unique for each instance)

# str(autodata[1])
# str(c(autodata[1]))
# str(c(y))
# str(c(1,2,3))

y = autodata[, 1]
x = autodata[, 2:8]

summary(y)
hist(y)
dim(autodata)
summary(x)

# cmodel = lm(y ~ ., data = cbind.data.frame(y, x)) 
carmodel = lm(y~x)
summary(carmodel)

pokedata <- read.csv("Pokemon.csv", header=T)

summary(pokedata$HP)
hist(pokedata$HP)

# Multi co-linearity / multilinearity
# variable selection to get rid of colinearity (possibly)

par(mfrow = c(2, 2))
plot(pokedata$HP, pokedata$Defense)
plot(pokedata$HP, pokedata$Sp..Atk)
plot(pokedata$Attack, pokedata$Defense)

as.factor(x3)