#
# day6_script.R
#
# Reed Sorensen
# July 2017
#
# Overview:
#
#   1. Review 'dplyr' functions from day 5
#
#      mutate()         Create or change a variable
#      select()         Choose which columns to keep
#      filter()         Choose which rows to keep
#      arrange()        Put the rows of the data frame in order
#      %>%              "pipe" operator
# 
#   2. Use new 'dplyr' functions to get counts and percentages
#      group_by()       Split the data frame into groups
#      summarize()      Get information about each group
#
#   3. Briefly demonstrate reading in files from other programs
#      Using the 'haven' and 'foreign' packages
#
#   4. Visualizing data with graphics
#
#   5. Looking ahead: linear regression
# 



#####
# REVIEW 'dplyr' FUNCTIONS FROM DAY 5

# Read CSV data from the course website
# -- Yes, you can do this in R! 
df1 <- read.csv("https://raw.githubusercontent.com/rsoren/r_training_beira2017/master/tmps_example_data.csv")


# First, load the dplyr package so we can use its functions
#    If you haven't done it yet, please install with 'dplyr' package with:
#    install.packages("dplyr")
library(dplyr)


# Create a new variable with 'mutate()'
# The %>% pipe operator passes df1 to the mutate() function
df2 <- df1 %>%
  mutate(meses = anos * 12)


# Recode a variable with the 'ifelse()' function
df3 <- df1 %>%
  mutate(sexo2 = ifelse(sexo == "MASCULINO", 1, 0))


# Choose rows with 'filter()' and columns with 'select()'
# Note how you can use the pipe operator several times in sequence
df4 <- df1 %>%
  filter(anos < 20) %>%
  select(provincia, dif_vestir, dif_andar)


# Change the order of rows with 'arrange()'
# -- In this example, first order by province (alphabetical order), 
#    then by DESCENDING age, using the 'desc()' function
df5 <- df1 %>%
  arrange(provincia, desc(anos))


# CHALLENGE
# 
# 1. Create a new data frame called 'my_dat' that takes 'df1'    %>%
#    - Make a new variable calles 'meses' that is 12 times 'anos' (multiplication)  %>%
#    - Only include rows where people are fewer than 400 months old (meses < 400)   %>%
#    - Arrange the rows by ascending age
#    
# 2. Check how many rows 'my_dat' (your new data frame) has using the 'nrow()' function
#
# 3. Also check how many rows 'df1' has. Why is this different than 'my_dat' ?
#
# 4. Use the table() function to find out how many 
#    males and females there are in 'df1'
#    HINT: remember to use the dollar symbol $ when you
#          want a variable, for example: df$variable_name
#


#####
# GET COUNT AND PERCENT USING 'dplyr' FUNCTIONS
# -- Commonly needed for Table 1 of scientific papers
# -- New functions: group_by(), summarize(), n()

# Frequencies by sex
result1 <- df1 %>%
  group_by(sexo) %>%
  summarize(count = n()) %>%
  mutate(percent = count / sum(count) )


# Frequencies by age
# Split age into 10-year age categories
result2 <- df1 %>%
  mutate(agecat = cut(anos, breaks = seq(0,100,10), right = FALSE)) %>%
  group_by(agecat) %>%
  summarize(count = n()) %>%
  mutate(percent = count / sum(count)) 


# CHALLENGE
# -- Get counts and percentages for each province using 'dplyr' functions
#    group_by(), summarize() and mutate()



#####
# DEMONSTRATE READING FILES FROM:
#   CSV, Stata, SPSS, SAS, Access, etc.
#   Using the packages 'haven' (several file types) and 'RODBC' (Access)
#   Look online for documentation on 'haven' and 'foreign' packages


#####
# VISUALIZING DATA WITH GRAPHICS

dat1 <- read.csv("http://www.math.uah.edu/stat/data/Galton.csv", as.is = TRUE)


# CHALLENGE
# -- Explore this new data set:
#    1. What are the variables names
#    2. Is each variable numeric, character, or another type?
#    3. Use the summary() function to get 
#       summary statistics about the 'Height' variable



#-- ONE CONTINUOUS VARIABLE: histogram
hist(dat1$Height)

# use additional arguments to customize your graph
hist(dat1$Height, breaks = 30, xlab = "Child's height", main = "")


# CHALLENGE:
# Use hist() to show the distribution of the 'Father' variable


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
  summarize(avg_height = mean(Height))

barplot(
  height = dat2$avg_height, 
  names.arg = c("Females", "Males"), 
  main = "Average height by gender"
)



######
# LOOKING AHEAD: LINEAR REGRESSION

fit2 <- lm(Height ~ Gender + Father + Mother, data = dat1)
summary(fit2)

# intracluster correlation
# -- how similar are units within the same group?
#    e.g. how similar are the heights of children in the same family?

library(Hmisc)
deff(dat1$Height, dat1$Family)




















