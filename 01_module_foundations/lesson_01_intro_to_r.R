###############################################
# Lesson 1: Getting Started with R
# Basics of Data, Variables, and Calculations
# Instructor: Dr. Basem Aljoumani
###############################################

# This lesson is designed for complete beginners.
# Goal:
# - understand what R is
# - write simple commands
# - store values in variables
# - use basic data types
# - create vectors
# - use R as a calculator

################################################
# 1. What is R and how do we interact with it?
################################################

# R is a programming language used for:
# - data analysis
# - statistics
# - visualization

# We interact with R by writing commands and running them.

# In this course, you will mainly work in RStudio.
# An R script is a text file that contains R commands.

# Lines starting with # are comments.
# Comments help humans read the code.
# R ignores comments.

# Example comment:
# This line is a comment and will not be executed by R.


############################################
# 2. Variables: storing information in R
############################################

# A variable stores a value so we can use it later.
# In R, we usually assign values using <-

x <- 10
y <- 5

# Now we can use these variables in calculations
x + y
x - y
x * y
x / y


########################################
# 3. Basic data types in R
########################################

# R stores data in different types.
# We will start with:
# - numeric
# - integer
# - logical
# - character
# - complex

# -------------------------
# 3.1 Numeric (double)
# -------------------------
x_num <- 11.1
class(x_num)
typeof(x_num)                     #they are basically the same — just two different ways of describing the same object.

# -------------------------
# 3.2 Integer
# -------------------------
# To create an integer, add L after the number
y_int <- 11L                         # Integer = whole numbers (no decimals)
class(y_int)                         # Double = numbers with decimals (or more precise numbers)
typeof(y_int)               

# -------------------------
# 3.3 Logical (Boolean)
# -------------------------
# Logical values are TRUE or FALSE
l_val <- TRUE
class(l_val)
typeof(l_val)

# -------------------------
# 3.4 Character
# -------------------------
# Character values are text inside quotation marks
word <- "home"
class(word)
typeof(word)

# -------------------------
# 3.5 Complex
# -------------------------
z <- 2 + 3i
class(z)
typeof(z)

# More examples
n_numeric <- 15
c_character <- "home"
l_logical <- FALSE

class(n_numeric)
class(c_character)
class(l_logical)


############################################
# 4. Vectors: working with multiple values
############################################

# A vector is a collection of values of the same type.
# We create vectors using c(), which means "combine".

# Numeric vector
num_vector <- c(14, 101, 419)
num_vector

# Character vector
character_vector <- c("ab", "bc", "cd")
character_vector

# Logical vector
logical_vector <- c(TRUE, FALSE, TRUE)
logical_vector

# Important rule:
# A vector should contain values of the same type.


#################################################
# 5. A practical example: temperature change
#################################################

# Daily temperature change (degrees Celsius)
temp_change_cityA <- c(12, -5, 22, -7, 20)
temp_change_cityB <- c(-2, -10, 20, -3, 13)

temp_change_cityA
temp_change_cityB


###########################################
# 6. Naming elements in a vector
###########################################

# We can assign names to vector elements
# to make the data easier to read.

days <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")
days

names(temp_change_cityA) <- days
names(temp_change_cityB) <- days

temp_change_cityA
temp_change_cityB

