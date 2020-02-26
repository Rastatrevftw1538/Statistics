###############################################################################
######################## BUSAD 40 Introduction to R ###########################
###############################################################################

######### R Basics ##########
#############################
##### Get started #####
# The assignment operator  
# An arrow (<-) formed by a smaller than character and a hyphen without a space
a <- 10.23  # "a" is the variable name, assign a numeric value to a
a  # display the value of a on console

# R is case sensitive, X and x are two different objects, 
# as well as temp and temP.
x <- 1  # lowercase x is assigned with value 1
x

# lowercase x is re-assigned with value 2 
# (the original value 1 in x is replaced by 2)
x <- 2  
x

# uppercase X is assigned with value 3. 
# Note that uppercase X is different from lowercase x as R is case-sensitive. 
X <- 3

x
X

# An example
x <- c(1:10)  # a vector of 10 natural numbers from 1 to 10
x
x[(x > 8) | (x < 5)]  # yields 1 2 3 4 9 10
x > 8  # return a vector of TRUE/FALSE logical values
x < 5

# To list the objects that you have in your current R session 
# use the function ls.
ls()

# If you assign a value to an object that already exists then the contents 
# of the object will be overwritten with the new value (without a warning!).
x <- "This is R"
x
x <- 10  # value of "This is R" is replaced by the number 10 in x
x

# R has a lot of features for graphing
z2 <- c(1,2,3,4,5,6)
z3 <- c(6,8,3,5,7,1)
plot(z2,z3)
title("My first scatterplot")

##### R workspace #####
# During your R session you can also explicitly save the workspace image. 
save.image()  # save workspace to the current working directory
getwd()  # just checking what the current working directory is
# save workspace to a specific file and location
save.image("computer directory/.RData")  
# or use "\\", the escape sequence for "\" in a Windows system
save.image("computer directory\\.RData") 

# to browse and use the command history in R console
# use the up and down arrow keys

# view and set options for the session
help(options) # learn about available option
options() # view current option settings
options(digits=3) # number of digits to print on output 

# you can save and load saved command history through the History tab 
# in the upper-right pane in RStudio

##### R help #####
# Once R is installed, there is a comprehensive built-in help system. 
help.start( )  # general help

help(glm)  # help about function glm( )
?glm  # or you can use this

example("plot")  # show an example of function plot( )

# search for "plot" in help manuals and archived mailing lists
RSiteSearch("plot") 

# R Datasets
# R comes with a number of sample datasets that you can experiment with. 
# To see the available datasets. 
data( )

help(mtcars)  # for details on the dataset "mtcars"

##### Data Input #####
######################
##### Data types #####
# R has a wide variety of data types (structures) including scalars, 
# vectors (numerical, character, logical), matrices, data frames, and lists.

# Vectors 
a <- c(1, 2, 5.3, 6, -2, 4)  # numeric vector
b <- c("one", "two", "three")  # character vector
c <- c(TRUE, TRUE, TRUE, FALSE, TRUE, FALSE)  # logical vector

# Refer to elements of a vector using subscripts. 
a[c(2,4)]  # 2nd and 4th elements of vector
a[2:4]  # 2nd-4th elelments of vector
a[2]  # 2nd element of vector

# Matrices 
# All columns in a matrix must have the same data type 
# (numeric, character, etc.) and the same length. 

# generates 5 x 4 numeric matrix
y <- matrix(1:20, nrow=5, ncol=4)
y

# another example
cells <- c(1, 26, 24, 68)
rnames <- c("R1", "R2")  # row names for the matrix
cnames <- c("C1", "C2")  # column names for the matrix
# create a 2 by 2 matrix, fill in the cells by row, and give the
# row and column names
# assign the matrix to a variable "mymatrix"
mymatrix <- matrix(cells, nrow=2, ncol=2, byrow=TRUE, 
                   dimnames=list(rnames, cnames)) 
mymatrix

dim(mymatrix)  # dimensions of the matrix

# Identify rows, columns or elements using subscripts.
x <- matrix(c(1:20), nrow=4, ncol=5)
x

x[, 4]  # 4th column of matrix
x[3, ]  # 3rd row of matrix 
x[2:4, 1:3]  # rows 2,3,4 of columns 1,2,3 

# Data frames
# A data frame is more general than a matrix, in that different columns
# can have different modes (numeric, character, factor, etc.). 
d <- c(1, 2, 3, 4)
e <- c("red", "white", "red", NA)
f <- c(TRUE, TRUE, TRUE, FALSE)
mydata <- data.frame(d, e, f)
names(mydata) <- c("ID","Color","Passed")  # variable names
mydata

class(mydata)  # show which data structure the variable has

mydata[1:2]  # columns 1 and 2 of dataframe
mydata[c("Color","ID")]  # columns Color and ID from dataframe
mydata$Passed  # variable Passed in the dataframe 

# Lists
# An ordered collection of objects (components). 
# A list allows you to gather a variety of (possibly unrelated) objects
# under one name.

# example of a list with 4 components
# a string, a numeric vector, a matrix, and a scalar
w <- list(name="Fred", mynumbers=a, mymatrix=mymatrix, age=5.3)
w

w["name"]  # the first component in the list w
w["mynumbers"]  # the second component
w["mymatrix"]  # the third component
w["age"]  # the fourth component

y <- list(c(1:10), mydataframe=mydata)  # another list
y

# example of a list containing two lists
v <- c(w, y)
v

# Identify elements of a list using the [[]] convention.
v[["mydataframe"]]
v[[5]]

# Factors
# Tell R that a variable is nominal by making it a factor. 
# variable gender with 20 "male" entries and 30 "female" entries
gender <- c(rep("male", 20), rep("female", 30))
gender

summary(gender)  # summary of the data
table(gender)  # frequency distribution table

# stores gender as 30 1s and 20 2s and associates
# 1=female, 2=male internally (alphabetically)
# R now treats gender as a nominal variable 
gender <- factor(gender) 
gender

summary(gender)  # summary of the data

# Useful Functions
# number of elements or components
length(v)

# structure of an object
str(v)

# class or type of an object
class(v)

# names
names(v)

# combine objects into a vector
c(w, y)

# list current objects
ls()

# delete an object
rm(X)
X

##### Importing Data #####
# Importing data into R is fairly simple.
# From a .csv file

# From A Comma Delimited Text File .csv
# The first argument of the read.table() function takes
# the file name to be imported. The file path that points to the file
# may be given before the file name depending on the current working
# directory. 

# ./ before the SoftDrink.csv file name below is the file path.
# the dot slash ./ means the file path is the current working direcrtory.
# This is the correct path as long as the SoftDrink.csv file is in the 
# current working directory in RStudio.  
softdrink <- read.table("./SoftDrink.csv", header=TRUE, sep=",")

# If the SoftDrink.csv file is in the current working directory, 
# the file path ./ can be omitted. 
softdrink <- read.table("SoftDrink.csv", header=TRUE, sep=",")
softdrink
str(softdrink)
table(softdrink)
summary(softdrink)

grades <- read.table("studentgrades.csv", header=TRUE, sep=",",
                     row.names="STUDENTID")
grades
str(grades)

##### Exporting Data #####
# To A Tab Delimited Text File
# c:/ here is the file path in which the file mydata.txt will be stored. 
write.table(mydata, "c:/mydata.txt", sep="\t") 

##### Viewing Data #####
# list the variables in studentgrades
names(grades)

# list the structure of studentgrades
str(grades) 

# dimensions of an object
dim(grades) 

# class of an object (numeric, matrix, dataframe, etc)
class(grades)

# print studentgrades
grades

# mtcars is a built-in datasets available in R
# print first 10 rows of mtcars
head(mtcars, n=10)

# print last 5 rows of mtcars 
tail(mtcars, n=5) 

##### Value Labels ##### 
# You can use the factor function to create your own value labels. 
grades$Grade <- factor(grades$Grade, ordered=TRUE, 
                              levels=c("A", "A+"),
                              labels=c("Excellent", "Outstanding"))
grades
str(grades)

##### Data Manipulation #####
#############################
##### Create new variables #####
# Use the assignment operator <- to create new variables.
x1 <- c(1, 2, 3)
x2 <- c(4, 5, 6)
age <- c(80, 50, 30)
mydata <- data.frame(x1, x2, age)
mydata

# Three examples for doing the same computations
# Example 1
mydata$sum <- mydata$x1 + mydata$x2
mydata$mean <- (mydata$x1 + mydata$x2)/2
mydata

# Exmaple 2
attach(mydata) # attach the data to the R search path
mydata$sum <- x1 + x2
mydata$mean <- (x1 + x2)/2
detach(mydata) # detach the data from the R search path
mydata

# Example 3 - use transform() function 
mydata <- transform(mydata, sum = x1 + x2, mean = (x1 + x2)/2)
mydata

##### Arithmetic Operators #####
# addition
3 + 2.5

# subtraction
3 - 2.5  

# multiplication
3 * 2.5

# division
3 / 2.5

# exponentiation
3^2

# modulus (x mod y)
5 %% 2

# integer division
5 %/% 2

##### Logical Operators #####
3 < 2  # FALSE
3 <= 2  # FALSE 
3 <= 3  # TRUE
3 == 3  # TRUE
3 != 3  # FALSE
!(3 == 3)  # FALSE
(2 < 3) | (4 > 5)  # TRUE
(2 < 3) & (4 > 5)  # FALSE
isTRUE((2 < 3) & (4 > 5))  # FALSE

##### R built-in functions #####
# Numeric Functions
abs(-3.475)  # absoluat value
sqrt(9)  # square root
trunc(5.99)  # truncation 
round(3.475, digits=2)  # round up to n digits 
signif(3.475, digits=2)  # n significant digits 
log(10)  # natural logarithm
log10(10)  # common logarithm
exp(2)  # exponentiation 

# Character Functions
# Extract or replace substrings in a character vector.
a <- "abcdef"
substr(a, start=2, stop=4)  # return "bcd" 
substr(a, start=2, stop=4) <- "222"
a  # "a222ef"

# Split the elements of character vector x at split.
strsplit("abc", "")  # return a list of "a" "b" "c"

# Concatenate strings after using sep string to seperate them.
paste("x", 1:3, sep="M")  # returns c("xM1","xM2" "xM3")
paste("Today is", date())  # return today's date

toupper("abc")  # Uppercase
tolower("ABC")  # Lowercase

# mean of object x
# removing any missing values 
x <- c(1, 2, 3, 4, 5, NA)
mx <- mean(x, na.rm=TRUE) 
mx

# variance and standard deviation of object x.
var(x, na.rm=TRUE)
sd(x, na.rm=TRUE)

# median
median(x, na.rm=TRUE)

# quantiles where x is the numeric vector whose quantiles are desired 
# and probs is a numeric vector with probabilities in [0,1].
# quantile(x, probs)
# 30th and 84th percentiles of x
quantile(x, c(.3,.84), na.rm=TRUE)

# range
range(x, na.rm=TRUE)

# sum
sum(x, na.rm=TRUE)

# lagged differences, with lag indicating which lag to use
diff(x, lag=2)

# minimum
min(x, na.rm=TRUE)

# maximum
max(x, na.rm=TRUE)

# standardize a matrix.
scale(x, scale=TRUE)  # obtain z scores for x

# Other Useful Functions
# generate a sequence
seq(1, 10, 2)

# repeat x n times
rep(1:3, 2)

# divide continuous variable in factor with n levels 
cut(1:10, 5) 

##### Sub-setting Data #####
# R has powerful indexing features for accessing object elements. 
# These features can be used to select and exclude variables and observations
# Selecting (Keeping) Variables

# select variables mpg, cyl, disp
myvars <- c("mpg", "cyl", "am")
newdata <- mtcars[myvars]
newdata

# select 1st and 5th thru 10th variables
newdata <- mtcars[c(1, 5:10)]
newdata

# Excluding (DROPPING) Variables
myvars <- names(mtcars) %in% c("mpg", "cyl", "am")
newdata <- mtcars[!myvars]
newdata

# exclude 3rd and 5th variable
newdata <- mtcars[c(-3, -5)]
newdata

# select observations
# first 5 observations
newdata <- mtcars[1:5, ]
newdata

# based on variable values
# select obervations with mpg >= 20 and am == 0
# note the comma after the first argument, this indicates 
# the condition is applied on selecting rows. 
newdata <- mtcars[mtcars$mpg >= 20 & mtcars$am == 0, ]
newdata