#
# day1_script.R
#
# Reed Sorensen
# July 2017
# 
# Overview
#   - Make sure everyone installed R and RStudio, and can run a line of code
#   - Introduce R with examples of analyses, documents and apps you can create
#   - How to run code in RStudio
#   - Types of R objects
#


#####
# GETTING STARTED
#
#   To open a script, go to File --> New File --> R Script
#   -- You can also save a script, and open it again later
#
#   To run a single line of code:
#   -- Put the cursor on the line you want to run, 
#      then press Control-Enter
#   -- Alternatively, put the cursor on the line you want to run,
#      and hit the "Run" button
#
#   To run section of code:
#   -- Highlight the entire section you want to run,
#      then press Control-Enter or click "Run" (same as before)
#

#####
# SCALARS
#   +, -, *, /
#   sqrt, ^

10 + 3      # addition
10 - 3      # subtraction
3 * 4       # multiplication
21 / 7      # division
sqrt(16)    # square root
4^2         # exponentiation (example is "4 squared")

#   -- Challenge: Use R to calculate these expressions
# 
#      2 + 2
2 + 2

#      450 divided by 19
450 / 19

#      The square root of 225
sqrt(225)

#      3 squared
3^2



#####
# VARIABLES and VECTORS
#   <-, str, c, class
#   length, sum, prod, mean

x <- 10        # make the variable 'x' equal to 10

str(x)         # check the structure of 'x' -- works with any R object

x2 <- c(1,4,6) # combine the numbers 1, 4 and 6 into a vector, 
               #   and put the result into 'x2'

class(x2)      # check the data type of 'x2'

length(x2)     # check how many elements 'x2' has

sum(x2)        # add together all of the elements of 'x2'
               # this is the same as 1 + 4 + 6

prod(x2)       # multiply all of the elements of 'x2'
               # this is the same as 1 * 4 * 6

#   -- Challenge:

#      1. create a vector with these numbers: 10, 20, 30, 40, 50, 139, 3, 92
x3 <- c(10, 20, 30, 40, 50, 139, 3, 92)

#      2. Use the functions length() and sum() to calculate the mean
sum(x3) / length(x3)

#      3. Use the mean() function to verify that you got the right answer
mean(x3)


