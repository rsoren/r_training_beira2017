#
# day7_script.R
#
# Reed Sorensen
# July 2017
#
# 1. Brief introduction to regression
# 2. Visualizing data with graphics
# 3. Demonstrate reading files from other programs
# 4. Review of 'dplyr' commands for getting Table 1 of a scientific paper
# 


######
# BRIEF INTRODUCTION TO REGRESSION 
#      including showing results with graphs
#
#   -- Examples of linear and logistic regression
#   -- Don't worry about the code for now, just interpretation


#-- linear regression
fit2 <- lm(Height ~ Gender + Father, data = dat1)
summary(fit2)

dat_predictions <- expand.grid(
  Gender = c("F", "M"),
  Father = c(60:75)
)
dat_predictions$pred <- predict(fit2, newdata = dat_predictions)

plot(
  x = NULL, y = NULL, 
  xlim = c(60, 75), ylim = c(55, 75),
  xlab = "Father's height", ylab = "Child's height",
  main = "Prediction of child's height, given father's height"
)
grid()

with(subset(dat_predictions, Gender == "F"), lines(Father, pred))
with(subset(dat_predictions, Gender == "M"), lines(Father, pred, lty = 2))
legend("topleft", lty = c(2,1), legend = c("Males", "Females"), cex = 0.9)


#-- logistic regression
X <- 67

dat3 <- dat1 %>%
  mutate(height2 = ifelse(Height > X, 1, 0))

fit3 <- glm(height2 ~ Gender + Father, data = dat3, family = "binomial")

dat_predictions$pred2 <- predict(fit3, newdata = dat_predictions, type = "response")
plot(
  x = NULL, y = NULL, 
  xlim = c(60, 75), ylim = c(0, 1),
  xlab = "Father's height", ylab = "Probability",
  main = paste0("Prob(child's height > ", X, " | father's height)")
)
grid()

with(subset(dat_predictions, Gender == "F"), lines(Father, pred2))
with(subset(dat_predictions, Gender == "M"), lines(Father, pred2, lty = 2))
legend("topleft", lty = c(2,1), legend = c("Males", "Females"), cex = 0.9)



#####
# VISUALIZING DATA WITH GRAPHICS

library(dplyr)

dat1 <- read.csv("http://www.math.uah.edu/stat/data/Galton.csv", as.is = TRUE)


# CHALLENGE
# -- Explore this new data set:
#    1. What are the variables names? Use names()
#    2. Is each variable numeric, character, or another type? Use str()
#    3. Use the summary() function to get 
#       summary statistics about the 'Height' variable



#-- ONE CONTINUOUS VARIABLE: histogram
hist(dat1$Height)

# use additional arguments to customize your graph
hist(dat1$Height, breaks = 30, xlab = "Child's height", main = "")


# CHALLENGE:
# Use hist() to show the distribution of the 'Father' variable
# -- Change the x-axis label to be "Altura do pai"
# 


#-- TWO CONTINUOUS VARIABLES: scatterplot
plot(x = dat1$Father, y = dat1$Height)

# additional arguments
plot(
  x = dat1$Father, 
  y = dat1$Height, 
  xlab = "Father's height",
  ylab = "Child's height"
)

# add a regression line (more on this later)
fit1 <- lm(Height ~ Father, data = dat1)
abline(fit1)


# CHALLENGE:
# Use plot() to visualize at the association 
#   between the height of fathers and mothers



#-- ONE CATEGORICAL and ONE CONTINUOUS VARIABLE: barplot
#   e.g. show average height by age

dat2 <- dat1 %>%
  group_by(Gender) %>%
  dplyr::summarize(avg_height = mean(Height))

barplot(
  height = dat2$avg_height, 
  names.arg = c("Females", "Males"), 
  main = "Average height by gender"
)

pie(
  x = dat2$avg_height, 
  labels = c("Females", "Males"),
  col = c("cornflowerblue", "red"),
  main = "Average height by gender"
)



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



