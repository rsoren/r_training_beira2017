#
# day8_script.R
#
# Reed Sorensen
# July 2017
#
# Overview
#
# 1. Demonstrate reading files from other programs
# 2. Using 'dplyr' to get results for Table 1 of a scientific paper
#
#
# Brainstorming future topics:
#
# Hypothesis testing
# How to get p-values for your analysis
# How to get confidence intervals
# 
# Chi square test
# t-test
# Interpreting regression coefficients
#



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

my_new_data <- read.xlsx("C:/Users/rsoren/path/to/file.xlsx", 
  sheet = "sheet1")


install.packages("foreign")
library(foreign)

dat1 <- read.epiinfo("C:/Users/rsoren/file123.epiinfo")

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
  summarize(count = n() ) %>%
  mutate(pct = count / sum(count) )


# get the mean and standard deviation for continuous variables
dat_continuous <- dat1 %>%
  group_by(Gender) %>%
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



