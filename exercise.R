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
summary(salary_data$sx)

# Draw a violin plot showing the distribution of salaries for males and females
ggplot(salary_data) +
  geom_violin(mapping = aes(x = sx, y = sl), alpha = .8, draw_quantiles = .5) 

# Create this same plot, but *faceted* by rank
ggplot(salary_data) +
  geom_violin(mapping = aes(x = sx, y = sl), alpha = .8, draw_quantiles = .5) +
  facet_wrap(~rk)

# Use a t-test to assess a difference in means between gender
females <- salary_data %>% filter(sx == "female")
males <- salary_data %>% filter(sx == "male")
t.test(females$sl, males$sl)

# What is the number of professors at each rank (by gender)?
# (hint: use the `table()` function)
table(salary_data$sx, salary_data$rk)

# What does this tell you about the department...?

# Simple linear regression: what is the salary increase associated with 
# each additional year in your current position (`yr`)?
simple_model <- lm(sl ~ yr, data = salary_data)
summary(simple_model)

# Interpret the following output of your model
# - betas:
# - p-values:
# - R-squared:

# Make a column `simple_preds` that hold the predictions from this model
salary_data$simple_preds <- simple_model$fitted.values

# Plot these predicted values against the actual values
ggplot(data = salary_data) +
  geom_point(mapping = aes(x = sl, y = simple_preds))

# Create a model that uses all variables that you believe to be related to `sl`
model <- lm(sl ~ yr + sx + rk + dg, data = salary_data)
summary(model)

# Interpret the following output of your model
# - betas:
# - p-values:
# - R-squared:

# Make a column `model_preds` that hold the predictions from this model
salary_data$model_preds <- model$fitted.values

# Plot these predicted values against the actual values
ggplot(data = salary_data) +
  geom_point(mapping = aes(x = sl, y = model_preds))

# Plot your residuals against salary (to see systematic error)
salary_data$error <- salary_data$model_preds - salary_data$sl

ggplot(data = salary_data) +
  geom_point(mapping = aes(x = sl, y = error)) +
  geom_hline(yintercept = 0)

# What does this tell you about your predictions?