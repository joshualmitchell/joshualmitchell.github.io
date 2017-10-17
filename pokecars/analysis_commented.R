setwd("/Users/jm/joshualmitchell.github.io/pokecars")
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

# Now for a quick peek at our data:

head(autodata)
# I'm still not sure what origin means. It's possible values are: {1, 2, 3}.
# The data's description:
# https://archive.ics.uci.edu/ml/machine-learning-databases/auto-mpg/auto-mpg.names
# doesn't say much. Oh well, let's see how it affects our models later.

head(pokedata)
# A problem: there are duplicate pokemon in our pokemon data set.
# Questions to ask: How will this affect models? Why are there duplicates? What happens if we just delete them?
# Possible explanation: data comes from different TV show versions, maybe different video game versions...

# To start: What percentage of our data is like this?
# Let's make a copy of our data without those duplicates.
pokedata_without_duplicates <- pokedata[!duplicated(pokedata$pokemon_num_mvd),]
# Long story short, if the row has a pokemon number (i.e. 3 for Venusaur) we've already seen, we delete it.

# Now, let's see how much data we delete when we get rid of duplicates:
percentage <- (nrow(pokedata_without_duplicates)/nrow(pokedata))*100
percentage

# Okay, so duplicates are about ~10% of our data. That sounds like a lot.

# Let's look at car:

# Another way to do a quick (more quantitative) glance is with summary:
summary(autodata)
# This will give us some quick numbers about each of our features / columns.

# It might be easier to see trends and distributions with some plots and graphs.
# Let's look at the first 4: mpg_c, cylnum_mvd, displ_c, hp_c

hist(autodata$mpg_c, xlab="Miles per gallon", ylab="Number of cars with x miles per galon")
# Looks somewhat normally distributed with a longer tail on the right.
# This makes sense since, if the mean is ~20,
# there are probably more consumer cars with >30 mpg than there are with <10 mpg.

barplot(table(autodata$cylnum_mvd), main="Occurrences of cars with x cylinders", 
        xlab="Number of Cylinders", ylab="Frequency")
# Most cars are 4 cylinder engines, followed by 8, and then 6. Makes sense.
# Looks like there are a few outliers that have 3 and 5 cylinders.

hist(autodata$displ_c, main="Occurrences of cars with x displacement", 
     xlab="Displacement Amount", ylab="Frequency")
# So this is all over the place.
# Since displacement is a measure of the total volume of all the cylinders in an engine,
# we should expect to see a relationship or correlation between displacement and cylinders.
# More on that in a minute.

hist(autodata$hp_c)
# What? This doesn't work? What do you mean 'x' must be numeric?
# I thought our data was numeric? It's labeled as continuous (aka numeric).
# Let's look at the data again:

autodata$hp_c
# Ohhhhh.. there are a few question marks where numbers should be.
# Questions to ask: What does this mean? Should we throw out all rows with question marks in at least 1 column?
# Should we replace all question marks with 0?
# Let's start with how many of our rows have question marks.
# Luckily, the webpage I got this data set from:
# https://archive.ics.uci.edu/ml/machine-learning-databases/auto-mpg/auto-mpg.names
# Tells us that yes, it does have missing values, and that there are 6 of them with horse power missing.

dim(autodata)
# Okay, so 6/397 is about 1.5% of our data that we'd be missing.
# Doesn't seem like we'd be missing out *too* much if we just deleted those, in this case.
# We are implicitly assuming a lot by deleting them - there are cases where we shouldn't.

# For example: We're looking at cancer data with a sample of 100 people. 10 have cancer, 90 don't.
# If the 1.5% of our "bad" data came from the 10 cancer samples, we'd be removing 10-20% of the
# information we have about an important feature.

autodata_formatted <- subset(autodata, !autodata[ , 4] == "?")
# What I did here is replaced our data with a subset of the data containing only rows where hp_c isn't "?"

dim(autodata)
dim(autodata_formatted)
# Cool, looks like we got rid of those 6 values.

# Let's try again.
hist(autodata_formatted$hp_c)
# What?? But they're all numeric now!
# Or are they? Let's look at the structure of what we know worked (displacement) vs horsepower:

str(autodata$displ_c)
# Okay, a list of numbers, awesome.

str(autodata_formatted$hp_c)
# Factors??
# Hmm, it looks like, since we had ?'s at first, so R thought that column was a list of strings

# Let's convert all our values back to integers:
autodata_formatted$hp_c <- as.numeric(as.character(autodata_formatted$hp_c))

# Now let's take another look
str(autodata_formatted$hp_c)
# Cool! Looks like displacement.

# Let's try again:
hist(autodata_formatted$hp_c)
# Bingo.
# Okay. Looks normally distributed with a hump and a long tail.

# At this point, we've looked at mpg, cylnum, displ, and hp.
# Let's do a quick look at the others:

str(autodata_formatted)
# Since cylnum, modelyr, and origin are multivariate discrete
# (a list of numbers that act more like categories), 
# a list of ints is fine.

# The only other feature is just the car name, which we could possibly do some NLP or something with,
# but that's for another time, so a list of name factors is fine.

# Let's look at the relationship between a few features.
# Remember how displacement is the total volume of all cylinders?
# Let's see what it looks like when we graph them against each other.

plot(autodata_formatted$cylnum_mvd, autodata_formatted$displ_c,
     pch = 18, 
     cex = 1.0, 
     col = "blue", 
     main = "Displacement vs Number of Cylinders", 
     xlab = "Cylinder Number", 
     ylab = "Displacement")
# Yup, looks like a pretty linear relationship.

# What if we wanted to predict, based on the shown relationship between displacement and cylinders,
# how much displacement a car with 7 cylinders would have?

# I'm going to gloss over all the math for now, but this is where machine learning would take over.
# In this case, we're going to do a simple linear regression, 
# which just means finding a best fit line and plugging in the x (7) we want a predicted y (displacement) for.

displ_c <- autodata_formatted$displ_c
cylnum_mvd <- autodata_formatted$cylnum_mvd
autodata_formatted.lm <- lm(displ_c ~ cylnum_mvd) 
# We just created a simple linear regression model for displacement and cylinders.
abline(autodata_formatted.lm) 
# Now we're going to graph that line.

# To get an exact value:
prediction <- predict(autodata_formatted.lm, data.frame(cylnum_mvd = 7))
prediction # 283.7525 displacement, in theory, for 7 cylinders.

# What if we wanted to take into account all of our features?
# Let's predict mpg based on everything else.

mpg_c <- autodata_formatted$mpg_c
hp_c <- autodata_formatted$hp_c
wgt_c <- autodata_formatted$hp_c
acc_c <- autodata_formatted$acc_c
modelyr_mvd <- autodata_formatted$modelyr_mvd
origin_mvd <- autodata_formatted$origin_mvd

autodata_formatted.lm.full <- lm(mpg_c ~ cylnum_mvd + displ_c + hp_c + wgt_c + acc_c + modelyr_mvd + origin_mvd, data=autodata_formatted) 

# Let's predict the MPG of a car with 4 cyls, 200 displacement, 110 hp, 2500 weight, 10 acc, 70 model yr, and origin of 1
new = data.frame(cylnum_mvd = 4, displ_c = 200, hp_c = 110, wgt_c = 2500, acc_c = 10, modelyr_mvd = 70, origin_mvd = 1)
prediction <- predict(autodata_formatted.lm.full, new)
prediction # 21.49907
# 21.49907 MPG sounds reasonable.

# Remember how we didn't know what the origin meant? Let's see how it affects our prediction, all else being equal:

new = data.frame(cylnum_mvd = 4, displ_c = 200, hp_c = 110, wgt_c = 2500, acc_c = 10, modelyr_mvd = 70, origin_mvd = 2)
prediction <- predict(autodata_formatted.lm.full, new)
prediction # 22.92644
# Okay, so an origin of 2 predicts about 1.5 MPG more than origin 1 for this car.

new = data.frame(cylnum_mvd = 4, displ_c = 200, hp_c = 110, wgt_c = 2500, acc_c = 10, modelyr_mvd = 70, origin_mvd = 3)
prediction <- predict(autodata_formatted.lm.full, new)
prediction # 24.35382
# Okay, so an origin of 2 predicts about 3 MPG more than origin 1 for this car.

# A "higher" origin correlates with a higher MPG.