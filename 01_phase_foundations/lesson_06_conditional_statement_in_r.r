############################################################
# Lesson 06: Conditional Statements in R
# Course: R for Beginners – From Zero to Data-Driven Analysis
#
# Topics:
# - Review of logical conditions
# - if statements
# - if...else statements
# - if...else if...else statements
# - Order of conditions
# - Simple decision rules
############################################################


############################################################
# 1. Learning Objectives
############################################################

# By the end of this lesson, you should be able to:
# - review logical conditions using TRUE and FALSE
# - use if to run code only when a condition is TRUE
# - use if...else to choose between two actions
# - use if...else if...else for several possible cases
# - understand why the order of conditions matters
# - write simple decision rules in R


############################################################
# 2. Review: Logical Conditions
############################################################

# A condition is a question that returns TRUE or FALSE.

x <- 10

x > 5
x < 5
x == 10
x != 10

# Logical operators can combine conditions.

x > 5 & x < 15
x < 5 | x > 15
!(x > 15)


############################################################
# 3. The if Statement
############################################################

# if is used when we want R to do something
# only if a condition is TRUE.

# General structure:
# if (condition) {
#   code to run if condition is TRUE
# }

# Example:
# Suppose x is -3.

x <- -3

# Question:
# Is x negative?

if (x < 0) {
  print("x is a negative number")
}

# If the condition is TRUE, R runs the code inside { }.
# If the condition is FALSE, nothing happens.


############################################################
# 4. if with a Different Value
############################################################

# Example:
# Suppose x is 4.

x <- 4

# Question:
# Is x negative?

if (x < 0) {
  print("x is a negative number")
}

# Nothing is printed because x < 0 is FALSE.


############################################################
# 5. The if...else Statement
############################################################

# if...else is used when we want R to choose
# between two possible actions.

# General structure:
# if (condition) {
#   code if TRUE
# } else {
#   code if FALSE
# }

# Example:
# Suppose x is -3.

x <- -3

if (x < 0) {
  print("x is a negative number")
} else {
  print("x is zero or positive")
}


############################################################
# 6. if...else with Another Value
############################################################

# Example:
# Suppose x is 7.

x <- 7

if (x < 0) {
  print("x is a negative number")
} else {
  print("x is zero or positive")
}


############################################################
# 7. if...else if...else
############################################################

# if...else if...else is used when there are
# more than two possible cases.

# General structure:
# if (condition1) {
#   code if condition1 is TRUE
# } else if (condition2) {
#   code if condition2 is TRUE
# } else {
#   code if none of the above conditions are TRUE
# }

# Example:
# Suppose x is 0.

x <- 0

if (x < 0) {
  print("x is a negative number")
} else if (x == 0) {
  print("x is zero")
} else {
  print("x is a positive number")
}


############################################################
# 8. Classifying a Number
############################################################

# Example:
# Suppose x is 15.

x <- 15

# Question:
# Is x small, medium, or large?

# Rule:
# small  = x is less than 10
# medium = x is from 10 to less than 20
# large  = x is 20 or more

if (x < 10) {
  print("small")
} else if (x >= 10 & x < 20) {
  print("medium")
} else {
  print("large")
}


############################################################
# 9. Important: Order Matters
############################################################

# R checks conditions from top to bottom.
# Once R finds a TRUE condition, it runs that block
# and ignores the rest.

# Example:
# Suppose x is 18.

x <- 18

if (x >= 10) {
  print("x is at least 10")
} else if (x >= 15) {
  print("x is at least 15")
}

# The second condition will never run here.
# Why?
# Because every value that is >= 15 is also >= 10.

# Better order:

if (x >= 15) {
  print("x is at least 15")
} else if (x >= 10) {
  print("x is at least 10")
}


############################################################
# 10. Example: Divisibility
############################################################

# The modulo operator %% gives the remainder after division.

6 %% 2
6 %% 3
7 %% 2

# Example:
# Suppose x is 6.

x <- 6

# Question:
# Is x divisible by 2, divisible by 3, or neither?

if (x %% 2 == 0) {
  print("divisible by 2")
} else if (x %% 3 == 0) {
  print("divisible by 3")
} else {
  print("not divisible by 2 or 3")
}

# Important:
# x = 6 is divisible by both 2 and 3.
# But only the first TRUE condition runs.
# Again: order matters.


############################################################
# 11. if Needs ONE TRUE or FALSE
############################################################

# Important rule:
# The condition inside if() must give one TRUE or one FALSE.

# Example:
# This vector has three values.

x <- c(1, 2, 3)

# This gives three TRUE/FALSE results:

x > 0

# Do not use this directly inside if:
# if (x > 0) {
#   print("positive")
# }

# Instead, use one value:

if (x[1] > 0) {
  print("the first value is positive")
}



x <- 7

if (x > 3 & x < 15) {
  print("x is between 3 and 15")
}


x <- 20

if (x < 3 | x > 15) {
  print("x is outside the range")
}




