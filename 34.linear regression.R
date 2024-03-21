library(ggplot2)
data(airquality)
missing_percent <- colMeans(is.na(airquality)) * 100
print(missing_percent)
for (col in names(airquality)) {
  if (missing_percent[col] < 10) {
    mean_value <- mean(airquality[, col], na.rm = TRUE)
    airquality[is.na(airquality[, col]), col] <- mean_value
  } else {
    airquality <- airquality[complete.cases(airquality[, col]), ]
  }
}
model <- lm(Ozone ~ Solar.R, data = airquality)
summary(model)
ggplot(data = airquality, aes(x = Solar.R, y = Ozone)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "blue") +
  labs(x = "Solar.R", y = "Ozone", title = "Scatter Plot with Linear Regression")