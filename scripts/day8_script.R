#
# day8_script.R
#
# Reed Sorensen
# July 2017
#
# Overview
#
# 1. Demonstrate reading files from other programs


#####
# DEMONSTRATE READING FILES FROM:
#   CSV, Stata, SPSS, SAS, Access, etc.
#   
#   'foreign' is the standard package
#   'haven' can read Stata 13 and .sas7bdat (SAS) files
#   'RODBC' can connect to databases, for example, Microsoft Access 
#   


# CHALLENGE
#
# 1. Go to Google and find the reference manual for the 'haven' package
#    What functions would you use to read these files into R?
#    
#    a. SPSS dataset
#    b. Stata dataset
#    c. SAS dataset
# 
# 2. Go to Google and find the reference manual for the 'foreign' package
#
#    a. How many file types we can into R with this package?
#    b. Do you have data on your computer in any of these formats?
#


library(foreign)
library(dplyr)


# CHALLENGE
# 1. After running 'library(foreign)' type this into the console...
#
#    foreign::
#
#   Then hit tab
#   You can look at all of the functions in the package
#
# 2. Do the same with the 'dplyr' package
#    'dplyr' can do a lot more!
#



#####
# REVIEW
# Use 'dplyr' functions to calculate results for Table 1 of a scientific paper
# Table 1 describes the characteristics of our sample
# 

dat1 <- read.csv("http://www.math.uah.edu/stat/data/Galton.csv", as.is = TRUE)

str(dat1)  # look at the structure of 'dat1'

# get the count and percent for categorical variables
dat_gender <- dat1 %>%
  group_by(Gender) %>%
  summarize(count = n()) %>%
  mutate(pct = count / sum(count) )

# get the mean and standard deviation for continuous variables
dat_continuous <- dat1 %>%
  summarize(
    child_mean = mean(Height),
    child_sd = sd(Height),
    father_mean = mean(Father),
    father_sd = sd(Father),
    mother_mean = mean(Mother),
    mother_sd = sd(Mother) )

# How to handle the 'Kids' variable (number of kids in the family)?
# Let's type it out together
#   1. Treat it as a categorical variable --> too many levels
#   2. Create a new variable that cuts 'Kids' into groups
#



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





