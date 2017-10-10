smoke <- matrix(c(10,14,8,8,10, "", "", "", "", ""),ncol=5,byrow=TRUE)
colnames(smoke) <- c("Q1", "Q2", "Q3", "Q4", "Q5")
rownames(smoke) <- c("50 Points", "")
smoke <- as.table(smoke)
smoke

xtable(smoke, auto = TRUE)