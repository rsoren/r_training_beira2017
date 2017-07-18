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
x4 <- rnorm(n = 50, mean = 10, sd = 2)
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
#      2. Write an expression that returns FALSE
#      3. Using the table() function, count how many elements of 'x6'
#           are less than or equal to 2
#

  
#####
# INDEXING with []
# new function: %in% 

x7 <- c("a", "b", "c", "d", "e")

# -- indexing by position
x7[2]         # get the value of the element in second position
x7[2:4]       # get the value of the elements in positions 2, 3 and 4
x7[c(2,3,4)]  # this is the same thing as x7[2:4] 

# -- indexing by vector of TRUE/FALSE
x7[c(FALSE, TRUE, FALSE, TRUE, FALSE)]

# check whether an element is in a vector with the %in% function
3 %in% 1:8    # is 3 in the vector c(1,2,3,4,5,6,7,8) ?

"b" %in% c("d", "e", "f")   # is "b" in the vector c("d", "e", f") ?


x7 %in% c("d", "e")    # for each element of 'x7', 
                       #   check whether it is "d" or "e"

x7[x7 %in% c("d", "e")]  # display elements of x7 that are "d" or "e"


# CHARACTER STRINGS
#   print, paste, paste0, substr
#   'stringr' package: https://journal.r-project.org/archive/2010-2/RJournal_2010-2_Wickham.pdf
#   str_c, str_sub, str_split_fixed
#   is.character, as.character, is.numeric, as.numeric

x9 <- "Bom dia!"     # create a character object that contains "Bom dia!"

print(x9)    # display the word "Bom dia!"
x9

paste("Hello", "everybody!")  # combine the strings 
paste0("Hello", "everybody!") # the paste0() function does not
                              # automatically include a space

substr(x9, start = 1, stop = 3) # extract the letters in positions 1 to 3

is.character(x9)   # check whether 'x9' is a character vector
is.numeric(x9)     # check whether 'x9' is a numeric vector


#   -- Challenge:
#      1. Get R to display the word "Hello"
#      2. Put the character string "Hello" into a object called 'txt'
#      3. Use 'txt' and the paste0() function to display the phrase "Hello, world!"
#      4. Check whether 'txt' is a numeric variable
#      5. Check whether 'txt' is a character variable
#      6. Use the substr() function to extract the letters "He" from 'txt'


# GETTING HELP
#   help, help.search, ?, ??, example, 
#   Google.com, rseek.org, StackOverflow
#   Website for searching for a package: https://www.r-pkg.org/
#   
#   -- Challenge:
#      1. Use Google to find an R function that splits 1 string into multiple strings
#      2. Use the help() function to figure out how to use this function
#      3. Use Google to find an R package that can read Stata 13 datasets into R
# 
# 

