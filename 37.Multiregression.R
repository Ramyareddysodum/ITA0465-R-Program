
data("ChickWeight")

# Convert 'Diet' variable to factor
ChickWeight$Diet <- as.factor(ChickWeight$Diet)

# Create multi regression model to find the weight of the chicken, with "Time" and "Diet" as predictor variables
multi_regression_model <- lm(weight ~ Time + Diet, data = ChickWeight)

# Predict weight for Time=10 and Diet=1
new_data <- data.frame(Time = 10, Diet = factor(1))  # Ensure Diet is a factor
predicted_weight <- predict(multi_regression_model, newdata = new_data)

# Find the actual weight for the same Time and Diet
actual_weight <- ChickWeight$weight[ChickWeight$Time == 10 & ChickWeight$Diet == 1]

# Calculate the error in the model
error <- actual_weight - predicted_weight

# Display results
print("Multi Regression Model:")
print(summary(multi_regression_model))
print("Predicted Weight:")
print(predicted_weight)
print("Actual Weight:")
print(actual_weight)
print("Error in Model:")
print(error)
