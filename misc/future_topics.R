#
# future_topics.R
#
# Reed Sorensen
# July 2017
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

