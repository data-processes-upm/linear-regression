# Does faculty salary vary by gender and/or rank?

# Set up
library(ggplot2)
library(dplyr)

# Load data from this website:
# See description: https://data.princeton.edu/wws509/datasets/#salary
salary_data <- read.table("http://data.princeton.edu/wws509/datasets/salary.dat"
  , header=TRUE)

# What is the number of males/females in the dataset? 
# What does this already tell you about the faculty...?


# Draw a violin plot showing the distribution of salaries for males and females

# Create this same plot, but *faceted* by rank

# Use a t-test to assess a difference in means between gender

# What is the number of professors at each rank (by gender)?
# (hint: use the `table()` function)

# What does this tell you about the department...?

# Simple linear regression: what is the salary increase associated with 
# each additional year in your current position (`yr`)?

# Interpret the following output of your model
# - betas:
# - p-values:
# - R-squared:

# Make a column `simple_preds` that hold the predictions from this model

# Plot these predicted values against the actual values

# Create a model that uses all variables that you believe to be related to `sl`

# Interpret the following output of your model
# - betas:
# - p-values:
# - R-squared:

# Make a column `model_preds` that hold the predictions from this model

# Plot these predicted values against the actual values

# Plot your residuals against salary (to see systematic error)

# What does this tell you about your predictions?