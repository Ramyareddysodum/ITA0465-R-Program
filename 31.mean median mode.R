# Sample dataset
dataset <- c(3, 5, 2, 7, 5, 8, 4, 5, 6, 9)

# Mean calculation
mean_value <- mean(dataset)
cat("Mean:", mean_value, "\n")

# Median calculation
median_value <- median(dataset)
cat("Median:", median_value, "\n")

# Mode calculation
get_mode <- function(x) {
  uniq_x <- unique(x)
  uniq_x[which.max(tabulate(match(x, uniq_x)))]
}
mode_value <- get_mode(dataset)
cat("Mode:", mode_value, "\n")
