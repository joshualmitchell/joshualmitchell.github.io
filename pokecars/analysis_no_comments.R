setwd("/Users/jm/joshualmitchell.github.io/pokecars")

autodata <- read.table("raw_auto-mpg.text", header=TRUE)
pokedata <- read.csv("raw_pokemon.csv", header=TRUE)

head(autodata)

head(pokedata)

colnames(autodata) <- c("mpg_c", "cylnum_mvd", "displ_c", "hp_c", "wgt_c", "acc_c", "modelyr_mvd", "origin_mvd", "name_str")
colnames(pokedata) <- c("pokemon_num_mvd", "name_str", "type_1_str", "type_2_str", "total_c", "hp_c", "attack_c", "defense_c", "sp_attack_c", "sp_defense_c", "speed_c", "generation_mvd", "legendary_bool")

head(autodata)

head(pokedata)

pokedata_without_duplicates <- pokedata[!duplicated(pokedata$pokemon_num_mvd),]

percentage <- (nrow(pokedata_without_duplicates)/nrow(pokedata))*100
percentage

summary(autodata)

hist(autodata$mpg_c, xlab="Miles per gallon", ylab="Number of cars with x miles per galon")

barplot(table(autodata$cylnum_mvd), main="Occurrences of cars with x cylinders", 
        xlab="Number of Cylinders", ylab="Frequency")

hist(autodata$displ_c, main="Occurrences of cars with x displacement", 
     xlab="Displacement Amount", ylab="Frequency")

hist(autodata$hp_c)

autodata$hp_c

dim(autodata)

autodata_formatted <- subset(autodata, !autodata[ , 4] == "?")

dim(autodata)
dim(autodata_formatted)

hist(autodata_formatted$hp_c)

str(autodata$displ_c)

str(autodata_formatted$hp_c)

autodata_formatted$hp_c <- as.numeric(as.character(autodata_formatted$hp_c))

str(autodata_formatted$hp_c)

hist(autodata_formatted$hp_c)

str(autodata_formatted)

plot(autodata_formatted$cylnum_mvd, autodata_formatted$displ_c,
     pch = 18, 
     cex = 1.0, 
     col = "blue", 
     main = "Displacement vs Number of Cylinders", 
     xlab = "Cylinder Number", 
     ylab = "Displacement")

displ_c <- autodata_formatted$displ_c
cylnum_mvd <- autodata_formatted$cylnum_mvd
autodata_formatted.lm <- lm(displ_c ~ cylnum_mvd) 

abline(autodata_formatted.lm) 

prediction <- predict(autodata_formatted.lm, data.frame(cylnum_mvd = 7))
prediction

mpg_c <- autodata_formatted$mpg_c
hp_c <- autodata_formatted$hp_c
wgt_c <- autodata_formatted$hp_c
acc_c <- autodata_formatted$acc_c
modelyr_mvd <- autodata_formatted$modelyr_mvd
origin_mvd <- autodata_formatted$origin_mvd

autodata_formatted.lm.full <- lm(mpg_c ~ cylnum_mvd + displ_c + hp_c + wgt_c + acc_c + modelyr_mvd + origin_mvd, data=autodata_formatted) 

new = data.frame(cylnum_mvd = 4, displ_c = 200, hp_c = 110, wgt_c = 2500, acc_c = 10, modelyr_mvd = 70, origin_mvd = 1)
prediction <- predict(autodata_formatted.lm.full, new)
prediction

new = data.frame(cylnum_mvd = 4, displ_c = 200, hp_c = 110, wgt_c = 2500, acc_c = 10, modelyr_mvd = 70, origin_mvd = 2)
prediction <- predict(autodata_formatted.lm.full, new)
prediction

new = data.frame(cylnum_mvd = 4, displ_c = 200, hp_c = 110, wgt_c = 2500, acc_c = 10, modelyr_mvd = 70, origin_mvd = 3)
prediction <- predict(autodata_formatted.lm.full, new)
prediction
# Latent variable discrete choice (structural equations model)

# Latent variables - not directly observed but rather inferred from observed variables (factor analysis, PCA, HMM, structured equation models)
