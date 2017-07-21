#
# day5_script.R
#
# Reed Sorensen
# July 2017
#
# Overview:
#   -- Learn these functions for working with data frames:
#
#      write.csv()      Save a data frame as a CSV file
#      read.csv()       Bring data from a CSV file into R
#
#      table()          Get counts of a variable
#      nrow()           Get the number of rows in the data frame
#      subset()         Select certain rows or columns from the data frame
#
#      DPLYR FUNCTIONS:
#
#      mutate()         Create or change a variable
#      select()         Choose which columns to keep
#      filter()         Choose which rows to keep
#      arrange()        Put the rows of the data frame in order
# 
#      group_by()       Split the data frame into groups
#      summarize()      Get information about each group
#

# If you haven't done it yet, please install with 'dplyr' package with:
# install.packages("dplyr")

library(dplyr)

#####
# Make a data frame with data like the TM/PS study
num_rows <- 500
respostas <- c("NENHUMA", "PEQUENA", "ALGUMA", "MUITA")
set.seed(1)

dat1 <- data.frame(
  id = 1:num_rows,
  sexo = sample(c("MASCULINO", "FEMININO"), size = num_rows, replace = TRUE),
  anos = as.integer(rgamma(n = num_rows, shape = 25)),
  provincia = sample(c("MANICA", "SOFALA"), size = num_rows, replace = TRUE),
  dif_vestir = sample(respostas, size = num_rows, prob = c(0.4, 0.3, 0.2, 0.1), replace = TRUE ),
  dif_andar = sample(respostas, size = num_rows, prob = c(0.4, 0.3, 0.2, 0.1), replace = TRUE )
)
    
#####
# Foreshadowing... get counts and percentages with dplyr
dat7 <- dat1 %>%
  group_by(provincia, dif_vestir) %>%
  summarize(count = n()) %>%
  mutate(pct = round(count / sum(count), digits = 3) )


#####
# Reading and writing files

# Save data frame as CSV
write.csv(dat1, "tmps_example_data.csv")

# Use data from CSV on your computer
# -- R can read file types from Stata, SAS, Excel and many others
dat2 <- read.csv("tmps_example_data.csv")
  

#####
# SUMMARY STATISTICS

# Get counts and percentages from categorical variable
table(dat2$dif_vestir)               # counts
table(dat2$dif_vestir) / nrow(dat2)  # percentages

# Challenge
# 1. Get counts and percentages for the "dif_andar" variable
# 2. Count how many people are in each province


# Graph the distribution of the "anos" variable
hist(dat2$anos)
hist(dat2$anos, breaks = 30, main = "Distribution of age", xlab = "Age")

# Get summary statistics about "anos"
summary(dat2$anos)  # several statistics
mean(dat2$anos)     # mean (average)
sd(dat2$anos)       # standard deviation


#####
# CHANGING THE DATA FRAME

#-- create new variable, or change existing variable
dat2$meses <- dat2$anos / 12
dat2$sexo2 <- ifelse(dat2$sexo == "MASCULINO", 1, 0)

# Challenge
# -- Check how the 'sexo2' is different than 'sexo'

# Keep only rows of people with age less than 20
dat3 <- subset(dat2, anos < 20)

# Keep only the columns 'provincia', 'dif_vestir', 'dif_andar'
dat4 <- subset(dat2, select = c("provincia", "dif_vestir", "dif_andar"))


#####
# dplyr package
# mutate(), filter(), select() and arrange()
# 
library(dplyr)

# New function: %>%     the "pipe" operator, 
#                       passes the data frame to the next function

# this code does the same as above, but is more clear
dat5 <- dat2 %>%
  mutate(meses = anos / 12) %>%
  mutate(sexo2 = ifelse(sexo == "MASCULINO", 1, 0)) %>%
  filter(anos < 20) %>%
  select(provincia, dif_vestir, dif_andar)

# Challenge
# -- Create a new data frame called 'my_dat' that takes 'dat5' and keeps
#    only the rows where the 'provincia' variable is "MANICA"
#    HINT: Your answer should use the filter() function and == symbol

# arrange rows so 'anos' is increasing
dat6 <- arrange(dat2, anos)


# get counts and percentages for each province using dplyr
# group_by() and summarize()

dat7 <- dat1 %>%
  group_by(provincia, dif_vestir) %>%
  summarize(count = n()) %>%
  mutate(pct = round(count / sum(count), digits = 3) )
  
View(dat7)


# Next week we will talk about specific analyses and visualizing data



