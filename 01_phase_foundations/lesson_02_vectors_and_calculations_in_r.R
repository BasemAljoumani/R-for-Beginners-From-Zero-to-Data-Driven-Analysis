
#########################################################
# Lesson 2: Vectors, Calculations, and Data Types in R
# Date: 05-04-2026
#########################################################

###########################################
# 1. Creating vectors (real example) /Naming elements in a vector
###########################################

# Daily temperature change (degrees Celsius)
temp_change_cityA <- c(12, -5, 22, -7, 20)
temp_change_cityB <- c(-2, -10, 20, -3, 13)

temp_change_cityA
temp_change_cityB



#  Naming elements in a vector

# Assign names to vector elements (days of the week)
days <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")

names(temp_change_cityA) <- days
names(temp_change_cityB) <- days

temp_change_cityA
temp_change_cityB



###########################################
# 2. Useful basic functions
###########################################

# Rounding functions
round(233.634)     # Round to nearest value
ceiling(-4.5)      # Round up
floor(-4.5)        # Round down
trunc(-4.5)        # Remove decimal part

# Type conversion
as.numeric("25")




###########################################
# 3. R as a calculator
###########################################

10 + 5
10 - 5
10 * 5
10 / 5
10^3   # Power

# Order of operations
2 + 3 * 5^2
((2 + 3) * 5)^2

# Modulus (remainder)
100 %% 75


###########################################
# 4. Small practice
###########################################

a <- 8
b <- 4

a + b
a * b
a^b


###########################################
# 5. Creating vectors
###########################################

# Numeric vector
my_numeric <- c(2, 44, 6, 1, 3)
my_numeric

# Character vector
cities <- c("Berlin", "Madrid", "Tunis")
cities


###########################################
# 6. Checking data types
###########################################

class(a)
class(b)
class(my_numeric)
class(cities)


###########################################
# 7. Lesson summary
###########################################

# In this lesson, you learned:
# - how to name vector elements
# - basic mathematical operations in R
# - order of operations
# - useful functions (round, floor, etc.)
# - how to create vectors
# - how to check data types


#########################################################
# Exercises
#########################################################

###########################################
# Question 1: Operations
###########################################

x <- 12
y <- 4
z <- 2

# Multiplication before addition
result1 <- x + y * z

# Addition before multiplication
result2 <- (x + y) * z

# Power operation
result3 <- x^z + y

result1
result2
result3


###########################################
# Question 2: Data types
###########################################

a <- 15
b <- 15L
c <- "15"
d <- FALSE

# Check class
class(a)
class(b)
class(c)
class(d)

# Check type
typeof(a)
typeof(b)
typeof(c)
typeof(d)

# Operations
a + b
a + c              # Will give an error
a + as.numeric(c)  # Correct conversion
a + d              # FALSE = 0


###########################################
# Question 3: Vector & type conversion
###########################################

v <- c(25, "30", TRUE)

v
class(v)

# Explanation:
# R converts all elements to the same type (character)

# Convert to numeric
v_num <- as.numeric(v)
v_num
class(v_num)

# Note:
# TRUE becomes NA because it was converted from character


###########################################
# Cleaning workspace (optional)
###########################################

cat('\014')        # Clear console
rm(list = ls())    # Clear environment

