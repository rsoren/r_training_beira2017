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


# VARIABLES and VECTORS
#   <-, str, c, class
#   length, sum, prod
#   generating numbers with  seq, rep, :, rnorm, 
#   rnorm, hist -- more about visualizing data later
#     assign hist() output as object, and see what's inside
#   indexing with [], by position, name or TRUE/FALSE

#   -- Challenge:
#     1. create a vector with these numbers: 10, 20, 30, 40, 50, 139, 3, 92
#     2. Use the functions length() and sum() to calculate the mean


# LOGICAL OPERATORS
#   >, <, <=, >=
#   ==, !=, |
#   all, any



# CHARACTER STRINGS
#   paste, paste0, substr, str_split
#   'stringr' package: https://journal.r-project.org/archive/2010-2/RJournal_2010-2_Wickham.pdf
#   str_c, str_sub, str_split_fixed
#   is.character, as.character, is.numeric, as.numeric
#   factor -- more on this later


# GETTING HELP
#   help, help.search, ?, ??, example, 
#   getting help for general topics, e.g. ?files
#   -- others general topics include: Arithmetic Comparison Control Dates 
#                                     Extract Math Memory NA NULL 
#                                     NumericaConstants Paren Quotes Startup Syntax
#   use quotes for special characters, for example ?"<"
#   Google.com, StackOverflow, r-project.org
#   CRAN, https://www.r-pkg.org/
#   




# MATRICES
# matrix, rbind, cbind, as.matrix
# str
# dim, ncol, nrow
# indexing by position and name



# LISTS
# list, as.list
# str
# index by [], [[]] and $



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


















