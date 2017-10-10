setwd("/Users/jm/joshualmitchell.github.io/MATH5345/HW4")
data <- read.table("3.1data.txt", header=T)
data

# Strip into y and x:

last_column <- ncol(data)
x = data[,c(2:last_column)]
y = data[,1]

model <- lm(y ~ x$x2 + x$x7 + x$x8, data=data)
# xtable(model) # Used to generate LaTeX versions
xtable(anova(model))
