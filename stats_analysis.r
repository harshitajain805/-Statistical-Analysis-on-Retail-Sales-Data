# Load necessary libraries
library(dplyr)
library(ggplot2)
library(tidyr)
library(lubridate)

# Set the working directory (change this to your directory)
setwd("archive")

# Load the datasets
stores <- read.csv("stores data-set.csv")
features <- read.csv("Features data set.csv")
sales <- read.csv("sales data-set.csv")


# Data Cleaning
# Check for missing values
summary(stores)
summary(features)
summary(sales)

# Remove any rows with NA values in sales
sales <- na.omit(sales)

# Convert date columns to Date type
sales$Date <- as.Date(sales$Date)
features$Date <- as.Date(features$Date)

# Merge datasets
merged_data <- sales %>%
  left_join(features, by = c("Store", "Date")) %>%
  left_join(stores, by = "Store")

# Check if 'IsHoliday' exists in merged_data
if(!"Holiday" %in% colnames(merged_data)) {
  stop("IsHoliday column not found in merged_data.")
}

# Exploratory Data Analysis (EDA)

## Summary Statistics
summary(merged_data)

## Visualizations
# Sales over time
ggplot(data = merged_data, aes(x = Date, y = Weekly_Sales)) +
  geom_line() +
  labs(title = "Weekly Sales Over Time", x = "Date", y = "Weekly Sales") +
  theme_minimal()

# Boxplot of sales by store type
ggplot(data = merged_data, aes(x = Type, y = Weekly_Sales)) +
  geom_boxplot() +
  labs(title = "Sales Distribution by Store Type", x = "Store Type", y = "Weekly Sales") +
  theme_minimal()

# Hypothesis Testing

## Hypothesis 1: Impact of Holiday on Sales
# H0: There is no difference in sales during holiday weeks vs non-holiday weeks.
# H1: There is a difference in sales during holiday weeks vs non-holiday weeks.

holiday_sales <- merged_data %>%
  group_by(IsHoliday) %>%
  summarise(mean_sales = mean(Weekly_Sales))

print(holiday_sales)

t_test_result <- t.test(Weekly_Sales ~ IsHoliday, data = merged_data)
print(t_test_result)

## Hypothesis 2: Impact of Markdowns on Sales
# H0: Markdowns have no effect on sales.
# H1: Markdowns have an effect on sales.

markdown_model <- lm(Weekly_Sales ~ MarkDown1 + MarkDown2 + MarkDown3 + MarkDown4 + MarkDown5 + IsHoliday, data = merged_data)
summary(markdown_model)

### Model Validation

# Check residuals for normality and homoscedasticity
par(mfrow=c(2,2))
plot(markdown_model)

### Conclusion and Recommendations

if (t_test_result$p.value < 0.05) {
  print("Reject the null hypothesis: There is a significant difference in sales during holiday weeks.")
} else {
  print("Fail to reject the null hypothesis: No significant difference in sales during holiday weeks.")
}

if (summary(markdown_model)$coefficients[2,4] < 0.05) {
  print("Reject the null hypothesis: Markdowns have a significant effect on sales.")
} else {
  print("Fail to reject the null hypothesis: No significant effect of markdowns on sales.")
}

summary(merged_data)

summary(markdown_model)


