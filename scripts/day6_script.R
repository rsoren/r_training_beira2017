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
#   3. Looking ahead: linear regression
# 



#####
# REVIEW 'dplyr' FUNCTIONS FROM DAY 5

# Read CSV data from the course website
# -- Yes, you can do this in R! 
# -- It's the same function you use to read a CSV file from your computer
df1 <- read.csv("https://raw.githubusercontent.com/rsoren/r_training_beira2017/master/tmps_example_data.csv")


# First, load the dplyr package so we can use its functions
#    If you haven't done it yet, please install with 'dplyr' package with:
#    install.packages("dplyr")
library(dplyr)


# Create a new variable with 'mutate()'
# The pipe operator %>% passes df1 to the mutate() function
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

my_dat <- df1 %>%
  mutate(meses = 12 * anos) %>%
  filter(meses < 400) %>%
  arrange(meses)  # Note that "ascending" age is the default, so don't need desc()


#    
# 2. Check how many rows 'my_dat' (your new data frame) has using the 'nrow()' function
nrow(my_dat)

#
# 3. Also check how many rows 'df1' has. Why is this different than 'my_dat' ?
nrow(df1)
# Answer: We filtered out people with age less than 400 months, so we have fewer rows

#
# 4. Use the table() function to find out how many 
#    males and females there are in 'df1'
#    HINT: remember to use the dollar symbol $ when you
#          want a variable, for example: df$variable_name
#
table(df1$sexo)


#####
# GET COUNT AND PERCENT USING 'dplyr' FUNCTIONS
# -- Commonly needed for Table 1 of scientific papers
# -- New functions: group_by(), summarize(), n()

# Frequencies by sex
result1 <- df1 %>%
  group_by(sexo) %>%
  summarize(count = n() ) %>%
  mutate(percent = count / sum(count) )

# n()    number of observations in each group
  
  
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
result3 <- df1 %>%
  group_by(provincia) %>%
  summarize(count = n() ) %>%
  mutate(percent = count / sum(count) )


#####
# LOOKING AHEAD: VISUALIZING DATA WITH GRAPHICS

dat1 <- read.csv("http://www.math.uah.edu/stat/data/Galton.csv", as.is = TRUE)


#-- ONE CONTINUOUS VARIABLE: histogram
hist(dat1$Height)

#-- TWO CONTINUOUS VARIABLES: scatterplot
plot(x = dat1$Father, y = dat1$Height)

dat2 <- dat1 %>%
  group_by(Gender) %>%
  dplyr::summarize(avg_height = mean(Height))

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




