#
# day4_script.R
#
# Reed Sorensen
# July 2017
#
# Overview:
#   - Review R concepts from days 1 through 3
#   - Where to get help online and using the R documentation
#   - Writing your own function
#   - Working with data frames
#   - Saving and loading CSV files
# 
# If you haven't installed the dplyr package, please run this line of code:
# install.packages("dplyr")


#####
# Review of concepts from days 1 through 3

#-- Assign a value to an object with the arrow <- symbol
x1 <- "This is a character string."
is.character(x1)

#-- Create a vector of values with c() or other functions
x2 <- c("This", "is", "a", "character", "vector")
print(x2)

x3 <- 3:6    # a numeric vector, same as c(3,4,5,6)
print(x3)


sample(x = x3, size = 20, replace = TRUE) # random sample of 20 numbers from x3
# How did we know to use the parameters "x", "size" and "replace"?
#   Use help("sample") or str(sample)

# -- Challenge:
#    1. Using the sample() function,
#       get 150 random numbers that are greater than 10 and lower than 17

#-- Join character strings together with the paste() function
paste("Here", "are", "some", "words")
paste0("Here", "are", "some", "words") # useful for writing file paths (more later)


# when you give paste() a vector, it operates on each element separately
x2                 # x2 is a character vector we created earlier
paste0(x2, "xyz")  # adds "xyz" to each element of the vector

x3 + 10    # when we do math with vectors, the calculation happens for each element


# we use square brackets [] to ask for specific elements of a vector
x3[3]        # returns the third element of x3
x3[x3 >= 4]  # returns elements of x3 that are greater than or equal to 4

# -- Challenge:
#    Using indexing, get the elements of x3 that are less than 2


# we also use brackets [] to ask for elements of a matrix
# -- BEFORE the comma refers to ROWS
# -- AFTER the comma refers to COLUMNS

my_matrix <- matrix(1:20, nrow = 4, ncol = 5)
print(my_matrix)
my_matrix[c(2,3), 1:3]  # returns rows 2 and 3, and columns 1 through 3

# -- Challenge
#    1. Use indexing with [] to get the part of "my_matrix" 
#       that looks like this:
#                       6   10   14
#                       7   11   15


#####
# GETTING HELP
#   help, help.search, ?, ??, example, 
#   Google.com, rseek.org, StackOverflow
#   Website for searching for a package: https://www.r-pkg.org/
#   
#   -- Challenge:
#      1. Use Google to find an R function that splits 1 string into multiple strings
#      2. Use the help() function to figure out how to use this function
#      3. Create an object called my_string that contains "Here is some text"
#      4. Use the function from #1 and #2 to split my_string into 4 words



#####
# WRITING YOUR OWN FUNCTION

sum(2, 3)  # there is already a function for adding two numbers

# Make a function that adds two numbers together
add_two_numbers <- function(x1, x2) {
  result <- x1 + x2
  return(result)
}

add_two_numbers(x1 = 4, x2 = 5)
add_two_numbers(10, 1)  # if we know the order, we can just give the input values
str(add_two_numbers)    # to find out what parameters it expects, we use str()

# We can set a default value for a parameter
# make a funtion that adds three numbers together, where
#   the third number is 20 by default (but can be changed optionally)
add_three_numbers <- function(x1, x2, x3 = 20) {
  result <- x1 + x2 + x3
  return(result)
}

add_three_numbers(4, 5)
add_three_numbers(x1 = 4, x2 = 5, x3 = 10)
add_three_numbers(4, 5, 10)   # same thing, as long as we know the order


# -- Challenge:
#
#    1. Make a function that multiplies a number by 2
#       HINT: We use the * symbol for multiplication
# 
#    2. Make a function that always says, "Voce escreveu: ",
#       followed by a character string that the user chooses
#
#       HINT: Use the paste() function inside your function, for example: 
#             paste("Pasting", "combines words")
#


#####
# DATA FRAMES (using base R functions)
#
# A type of R object for data organized like a spreadsheet
#   - Rows and columns
#   - Each row is a unique unit (person, facility, etc.)
#   - Columns are variables with names, describing the unit
#   - Each column has only 1 data type (numeric, character, logical, factor, etc.)
#
# dplyr is a package designed for handling data frames

library(dplyr)

df <- data.frame(
  stringsAsFactors = FALSE, # so character strings don't become 'factor' variables
  group = sample(c("a", "b", "c"), size = 50, replace = TRUE),
  var1 = 1:50,
  var2 = 1:50 + rnorm(n = 50, mean = 0, sd = 15)
)

# View(df)       # look at the data
                 # note the capital V (V maiusculo)
                 # The R language distinguishes between X and x
           

#-- indexing a data frame

df[1:10, ]    # get the first 10 rows (same as matrix)
df[1:10, c(2,3)]  # get the second and third columns

# we can also use the variable names!
names(df)
df[1:20, c("var1", "var2")]  # get the variables named "var1" and "var2"

mean(df$var2)    # IMPORTANT! Use the dollar sign $ to refer to a variable

# Create a new variable, add 100 to the variable 'var2' within data frame 'df'
df$var3 <- df$var2 + 100

# Create a new variable given a certain condition
#   If the group is "c", change it to "d", otherwise let it remain the same
df$group2 <- ifelse(df$group == "c", "d", df$group)

# Change an existing variable; change all values of 'var3' to 1
df$var3 <- 1

# -- Challenge
#    1. Create a new variable 'var4' that is equal to 'var2'
#    2. Look at the help documentation for "ifelse". What are the names of the 
#       three parameters we need to give the ifelse() function?
#    3. Create a new variable 'var5' that has the values:
#         1 when var1 is less than 70, and
#         0 when var1 is greater than or equal to 70
#       HINT: Use the ifelse() function


write.csv(df, "example_data.csv")
# Where exactly did it save this file? It saved to your working directory
getwd()   # Check what your working directory is
          # When using an R project, the working directory is the project location



# -- Challenge
#    1. Use Excel to open the file you just created
#    2. Within Excel, create a new variable called "newvar" and give it some data
#    3. Exit Excel, and save your changes
#    4. Read the file into R using this command, then type: View(df2)

df2 <- read.csv("example_data.csv", as.is = FALSE)


#-- dplyr functions for handling data
# select()    keep certain columns
# filter()    keep certain rows
# mutate()    create or change variables
# arrange()   sort the entire data frame according to the order of variable(s)
# group_by()  define groups, so we can apply a function within each group
# summarize() get information about each group




