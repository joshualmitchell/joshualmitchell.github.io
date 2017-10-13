setwd("/Users/jm/joshualmitchell.github.io/MATH5345/proj")
# Set's the working directory (i.e. tells R where the data is)

autodata <- read.table("raw_auto-mpg.text", header=TRUE) # see line 4
pokedata <- read.csv("raw_pokemon.csv", header=TRUE) # see line 4
# Here, we're importing our data from the files into variables.
# header=TRUE just means the first column is actual data, not an unimportant/implied column (like an index column)

head(autodata)
# I'm not sure what X18.0, X8, etc. mean...
head(pokedata)
# I'm not sure what X. means...

# So, I'm going to rename the columns to standardize everything: "{column_name}_{c|str|mvd}"
# First part: a short, explanatory column name
# Second part: an abbreviation about the data (I like the UCI ML Repo's conventions, so I'll use them here)
# Open question: Is there a standard for naming your columns?

colnames(autodata) <- c("mpg_c", "cylnum_mvd", "displ_c", "hp_c", "wgt_c", "acc_c", "modelyr_mvd", "origin_mvd", "name_str")
colnames(pokedata) <- c("pokemon_num_mvd", "name_str", "type_1_str", "type_2_str", "total_c", "hp_c", "attack_c", "defense_c", "sp_attack_c", "sp_defense_c", "speed_c", "generation_mvd", "legendary_bool")

head(autodata)
# I'm still not sure what origin means. It's possible values are: {1, 2, 3}.
# The data's description:
# https://archive.ics.uci.edu/ml/machine-learning-databases/auto-mpg/auto-mpg.names
# doesn't say much. Oh well, let's see how it affects our data.

head(pokedata)
# A problem: there are duplicate pokemon in our pokemon data set.
# Questions to ask: How will this affect models? Why are there duplicates? What happens if we just delete them?
# Possible explanation: data comes from different TV show versions, maybe different video game versions...

# To start: What percentage of our data is like this?
pokedata_without_duplicates <- pokedata[!duplicated(pokedata$pokemon_num_mvd),]
# Long story short, if the row has a pokemon number (i.e. 3 for Venusaur) we've already seen, we delete it.

# Now, let's see how much data we delete when we get rid of duplicates:
percentage <- (nrow(pokedata_without_duplicates)/nrow(pokedata))*100
percentage

# Okay, so duplicates are about ~10% of our data.
# I'm not entirely sure what implications that has, so let's look at statistics with both data sets.

write.table(pokedata_without_duplicates, file = "pokedata_formatted.csv", sep = ",", na = "NA", row.names = TRUE, col.names = TRUE)
write.table(autodata, file = "autodata_formatted.csv", sep = ",", na = "NA", row.names = TRUE, col.names = TRUE)

auto_y = autodata[, 1]
auto_x = autodata[, 2:8]

summary(y)
hist(y)
dim(autodata)
summary(x)

# cmodel = lm(y ~ ., data = cbind.data.frame(y, x)) 
carmodel = lm(y~x)
summary(carmodel)

pokedata <- read.csv("Pokemon.csv", header=T)
dim(pokedata)
summary(pokedata$HP)
colnames(pokedata)
hist(pokedata$HP)

# Multi co-linearity / multilinearity
# variable selection to get rid of colinearity (possibly)

par(mfrow = c(2, 2))
plot(pokedata$HP, pokedata$Defense)
plot(pokedata$HP, pokedata$Sp..Atk)
plot(pokedata$Attack, pokedata$Defense)

as.factor(x3)