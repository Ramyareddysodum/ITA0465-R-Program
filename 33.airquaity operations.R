# Load the airquality dataset
data("airquality")

# (i) Get the Summary Statistics of air quality dataset
summary_stats <- summary(airquality)
print("(i) Summary Statistics of air quality dataset:")
print(summary_stats)

# (ii) Melt airquality dataset and display as a long-format data
library(reshape2)
melted_data_long <- melt(airquality)
print("(ii) Melted airquality data set (long-format data):")
print(head(melted_data_long))

# (iii) Melt airquality data and specify month and day to be “ID variables”
melted_data_id <- melt(airquality, id.vars = c("Month", "Day"))
print("(iii) Melted airquality data set with Month and Day as ID variables:")
print(head(melted_data_id))

# (iv) Cast the molten airquality data set with respect to month and date features
casted_data <- dcast(melted_data_id, Month + Day ~ variable)
print("(iv) Casted airquality data set with respect to Month and Day:")
print(head(casted_data))

# (v) Use cast function appropriately and compute the average of Ozone, Solar.R, Wind, and temperature per month
averages_per_month <- dcast(melted_data_id, Month ~ variable, mean)
print("(v) Average values of Ozone, Solar.R, Wind, and temperature per month:")
print(averages_per_month)
