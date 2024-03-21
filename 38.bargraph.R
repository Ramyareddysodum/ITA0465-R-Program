library(ggplot2)
library(dplyr)
library(datasets)

# Load Titanic dataset
data("Titanic")

# Convert Titanic dataset to a data frame
titanic_df <- as.data.frame(Titanic)

# Convert factor levels to meaningful labels
titanic_df$Class <- factor(titanic_df$Class, labels = c("1st", "2nd", "3rd", "Crew"))
titanic_df$Survived <- factor(titanic_df$Survived, labels = c("No", "Yes"))

# Bar plot by passenger class
bar_plot_class <- titanic_df %>%
  group_by(Class, Survived) %>%
  summarise(Count = sum(Freq)) %>%
  ggplot(aes(x = Class, y = Count, fill = Survived)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Survival on Titanic by Passenger Class",
       x = "Passenger Class",
       y = "Count",
       fill = "Survived") +
  theme_minimal()

# Bar plot by gender
bar_plot_gender <- titanic_df %>%
  group_by(Sex, Survived) %>%
  summarise(Count = sum(Freq)) %>%
  ggplot(aes(x = Sex, y = Count, fill = Survived)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Survival on Titanic by Gender",
       x = "Gender",
       y = "Count",
       fill = "Survived") +
  theme_minimal()

# Histogram of passenger ages
histogram_age <- ggplot(titanic_df, aes(x = Age)) +
  geom_histogram(binwidth = 5, position = "identity", alpha = 0.7, fill = "dodgerblue", color = "black") +
  labs(title = "Distribution of Age on Titanic",
       x = "Age",
       y = "Count") +
  theme_minimal()

# Print the plots
print(bar_plot_class)
print(bar_plot_gender)
print(histogram_age)
