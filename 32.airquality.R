data("airquality")
mean_temp <- sum(airquality$Temp) / length(airquality$Temp)
cat("Mean temperature:", mean_temp, "°F\n")
first_five_rows <- airquality[1:5, ]
cat("First five rows:\n")
print(first_five_rows)
selected_columns <- airquality[, !(names(airquality) %in% c("Temp", "Wind"))]
cat("Columns except Temp and Wind:\n")
print(selected_columns)
coldest_day <- airquality[which.min(airquality$Temp), "Day"]
cat("Coldest day during the period:", coldest_day, "\n")
wind_gt_17_count <- sum(airquality$Wind > 17, na.rm = TRUE)
cat("Number of days with wind speed greater than 17 mph:", wind_gt_17_count, "\n")
