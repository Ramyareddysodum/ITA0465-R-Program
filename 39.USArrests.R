
library(dplyr)
library(ggplot2)
data("USArrests")
num_features <- ncol(USArrests)
feature_types <- sapply(USArrests, class)
cat("Number of features:", num_features, "\n")
cat("Feature types:", feature_types, "\n")
num_records <- nrow(USArrests)
cat("Number of records:", num_records, "\n")
summary(USArrests)
state_with_largest_rape <- USArrests$Rape %>% which.max()
cat("State with the largest total number of rape:", rownames(USArrests)[state_with_largest_rape], "\n")
state_with_max_murder <- USArrests$Murder %>% which.max()
state_with_min_murder <- USArrests$Murder %>% which.min()
cat("State with the highest crime rate for murder:", rownames(USArrests)[state_with_max_murder], "\n")
cat("State with the lowest crime rate for murder:", rownames(USArrests)[state_with_min_murder], "\n")
correlation_matrix <- cor(USArrests)
print(correlation_matrix)
median_assault <- median(USArrests$Assault)
states_above_median_assault <- rownames(USArrests)[USArrests$Assault > median_assault]
cat("States with assault arrests more than median:", states_above_median_assault, "\n")
murder_25_percentile <- quantile(USArrests$Murder, 0.25)
states_bottom_25_murder <- rownames(USArrests)[USArrests$Murder < murder_25_percentile]
cat("States in the bottom 25% of murder:", states_bottom_25_murder, "\n")
hist(USArrests$Murder, main = "Histogram of Murder Arrests", xlab = "Murder Arrests")
lines(density(USArrests$Murder), col = "blue")
ggplot(USArrests, aes(x = UrbanPop, y = Murder, color = Assault)) +
  geom_point() +
  labs(title = "Murder Arrest Rate vs. Urban Population Proportion",
       x = "Urban Population Proportion",
       y = "Murder Arrest Rate") +
  scale_color_gradient(low = "blue", high = "red")
bar_plot <- ggplot(USArrests, aes(x = reorder(row.names(USArrests), Murder), y = Murder)) +
  geom_bar(stat = "identity", fill = "dodgerblue") +
  coord_flip() +
  labs(title = "Murder Rate by State",
       x = "State",
       y = "Murder Rate")
print(bar_plot)
