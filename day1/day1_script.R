#
# day1_script.R
#
# Reed Sorensen
# July 2017
# 
# Overview
#   - Make sure everyone installed R and RStudio, and can run a line of code
#   - Introduce R with examples
#   - Make list of topics we want to cover in the course
#   - Types of data structures
#   - Getting data into R and saving data on your computer
#   - Operations on data frames (create/change variables, subset)
#       with base R and dplyr



# GETTING STARTED
#   install.packages, library
# 


# SCALARS
#   +, -, *, /
#   sqrt, ^, log, exp

#   -- Challenge: Use R to calculate these expressions
# 
#      2 + 2
#      450 divided by 19
#      The square root of 225
#      3 squared
#      What is the log of exp(3)?
#      


# VARIABLES and VECTORS
#   <-, str, c, class
#   length, sum, prod
#   generating numbers with  seq, rep, :, rnorm, 
#   rnorm, hist -- more about visualizing data later
#     assign hist() output as object, and see what's inside
#   indexing with [], by position, name or TRUE/FALSE

#   -- Challenge:
#      1. create a vector with these numbers: 10, 20, 30, 40, 50, 139, 3, 92
#      2. Use the functions length() and sum() to calculate the mean
#      3. Use the mean() function to verify that you got the right answer


# LOGICAL OPERATORS
#   >, <, <=, >=
#   ==, !=, |
#   all, any

#   -- Challenge: 
#      1. Get R to tell you if it is true that 2 + 2 = 4
#      2. Write another expression that returns TRUE
#      3. Write an expression that returns FALSE
#      4. Using the vector you created in the last challenge (10, 20, 30, etc.)
#           write an expression that returns some TRUE and some FALSE




# CHARACTER STRINGS
#   print, paste, paste0, substr
#   'stringr' package: https://journal.r-project.org/archive/2010-2/RJournal_2010-2_Wickham.pdf
#   str_c, str_sub, str_split_fixed
#   is.character, as.character, is.numeric, as.numeric
#   factor -- more on this later

#   -- Challenge:
#      1. Get R to display the word "Hello"
#      2. Put the character string "Hello" into a object called 'txt'
#      3. Use 'txt' and the paste0() function to display the phrase "Hello, world!"
#      4. Check whether 'txt' is a numeric variable
#      5. Check whether 'txt' is a character variable
#      6. Use the substr() function to extract the letters "He" from 'txt'


# GETTING HELP
#   help, help.search, ?, ??, example, 
#   Google.com, StackOverflow, r-project.org
#   Website for searching for a package: https://www.r-pkg.org/
#   
#   -- Challenge:
#      1. Use Google to find an R function that splits 1 string into multiple strings
#      2. Use the help() function to figure out how to use this function
#      3. Use Google to find an R package that can read Stata 13 datasets into R
# 
# 



# MATRICES
# matrix, rbind, cbind, as.matrix
# str
# dim, ncol, nrow
# indexing by position and name

#   -- Challenge:
#      1. Create a 3-by-4 matrix that only contains the number 5 (repeated 12 times)
#      2. Create two vectors
#           'tmp1' contains the letters "a", "b" and "c"
#           'tmp2' contains the letters "d", "e" and "f"
#      3. Use the rbind() function to combine tmp1 and tmp2
#           to display a matrix that looks like this:
#                                            "a"  "b"  "c"
#                                            "d"  "e"  "f"
#      4. Create an object called 'mat' that contains the matrix from #3
#      5. Use cbind() to add another column to 'mat', with the letters "y" and "z"
#         Your result should look like this:
#                                            "a"  "b"  "c"  "y"
#                                            "d"  "e"  "f"  "z"
#




# LISTS
# list, as.list
# str
# index by [], [[]] and $

#   -- Challenge: 
#      1. Create a list called 'my_list' that contains 
#           an element with 1, 2, 3 and another element with "a", "b", "c"
#      2. Have R give you the contents of the second element
#         The output should look like: "a" "b" "C"
#           




# DATA FRAMES
#   data.frame, head, tail
#   index data frames with $ (like a list) and [] (like a matrix)
#   -- for creating new variables
#   subset rows and columns with the subset() function
#   'dplyr' package -- more on this later





# SUMMARIZING DATA
#   str, class
#   table, summary, mean, sd



# READING, WRITING, and CHANGING FILES
#   write.csv, read.csv
#   saveRDS, readRDS
#   'foreign' package for other file types
#   -- example with Access database
#   help(files)


# OTHERS
# lm, plot, abline, 

# INSPECTING THE OBJECTS and the ENVIRONMENT
# ls, getwd, setwd, list.files


#####
# CHALLENGES

#-- Insert the number 168 between 12 and 13
#   using ONLY operations on 'x' (don't just rewrite the whole vector)
x <- c(88, 5, 12, 13)


















