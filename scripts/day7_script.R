#
# day7_script.R
#
# Reed Sorensen
# July 2017
#
# 1. Introduction to regression
# 2. Visualizing data with graphics
# 3. Demonstrate reading files from other programs
# 4. Review of 'dplyr' commands for getting Table 1 of a scientific paper
# 


######
# INTRODUCTION TO REGRESSION 
#      including showing results with graphs
#
#   -- Examples of linear and logistic regression
#   -- Don't worry about the code for now, just interpretation

dat1 <- read.csv("http://www.math.uah.edu/stat/data/Galton.csv", as.is = TRUE)

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

library(dplyr)

#-- logistic regression
X <- 65

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
names(dat1)

#    2. Is each variable numeric, character, or another type? Use str()
str(dat1)

#    3. Use the summary() function to get 
#       summary statistics about the 'Height' variable
summary(dat1$Height)



#-- ONE CONTINUOUS VARIABLE: histogram
hist(dat1$Height)

# use additional arguments to customize your graph
hist(dat1$Height, breaks = 30, xlab = "Child's height", main = "")


# CHALLENGE:
# Use hist() to show the distribution of the 'Father' variable
# -- Change the x-axis label to be "Altura do pai"
# 

hist(dat1$Father, xlab = "Altura do pai")


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
# Use plot() to visualize the association 
#   between the height of fathers and mothers

plot(x = dat1$Father, y = dat1$Mother)


#-- ONE CATEGORICAL and ONE CONTINUOUS VARIABLE: barplot
#   e.g. show average height by age

dat2 <- dat1 %>%
  group_by(Gender) %>%
  summarize(avg_height = mean(Height))

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



