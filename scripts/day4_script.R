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
#       get 150 random numbers that are higher than 10 and lower than 17

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
# BEFORE the comma refers to ROWS
# AFTER the comma refers to COLUMNS

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
# Writing your own function

sum(2, 3)  # there is already a function for adding two numbers

# let's make our own function that does the same thing

add_two_numbers <- function(x1, x2) {
  x1 + x2
}

add_two_numbers(x1 = 4, x2 = 5)
add_two_numbers(10, 1)  # if we know the order, we can just give the input values
str(add_two_numbers)    # to find out what parameters it expects, we use str()

# we can set a default value, which can be changed optionally
add_three_numbers <- function(x1, x2, x3 = 20) {
  x1 + x2 + x3
}

add_three_numbers(4, 5)
add_three_numbers(x1 = 4, x2 = 5, x3 = 10)
add_three_numbers(4, 5, 10)   # same thing, as long as we know the order

plot(1:5, 6:10, pch = 20, col = "black")

color_plot <- function(color_var, size) {
  plot(1:5, 6:10, pch = 20, col = color_var, cex = size)
}

color_plot("red", 0.5)







