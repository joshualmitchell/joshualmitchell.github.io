set.seed(123)
normal_pop <- rnorm(10000, mean = 10, sd = 3)
normal_sample_arr <- array(NA, dim = c(100, 50))
rs1 <- rs[ rs >= -19 & rs <= 19  ]

set.seed(123)
normal_pop_df = data.frame(matrix(rnorm(10000, mean = 10, sd = 3), nrow=10000))
normal_sample_arr <- array(NA, dim = c(100, 50))
for(i in 1:100) {
  normal_sample_arr[i, ] <- normal_pop_df[sample(nrow(normal_pop_df), 50), ]
}
head(normal_sample_arr)

# Cool! At this point, we have a population with 10,000 random samples from N(10, 3^2),
# and we have an array of 100 samples, each containing 50 entries (n = 50)