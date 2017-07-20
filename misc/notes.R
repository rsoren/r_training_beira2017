#
# notes.R
#
# Reed Sorensen
# July 2017
#

df <- data.frame(
  id = 1:5,
  var1 = c(1,2,3,NULL,4)
)

x <- c(1,5,2,6,8,4,3)
sort(x)
order(x)
sort(x) == x[order(x)]

x2 <- rnorm(5)
x2
rank(x2)
