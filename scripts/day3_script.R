#
# day3_script.R
#
# Reed Sorensen
# July 2017
#
# Overview:
#   - Briefly review enrolling in Coursera.org courses
#     and show how to find courses with Portuguese subtitles
#   - Review R concepts from days 1 and 2
#   - Give a sense for where we're going --> data frames! 
#        Examples of how to explore data, get frequencies
#        and do a regression analysis
#   - More fundamental R concepts


##### 
# Signing up for a course in Coursera
# - Go to the course website:
#   https://github.com/rsoren/r_training_beira2017/blob/master/index.md
# - Scroll down to the section "Additional resources for learning R"
#   and click on the link for "Data Science certificate from Johns Hopkins University"
# - Create an account with Coursera
# - **** Ignore the part about enrolling for a 7-day free trial
# - Search for the name of the course in the bar at the top of the page,
#   for example, "The Data Scientist's Toolbox" or another course
#   and click on the result
# - Click on the button that says "Enroll"
# - Then at the bottom of the pop-up window
#   **** click on "Audit the course" to take it for free

##### 
# Searching for courses in Portuguese on Coursera
# - Go to the website: coursera.org
# - In the bar at the top, search for something you want to study,
#   for example, "data analysis"
# - On the left side of the page, look at "Subtitle Languages" and
#   and click on "Show more"
# - Un-select "English";
#   select "Portuguese (Brazilian)" and "Portuguese (European)" 
# - Choose a course, and enroll as usual (auditing is always free!)

  
#####
# ANALYZING DATA
# 

library(dplyr)

# create some data
df <- data.frame(
  group = sample(c("a", "b", "c"), size = 150, replace = TRUE),
  var1 = 1:150,
  var2 = 1:150 + rnorm(n = 150, mean = 0, sd = 15)
)

# write.csv(df, "misc/example_data.csv")   # save the data as a CSV file
# View(df)                                 # look at the data

plot(
  x = df[, "var1"],  y = df[, "var2"], 
  xlab = "Variable 1",  ylab = "Variable 2"
)

fit1 <- lm(var2 ~ var1, data = df)   # run a regression
summary(fit1)   # results of the regression
abline(fit1)    # put the line of best fit on the scatterplot

summary(df$var2)   # get summary statistics about a variable
table(df$group)    # how many subjects are in each group?

# use dplyr functions to get count and percent in each group
df2 <- df %>%
  group_by(group) %>%
  summarize(
    count = n(),
    percent = count / nrow(.)
  )



#####
# INDEXING with [] (continued from day 2)
# new function: %in%

# recall indexing by position and TRUE/FALSE
tmp <- c(3,5,2)
tmp[1]
tmp[c(TRUE, FALSE, FALSE)]

# -- create a vector of TRUE/FALSE with a logical condition (e.g. < and ==),
#    then index on it

x8 <- c(1,6,7,3,5,5,9,7,2)
x8 > 4     # notice how this creates a vector of TRUE/FALSE values
x8[x8 > 4] # this returns elements of x8 that are greater than 4


## Challenge
#   -- Make a vector with these elements: 3,6,3,2,4,7,2
#   -- Choose the elements that are above 5 (using indexing)
#      The answer should return the numbers 6 and 7

tmp <- c(3,6,3,2,4,7,2)
tmp[tmp > 5]

# could have also done...
true_and_false_vector <- tmp > 5
tmp[true_and_false_vector]


# check whether an element is in a vector with the %in% function
8 %in% c(3,65,6,8)      # it's true that 8 is in the vector
10 %in% c(3,65,6,8)     # it's not true that 10 is in the vector

# if you check whether two numbers are in the vector,
#   it gives you two answers
c(65, 10) %in% c(3,65,6,8)  # 65 gives TRUE, 10 gives FALSE, so
                            # response is equal to the vector c(TRUE, FALSE)

3 %in% 1:8    # is 3 in the vector c(1,2,3,4,5,6,7,8) ?
"b" %in% c("d", "e", "f")   # is "b" in the vector c("d", "e", f") ?

x9 <- c("a", "b", "c", "d", "d", "d", "e", "f")
x9 %in% c("d", "e")    # for each element of 'x9', check whether it is "d" or "e"


#####
# CHARACTER STRINGS
#   Base R functions: print, paste, paste0, substr
#   'stringr' package: https://journal.r-project.org/archive/2010-2/RJournal_2010-2_Wickham.pdf
#   'stringr' functions that do the same thing: str_c, str_sub, str_split_fixed
#   is.character, as.character, is.numeric, as.numeric

"a"
"Hello, my name is Reed"               # one string 
c("Hello", "my", "name", "is", "Reed") # a vector of 5 strings

x9 <- "Bom dia!"     # create a character object that contains "Bom dia!"

print(x9)    # display the word "Bom dia!"
x9           # same thing

paste("Hello", "everybody!")  # combine the strings 
paste0("Hello", "everybody!") # the paste0() function does not automatically include a space

substr(x9, start = 3, stop = 6) # extract the letters in positions 1 to 3
                                # how do we know these are the parameters to give?
                                # read the documentation with help("substr")

is.character(x9)   # check whether 'x9' is a character vector
is.numeric(x9)     # check whether 'x9' is a numeric vector

is.numeric(10)
is.character("awesome")
is.numeric("awesome")
is.character(10)

as.character(10)      # convert the number 10 into a string
as.numeric("awesome") # can't turn a word into a number, so it returned NA


#   -- Challenge:
#      1. Get R to display the word "Hello"
"Hello"
print("Hello")
paste("Hello")

#      2. Put the character string "Hello" into a object called 'txt'
txt <- "Hello"

#      3. Use 'txt' and the paste0() function to display the phrase "Hello, world!"
paste0(txt, ", world!")

#      4. Check whether 'txt' is a numeric variable
is.numeric(txt)

#      5. Check whether 'txt' is a character variable
is.character(txt)

#      6. Use the substr() function to extract the letters "He" from 'txt'
substr(txt, 1, 2)


#####
# MATRICES
# matrix, rbind, cbind
# str
# dim, ncol, nrow
# indexing by position

mat1 <- matrix(data = 1:9, ncol = 3) # make a matrix, filled vertically (default)
print(mat1)

mat2 <- matrix(  # make a matrix, filled horizontally (use byrow = TRUE)
  data = 1:6,
  ncol = 3,
  byrow = TRUE
)
print(mat2)

# -- use existing vectors to create a matrix
vec1 <- c(3,4,5)
vec2 <- c(7,8,9)

rbind(vec1, vec2) # combine the vectors as rows
cbind(vec1, vec2) # combine the vectors as columns

# -- get information about a matrix
nrow(mat2)
ncol(mat2)
dim(mat2) # results of ncol and nrow at the same time

# -- index a matrix by row (note the comma!)
mat2[1, ]
# -- index a matrix by column
mat2[, 2]
  
mat2[2, c(2,3)] # get the second row, and columns 2 and 3

#   -- Challenge:
#      1. Create a 3-by-4 matrix that only contains the number 5 (repeated 12 times)
matrix(data = rep(5, 12), nrow = 3, ncol = 4)
matrix(data = 5, nrow = 3, ncol = 4)   # same thing, because 5 repeats until the matrix is filled
matrix(5, 3, 4)   # same thing; we know the order of parameters R expects 
                  #             by checking str(matrix) or help(matrix)


#      2. Create two vectors
#           'tmp1' contains the letters "a", "b" and "c"
#           'tmp2' contains the letters "d", "e" and "f"
tmp1 <- c("a", "b", "c")
tmp2 <- c("d", "e", "f")


#      3. Use the rbind() function to combine tmp1 and tmp2
#           to display a matrix that looks like this:
#                                            "a"  "b"  "c"
#                                            "d"  "e"  "f"
rbind(tmp1, tmp2)


#      4. Create an object called 'mat' that contains the matrix from #3
mat <- rbind(tmp1, tmp2)


#      5. Use cbind() to add another column to 'mat', with the letters "y" and "z"
#         Your result should look like this:
#                                            "a"  "b"  "c"  "y"
#                                            "d"  "e"  "f"  "z"
cbind(mat, c("y", "z"))

