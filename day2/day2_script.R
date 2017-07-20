#
# day2_script.R
#
# Reed Sorensen
# July 2017
# 
# Overview
#   - Review concepts from day 1
#   - Demonstration of how to sign up for a Coursera course
#   - Thinking of R objects as tabs in an Excel file
#   - Continue learning about types of R objects
# 
#   - HOMEWORK FOR TOMORROW:
#        Install the dplyr package
#        Run this command: install.packages("dplyr")
#


#####
# VARIABLES and VECTORS (continued from day 1)...
#   generating numbers with seq, rep, :, sample, rnorm
#   hist -- more about visualizing data later

seq(from = 1, to = 5) # get a sequence of numbers from 1 to 5
1:5                   # same result

seq(from = 2, to = 10, by = 2) # get a sequence of numbers that
                               # starts at 2, ends at 10, and increases by 2

rep(x = 5, times = 10) # take the number 5, and repeated it 10 times
rep(x = 1:5, each = 2) # take the numbers 1, 2, 3, 4 and 5, 
                       #   and repeat each number 2 times

# generate a vector of numbers by randomly sampling from 1, 2, 3, 4 and 5
#   in which a number is "replaced" after it is chosen
sample(1:5, size = 20, replace = TRUE)

# generate random numbers that follow a Normal distribution,
#   and put them into the object 'x4'
x4 <- rnorm(n = 5000, mean = 10, sd = 2)
hist(x4)       # view a histogram of the random numbers
dev.off()      # stop displaying the graph


# LOGICAL OPERATORS
#   >, <, <=, >=
#   ==, !=, |, &
#   all, any
#   table

3 < 4        # is 3 less than 4?
3 > 4        # is 3 greater than 4?
3 <= 4       # is 3 less than or equal to 4?
4 >= 4       # is 4 greater than or equal to 4?

3 == 4       # is 3 equal to 4?
3 != 3       # is 3 NOT equal to 4?
3 > 4 | 4 == 4 # is it true that 3 > 4 OR 4 is equal to 4?

# combine logical operators into a vector
x5 <- c(TRUE, 4 < 3, 10 == 10) # same as writing: x5 <- c(TRUE, FALSE, TRUE)

any(x5)       # are any elements in 'x5' TRUE?
all(x5)       # are all elements in 'x5' TRUE?


# check whether an expression is true for each element in a vector
x6 <- 1:6    # create a vector of the numbers 1, 2, 3, 4, 5 and 6
             #   and put the result into 'x6'

x6 >= 5      # return a vector of whether each element of 'x6' is 
             #   greater than or equal to 5

table(x6 >= 5)  # count how many elements of 'x6' are greater than 
                #   or equal to 5, and how many are not


#   -- Challenge: 
#      1. Get R to tell you if it is true that 2 + 2 = 4
2 + 2 == 4   # note the two equals signs, ==

#      2. Write an expression that returns FALSE
10 < 5

#      3. Using the table() function, count how many elements of 'x6'
#           are less than or equal to 2
table(x6 <= 2)


  
#####
# INDEXING with []

x7 <- c("a", "b", "c", "d", "e")


# -- indexing by position
x7[2]         # get the value of the element in second position
x7[2:4]       # get the value of the elements in positions 2, 3 and 4
x7[c(2,3,4)]  # this is the same thing as x7[2:4] 


# -- indexing by vector of TRUE/FALSE
x7[c(FALSE, TRUE, FALSE, TRUE, FALSE)]



