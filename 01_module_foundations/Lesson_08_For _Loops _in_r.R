############################################################
# Lesson 08: For Loops in R
# Course: R for Beginners - From Zero to Data-Driven Analysis
#
# Goal:
# In this lesson, you will learn how to use for loops in R.
# A for loop helps us repeat the same action many times
# without writing the same code again and again.




############################################################
# Before to start , ifelse() 
#############################

#  ifelse(condition, value_if_true, value_if_false) 


temperature <- 35

if (temperature > 30){
  print("Hot Day")
}

#  temperature > 30 gives only one result:   TURE 

temperature <- c(18, 25, 33, 40)

ifelse(temperature > 30, "Hot Day ", "Mild Day ")

#one value
#OR many values (vectors)


############################################################
# 1. Learning Objectives
############################################################

# By the end of this lesson, you should be able to:
#
# - understand why loops are useful
# - understand the basic structure of a for loop
# - loop over a vector
# - understand how R runs a loop step by step
# - loop using positions/indexes
# - combine for loops with if conditions
# - loop through rows in a data frame
# - use break to stop a loop
# - use next to skip one loop step
# - use nested loops with matrices


############################################################
# 2. Why Do We Need Loops?
############################################################

# Imagine we want to print four student names.

print("Ahmed")
print("Sara")
print("Lina")
print("Omar")

# This works.
# But we repeated print() many times.

# Now imagine we have:
#
# - 50 students
# - 100 exam scores
# - 365 daily temperature values
#
# Writing the same code again and again is slow and difficult.

# A loop helps us repeat code automatically.


############################################################
# 3. The Main Idea of a For Loop
############################################################

# A for loop means:
#
# Take one value
# Run the code
# Move to the next value
# Run the code again
# Continue until all values are finished

# This is the basic structure:

# for(variable in collection) {
#
#   code to repeat
#
# }

# Read it like this:
#
# "For each value in the collection,
# put that value inside the variable,
# then run the code inside the curly braces."


############################################################
# 4. First Simple Example
############################################################

students_names <- c("Ahmed", "Sara", "Lina", "Omar")

students_names

for(name in students_names) {
  
  print(name)
  
}

# What happens here?
#
# First time:
# name is "Ahmed"
#
# Second time:
# name is "Sara"
#
# Third time:
# name is "Lina"
#
# Fourth time:
# name is "Omar"


############################################################
# 5. Understanding the Loop Step by Step
############################################################

# This loop:

for(name in students_names) {
  
  print(name)
  
}

# is similar to writing this manually:

name <- "Ahmed"
print(name)

name <- "Sara"
print(name)

name <- "Lina"
print(name)

name <- "Omar"
print(name)

# Important:
#
# The loop variable, here called name,
# changes during every step of the loop.

# In R, after the loop finishes,
# the loop variable still exists
# and keeps the last value.

name

# This will show:
# "Omar"


############################################################
# 6. Looping Over Numbers
############################################################

numbers <- c(10, 20, 30, 40, 50)

for(num in numbers) {
  
  print(num)
  
}

# Here, num becomes:
#
# 10
# then 20
# then 30
# then 40
# then 50


############################################################
# 7. Doing Calculations Inside a Loop
############################################################

numbers <- c(1, 2, 3, 4, 5)

for(num in numbers) {
  
  print(num * 2)
  
}

# R does this:
#
# 1 * 2
# 2 * 2
# 3 * 2
# 4 * 2
# 5 * 2

# A loop is not only for printing.
# We can also calculate, compare, save, or transform values.


############################################################
# 8. A Very Important Mental Model
############################################################

# Always ask yourself:
#
# What is the collection?
# What is the loop variable?
# What code is repeated?

for(num in numbers) {
  
  print(num * 2)
  
}

# Collection:
# numbers

# Loop variable:
# num

# Repeated code:
# print(num * 2)


############################################################
# 9. Looping Over Text
############################################################

cities <- c("Berlin", "Paris", "London", "Rome")

for(city in cities) {
  
  print(
    paste("The city is", city)
  )
  
}

# paste() combines text and values.

# Example:
#
# paste("The city is", "Berlin")
#
# gives:
#
# "The city is Berlin"


############################################################
# 10. Looping Using Positions
############################################################

# Sometimes we do not only want the value.
# We also want the position of the value.

cities <- c("Berlin", "Paris", "London", "Rome")

# The positions are:
#
# Berlin is position 1
# Paris is position 2
# London is position 3
# Rome is position 4

cities[1]
cities[2]
cities[3]
cities[4]

# length(cities) gives the number of values.

length(cities)

# 1:length(cities) creates positions from 1 to 4.

1:length(cities)

for(i in 1:length(cities)) {
  
  print(
    paste(
      cities[i],
      "is in position",
      i
    )
  )
  
}

# Here:
#
# i is the position
# cities[i] is the city at that position


############################################################
# 11. A Safer Way: seq_along()
############################################################

# In real programming, this is safer:

for(i in seq_along(cities)) {
  
  print(
    paste(
      cities[i],
      "is in position",
      i
    )
  )
  
}

# For beginners:
#
# 1:length(cities) is easier to understand first.
#
# But later, seq_along(cities) is a better habit.


############################################################
# 12. Looping With Conditions
############################################################

# Now we combine:
#
# - for loops
# - if conditions

scores <- c(85, 70, 90, 45, 80)

for(score in scores) {
  
  if(score >= 60) {
    
    print("Pass")
    
  } else {
    
    print("Fail")
    
  }
  
}

# This checks every score one by one.

# First score:
# 85 >= 60, so print "Pass"

# Second score:
# 70 >= 60, so print "Pass"

# Fourth score:
# 45 is not >= 60, so print "Fail"


############################################################
# 13. Printing the Score and the Result
############################################################

scores <- c(85, 70, 90, 45, 80)

for(score in scores) {
  
  if(score >= 60) {
    
    print(
      paste(score, "- Pass")
    )
    
  } else {
    
    print(
      paste(score, "- Fail")
    )
    
  }
  
}


############################################################
# 14. More Detailed Conditions
############################################################

scores <- c(95, 82, 74, 58, 67, 90, 45)

for(score in scores) {
  
  if(score >= 90) {
    
    print(
      paste(score, "- Excellent")
    )
    
  } else if(score >= 80) {
    
    print(
      paste(score, "- Very good")
    )
    
  } else if(score >= 70) {
    
    print(
      paste(score, "- Good")
    )
    
  } else if(score >= 60) {
    
    print(
      paste(score, "- Pass")
    )
    
  } else {
    
    print(
      paste(score, "- Fail")
    )
    
  }
  
}


############################################################
# 15. Data Frame Example
############################################################

# A data frame is like a table.

students <- data.frame(
  name = c("Ahmed", "Sara", "Lina", "Omar", "Maya", "Ali", "Huda"),
  score = c(95, 82, 74, 58, 67, 90, 45)
)

students

# We can extract one value from a column.

students$name[1]
students$score[1]

# students$name[1] means:
#
# Go to the name column,
# then take the first value.

# students$score[1] means:
#
# Go to the score column,
# then take the first value.


############################################################
# 16. Looping Through Rows in a Data Frame
############################################################

# nrow(students) gives the number of rows.

nrow(students)

# We use positions:
#
# 1, 2, 3, 4, 5, 6, 7

1:nrow(students)

for(i in 1:nrow(students)) {
  
  stud_name <- students$name[i]
  stud_score <- students$score[i]
  
  print(
    paste(
      stud_name,
      "has score",
      stud_score
    )
  )
  
}

# Here:
#
# i is the row number.
#
# students$name[i] gives the student name in row i.
#
# students$score[i] gives the student score in row i.


############################################################
# 17. Data Frame With Conditions
############################################################

for(i in 1:nrow(students)) {
  
  stud_name <- students$name[i]
  stud_score <- students$score[i]
  
  if(stud_score >= 60) {
    
    result <- "Pass"
    
  } else {
    
    result <- "Fail"
    
  }
  
  print(
    paste(
      stud_name,
      "scored",
      stud_score,
      "and the result is",
      result
    )
  )
  
}


############################################################
# 18. Data Frame With More Detailed Results
############################################################

for(i in 1:nrow(students)) {
  
  stud_name <- students$name[i]
  stud_score <- students$score[i]
  
  if(stud_score >= 90) {
    
    result <- "Excellent"
    
  } else if(stud_score >= 80) {
    
    result <- "Very good"
    
  } else if(stud_score >= 70) {
    
    result <- "Good"
    
  } else if(stud_score >= 60) {
    
    result <- "Pass"
    
  } else {
    
    result <- "Fail"
    
  }
  
  print(
    paste(
      stud_name,
      "scored",
      stud_score,
      "-",
      result
    )
  )
  
}


############################################################
# 19. length() vs nrow()
############################################################

# For vectors, use length().

x <- c(10, 20, 30, 40)

length(x)

# length(x) gives the number of values.

# For data frames, use nrow() when you want rows.

students

nrow(students)

# nrow(students) gives the number of rows.

# Be careful:

length(students)

# For a data frame, length() gives the number of columns,
# not the number of rows.

# Summary:
#
# Vector:
# use length()
#
# Data frame rows:
# use nrow()


############################################################
# 20. Using break
############################################################

# break stops the whole loop immediately.

scores <- c(85, 70, 90, 45, 80)

for(score in scores) {
  
  if(score < 60) {
    
    break
    
  }
  
  print(score)
  
}

# What happens?
#
# score = 85
# print 85
#
# score = 70
# print 70
#
# score = 90
# print 90
#
# score = 45
# condition is TRUE
# break stops the loop
#
# 80 is never printed.


############################################################
# 21. Using next
############################################################

# next skips only the current loop step.
# The loop continues after that.

scores <- c(85, 70, 90, 45, 80)

for(score in scores) {
  
  if(score < 60) {
    
    next
    
  }
  
  print(score)
  
}

# What happens?
#
# score = 85
# print 85
#
# score = 70
# print 70
#
# score = 90
# print 90
#
# score = 45
# skip this step
#
# score = 80
# print 80


############################################################
# 22. Difference Between break and next
############################################################

# break:
# stops the whole loop

# next:
# skips one step only

# Example with break:
#
# Stop when you find a failing score.

# Example with next:
#
# Ignore failing scores, but continue checking the rest.


############################################################
# 23. Nested Loops
############################################################

# A nested loop is a loop inside another loop.

# We often use nested loops with matrices.

m <- matrix(
  1:9,
  nrow = 3,
  byrow = TRUE
)

m

# This matrix has:
#
# 3 rows
# 3 columns

nrow(m)
ncol(m)

# To access one value:

m[1, 1]
m[1, 2]
m[2, 1]

# m[row, column]


############################################################
# 24. Nested Loop Example
############################################################

for(i in 1:nrow(m)) {
  
  for(j in 1:ncol(m)) {
    
    print(
      paste(
        "Row:",
        i,
        "Column:",
        j,
        "Value:",
        m[i, j]
      )
    )
    
  }
  
}

# Explanation:
#
# Outer loop:
# controls the row number.
#
# Inner loop:
# controls the column number.
#
# m[i, j]:
# extracts the value from row i and column j.


############################################################
# 25. Real-Life Example
############################################################

daily_views <- c(120, 80, 150, 60, 200, 90, 170)

for(views in daily_views) {
  
  if(views >= 150) {
    
    print(
      paste(views, "- High engagement")
    )
    
  } else if(views >= 100) {
    
    print(
      paste(views, "- Medium engagement")
    )
    
  } else {
    
    print(
      paste(views, "- Low engagement")
    )
    
  }
  
}


############################################################
# 26. Common Beginner Mistakes
############################################################

# Mistake 1:
# Forgetting curly braces

# This works only for one line,
# but it is not a good habit for beginners.

for(i in 1:5)
  print(i)

# Better:

for(i in 1:5) {
  
  print(i)
  
}


# Mistake 2:
# Confusing the loop variable with the vector name

names <- c("Ahmed", "Sara", "Lina")

for(name in names) {
  
  print(name)
  
}

# names is the full vector.
# name is one value at a time.


# Mistake 3:
# Using length() when looping through data frame rows

length(students)

# Better:

nrow(students)


# Mistake 4:
# Typing variable names incorrectly

stud_score <- 90

# This is different:
#
# stud_scor

# R is strict.
# Small spelling differences matter.


############################################################
# 27. Practice Questions
############################################################

# Exercise 1:
#
# Create this vector:
#
# numbers <- c(1, 2, 3, 4, 5)
#
# Use a for loop to print each number.


# Exercise 2:
#
# Use a for loop to print each number multiplied by 10.


# Exercise 3:
#
# Create this vector:
#
# temps <- c(18, 22, 30, 15, 27)
#
# Print only temperatures greater than 20.


# Exercise 4:
#
# Create this vector:
#
# scores <- c(90, 75, 40, 88, 55)
#
# Print "Pass" if the score is 60 or above.
# Otherwise print "Fail".


# Exercise 5:
#
# Print the score and the result together.
#
# Example:
# "90 - Pass"
# "40 - Fail"


# Exercise 6:
#
# Use break to stop the loop
# when the first score below 60 appears.


# Exercise 7:
#
# Use next to skip scores below 60.
# Print only passing scores.


# Exercise 8:
#
# Create a data frame with:
#
# - student names
# - student scores
#
# Use a for loop to print:
#
# name, score, and result


# Exercise 9:
#
# Create this matrix:
#
# matrix(1:9, nrow = 3, byrow = TRUE)
#
# Use nested loops to print all values.


# Exercise 10:
#
# Use nested loops to print:
#
# row number
# column number
# matrix value


############################################################
# 28. Mini Challenge
############################################################

# You have the following data:

students2 <- data.frame(
  name = c("Adam", "Nora", "Zain", "Rama", "Khaled"),
  score = c(55, 92, 77, 40, 85)
)

students2

# Task:
#
# Write a for loop that prints:
#
# - student name
# - student score
# - "Excellent" if score >= 90
# - "Pass" if score >= 60 and less than 90
# - "Fail" if score < 60


############################################################
# 29. Key Message
############################################################

# The most important idea:
#
# A for loop takes one value at a time,
# runs the code,
# then moves to the next value.

# Basic pattern:

# for(one_value in many_values) {
#
#   do something with one_value
#
# }

# If you understand this pattern,
# you understand the foundation of for loops.
############################################################