#
# day9_script.R
#
# Reed Sorensen
# July 2017
#
# Overview
# 1. Use the "gmodels" package to get counts and percentages
# 2. Creating categorical variables from continuous with cut()
# 3. Running logistic regression models
# 4. Interpreting logistic regression models
# 5. Showing predictions from regression models
# 


#####
# GETTING COUNTS AND PERCENTAGES WITH 'gmodels' PACKAGE


#-- install 'gmodels' with the following line of code:
# install.packages("gmodels")

#load 'gmodels' into the current session
library(gmodels)


# load the dataset about child heights 
dat1 <- read.csv("http://www.math.uah.edu/stat/data/Galton.csv", as.is = TRUE)

# get crosstable of the 'Gender' variable
CrossTable(dat1$Gender)

# Convert 'Height' into a categorical variable
dat1$Height_groups <- cut(dat1$Height, breaks = c(0,65,70,999), right = FALSE)

#-- this does the same thing
dat1 <- dat1 %>%
  mutate(Height_groups = cut(Height, breaks = c(0,65,70,999), right = FALSE))


# CHALLENGE
# 1. Use the cut() function to group 'Father' into categories of your choice
#
# 2. Use the CrossTable() function to get counts and percentages 
#    for your new variable
#
# 3. Use CrossTable() to get counts and percentages 
#    for 'Gender' and 'Height_groups' at the same time
#



# The Chi-square test asks whether categorical variables are correlated
# e.g. Does the distribution of height in this sample depend on gender?

chisq.test(dat1$Gender, dat1$Height_groups)

# Chi-square tells is WHETHER there is an associaion, but
#   not the direction or magnitude of the association
# --> For that we want regression
#
# Note that CrossTable gives us information about 
#   the "Chi-square contribution" of each cell




##### 
# REVIEW OF LOGISTIC REGRESSION

X <- 65

dat3 <- dat1 %>%
  mutate(height2 = ifelse(Height > X, 1, 0))

fit3 <- glm(height2 ~ Gender + Father, data = dat3, family = "binomial")

dat_predictions$pred2 <- predict(fit3, newdata = dat_predictions, type = "response")
# plot(
#   x = NULL, y = NULL, 
#   xlim = c(60, 75), ylim = c(0, 1),
#   xlab = "Father's height", ylab = "Probability",
#   main = paste0("Prob(child's height > ", X, " | father's height)")
# )
# grid()
# 
# with(subset(dat_predictions, Gender == "F"), lines(Father, pred2))
# with(subset(dat_predictions, Gender == "M"), lines(Father, pred2, lty = 2))
# legend("topleft", lty = c(2,1), legend = c("Males", "Females"), cex = 0.9)


#####
# RUNNING LOGISTIC REGRESSION MODELS
# How to interpret the coefficients??
#


dat3$Father_groups <- cut(dat3$Father, breaks = c(0,68,70,72,74,999), right = FALSE)


fit1 <- glm(height2 ~ Gender + Mother + Father_groups + Kids, 
  data = dat3, family = "binomial")
summary(fit1)


my_coefs <- coef(fit1)
my_confidence_intervals <- confint(fit1)


# Odds ratio:
# Adjusting for X and Y, the odds of having the outcome is 
# [odds ratio] times higher for a group with one unit higher [Z]. 
#
# X and Y are other covariates in the model
# Z is our predictor of interest
#

exp(my_coefs) 
exp(my_confidence_intervals)


#####
# CHALLENGE
# 1. Run a regression with 'Height' as the outcome and 
#    with Kids and Father_groups as the covariates
# 2. Get the odds ratio and confidence interval on the Kids coefficient
# 3. How do you interpret the odds ratio?



#####
# PREDICTIONS WITH REGRESSION
#

#-- linear regression
fit2 <- lm(Height ~ Gender + Father, data = dat1)
summary(fit2)


dat_predictions <- expand.grid(
  Gender = c("F", "M"),
  Father = c(60:75)
)
dat_predictions$pred <- predict(fit2, newdata = dat_predictions)


# CHALLENGE
#
# 1. Run a regression that predicts a child's height
#    based on the mother's height, and put the results in 'my_fit'
#    HINT: Use the lm() function
#
# 2. Create a data frame called 'my_dat' that contains the variable 'Father'
#    'Father' should have the values 60, 61, 62 ... 80    (60 through 80)
#    HINT: Use the data.frame() function
#
# 3. Using the predict() function, add a new variable called 'my_pred'
#    that contains predictions for each father's height 60, 61, etc.
# 


plot(
  x = NULL, y = NULL, 
  xlim = c(60, 75), ylim = c(55, 75),
  xlab = "Father's height", ylab = "Child's height",
  main = "Prediction of child's height, given father's height"
)

with(subset(dat_predictions, Gender == "F"), lines(Father, pred))
with(subset(dat_predictions, Gender == "M"), lines(Father, pred, lty = 2))

legend("topleft", lty = c(2,1), legend = c("Males", "Females"), cex = 0.9)


# CHALLENGE 
#   
# 1. Don't copy any of the code from above! 
#    Please type out your answers as practice
#
# 2. Make an empty plot that has
#    - an x-axis from 60 to 80
#    - a y-axis from 55 to 80
#    - Appropriate labels for the x and y axis 
#      (think about what your variables are)
#    - No main title
# 
# 3. With the predictions from 'my_pred' graph,
#    graph the predicted child's height for each father's height
#    NOTE: You won't need to subset your data like I did above. Why not?
#


