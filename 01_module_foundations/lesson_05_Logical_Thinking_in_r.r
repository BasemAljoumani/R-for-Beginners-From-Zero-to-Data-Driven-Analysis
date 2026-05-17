############################################################
# Lesson 05A: Logical Thinking in R
# Course: R for Beginners – From Zero to Data-Driven Analysis
# Dr. Basem Aljoumani
# Date: 03.05.2026
#
# Topics:
# - TRUE and FALSE
# - Relational operators
# - Comparisons with vectors
# - Logical filtering
# - AND, OR, NOT
# - Simple if statement
############################################################


############################################################
# 1. Learning Objectives
############################################################

# By the end of this lesson, you should be able to:
# - understand TRUE and FALSE values in R
# - use relational operators: ==, !=, <, >, <=, >=
# - compare numbers and text
# - apply comparisons to vectors
# - select values from vectors using logical conditions
# - combine conditions using &, |, and !
# - write a simple if statement


############################################################
# 2. TRUE and FALSE in R
############################################################

# In R, logical results are written as:
# TRUE
# FALSE

TRUE
FALSE

# Logical values usually come from comparisons.

3 > 2
3 < 2


############################################################
# 3. Relational Operators
############################################################

# Relational operators compare values.
# The result is always TRUE or FALSE.

# Example: comparing numbers

# Question: Are these values equal?

3 == 3
3 == 5

# Question: Are these values different?

3 != 5
3 != 3

# Question: Is one value smaller or larger?

3 < 5
3 > 5

# Question: Is one value smaller/equal or larger/equal?

3 <= 3
5 >= 3


############################################################
# 4. Important Difference: Assignment and Comparison
############################################################

# Assignment means storing a value in an object.

x <- 5

# Comparison means asking a TRUE/FALSE question.

x == 5

# Important:
# <- is used for assignment
# == is used for comparison


############################################################
# 5. Comparing Character Values
############################################################

# Example: comparing text

# Question: Are these words equal?

"name" == "name"
"name" == "Name"

# Important:
# R is case-sensitive.
# "name" and "Name" are not the same.

# Question: Which word comes first alphabetically?

"apple" < "banana"

# Best practice:
# If uppercase/lowercase should not matter, use tolower().

tolower("Hello") == tolower("hello")


############################################################
# 6. Relational Operators with Vectors
############################################################

# Example: daily LinkedIn views
# Suppose we recorded daily views for one week:

linkedin <- c(16, 9, 13, 5, 2, 17, 19)

linkedin

# Question:
# Which days had more than 10 views?

linkedin > 10

# Interpretation:
# TRUE  = more than 10 views
# FALSE = 10 views or less

# Question:
# Which positions satisfy the condition?

which(linkedin > 10)

# Question:
# What are the actual values greater than 10?

linkedin[linkedin > 10]


############################################################
# 7. More Vector Filtering Practice
############################################################

# Example: simple numeric vector
# Suppose we have these values:

x <- c(5, 10, 15, 3)

x

# Question:
# Which values are greater than 10?

x > 10

# Select values greater than 10

x[x > 10]

# Get positions of values greater than 10

which(x > 10)


############################################################
# 8. Comparing Two Vectors
############################################################

# Example: Facebook vs LinkedIn views
# Suppose we recorded Facebook views for the same week:

facebook <- c(17, 7, 5, 16, 8, 13, 14)

facebook
linkedin

# Question:
# Did Facebook have less than or equal views compared to LinkedIn each day?

facebook <= linkedin

# Interpretation:
# Day 1: 17 <= 16 -> FALSE
# Day 2: 7 <= 9  -> TRUE
# Day 3: 5 <= 13 -> TRUE


############################################################
# 9. Logical Operators
############################################################

# Logical operators combine conditions.

# Main logical operators:
# & means AND
# | means OR
# ! means NOT


############################################################
# 10. AND Operator: &
############################################################

# AND returns TRUE only if both conditions are TRUE.

TRUE & TRUE
TRUE & FALSE
FALSE & TRUE
FALSE & FALSE

# Example:
# Suppose x is 12.

x <- 12

# Question:
# Is x greater than 5 AND less than 15?

x > 5 & x < 15


############################################################
# 11. OR Operator: |
############################################################

# OR returns TRUE if at least one condition is TRUE.

TRUE | TRUE
TRUE | FALSE
FALSE | TRUE
FALSE | FALSE

# Example:
# Suppose x is 20.

x <- 20

# Question:
# Is x less than 5 OR greater than 15?

x < 5 | x > 15


############################################################
# 12. NOT Operator: !
############################################################

# NOT reverses TRUE and FALSE.

!TRUE
!FALSE

# Example:
# Suppose x is 8.

x <- 8

# Question:
# Is it NOT true that x is greater than 10?

!(x > 10)


############################################################
# 13. Common Mistake: Between Two Values
############################################################

# Example:
# Suppose x is 5.

x <- 5

# Wrong in R:
# 3 < x < 7

# Correct:
# Every comparison must be written clearly.

3 < x & x < 7

# Example with a vector:

x <- c(10, 15, 5, 12)

# Question:
# Which values are greater than 3 AND less than 7?

3 < x & x < 7

# Select the values:

x[3 < x & x < 7]


############################################################
# 14. Practical Example: Social Media Views
############################################################

# Example:
# Suppose we have LinkedIn and Facebook views for one week.

linkedin <- c(16, 9, 13, 5, 2, 17, 14)
facebook <- c(17, 7, 5, 16, 8, 13, 14)

linkedin
facebook

# Question 1:
# Which days had LinkedIn views greater than 10?

linkedin > 10

# Question 2:
# Which days had Facebook views less than 10?

facebook < 10

# Question 3:
# Which days had LinkedIn > 10 AND Facebook < 10?

linkedin > 10 & facebook < 10

# Select LinkedIn values for those days:

facebook[linkedin > 10 & facebook < 10]
linkedin
facebook


# Question 4:
# Which days had at least one platform with 12 or more views?

linkedin >= 12 | facebook >= 12

linkedin[linkedin >= 12 | facebook >= 12]
facebook[linkedin >= 12 | facebook >= 12]
h_12 <- data.frame(
  lin =linkedin[linkedin >= 12 | facebook >= 12],
  fc = facebook[linkedin >= 12 | facebook >= 12]
)

h_12
############################################################
# 15. Simple if Statement
############################################################

# if is used when we want R to do something only if a condition is TRUE.

# General structure:
# if (condition) {
#   code to run
# }

# Example:
# Suppose x is 7.

x <- 7

# Question:
# Is x greater than 5?

if (x > 5) {
  print("x is greater than 5")
}

# If the condition is TRUE, R prints the message.
# If the condition is FALSE, nothing happens.


############################################################
# 16. Practice Questions
############################################################

# Practice 1:
# Predict the result, then run the code.

TRUE
FALSE
5 > 3
5 < 3
5 == 5
5 != 5


# Practice 2:
# Compare text.

"R" == "R"
"R" == "r"
"apple" < "banana"


# Practice 3:
# Work with a vector.

x <- c(2, 10, 12, 7)

# Write code to answer:
# 1. Which values are greater than or equal to 10?
# 2. What are the positions of these values?
# 3. What are the actual values?


# Practice 4:
# Work with LinkedIn views.

linkedin <- c(16, 9, 13, 5, 2, 17, 14)

# Write code to answer:
# 1. Which days had more than 10 views?
# 2. Which positions had more than 10 views?
# 3. What are the values greater than 10?


# Practice 5:
# Combine conditions.

x <- c(3, 10, 12, 7)

# Write code to answer:
# 1. Which values are greater than 5 AND less than 15?
# 2. Which values are less than 5 OR greater than 10?
# 3. Select values greater than 5 AND less than 15.


# Practice 6:
# Simple if statement.

x <- 4

# Write an if statement:
# If x is less than 5, print:
# "x is smaller than 5"

