
############################################################
# Lesson 07: While Loops in R
# Course: R for Beginners  From Zero to Data-Driven Analysis
#
# Goal:
# Learn how to repeat code automatically using while loops.
############################################################


############################################################
# 1. Learning Objectives
############################################################

# By the end of this lesson, you should be able to:
# - understand the idea of repetition in programming
# - write basic while loops
# - understand how conditions control loops
# - update variables inside loops
# - avoid infinite loops
# - use break to stop a loop early
# - trace loop execution step by step


############################################################
# 2. Why Do We Need Loops?
############################################################

# Suppose we want R to print numbers from 1 to 5.

print(1)
print(2)
print(3)
print(4)
print(5)

# This works, but it is repetitive.
# Imagine printing numbers from 1 to 1000!

# Loops help us repeat code automatically.


############################################################
# 3. What is a While Loop?
############################################################

# A while loop repeats code
# AS LONG AS a condition is TRUE.

# General structure:

# while(condition){
#
#   code to repeat
#
# }


############################################################
# 4. First While Loop Example
############################################################

# Example:
# Print numbers from 1 to 5

ctr <- 1

while(ctr <= 5){
  
  print(ctr)
  
  ctr <- ctr + 1
  
}


############################################################
# 5. Understanding the Loop Step by Step
############################################################

# Step 1:
# ctr starts at 1

ctr <- 1

# Step 2:
# R checks the condition

ctr <= 5

# 1 <= 5 is TRUE
# so the loop starts

# Step 3:
# R prints the current value of ctr

print(ctr)

# Step 4:
# Increase ctr by 1

ctr <- ctr + 1

# ctr is now 2

# R goes back and checks the condition again.

# This continues until:

# ctr becomes 6

# Then:

6 <= 5

# is FALSE

# The loop stops.


############################################################
# 6. Very Important Concept
############################################################

# Every while loop needs THREE things:

# 1. Starting value
# 2. Condition
# 3. Update step

# Example:

ctr <- 1          # starting value

while(ctr <= 5){  # condition
  
  print(ctr)
  
  ctr <- ctr + 1  # update step
  
}


############################################################
# 7. Infinite Loops
############################################################

# WARNING:
# If you forget to update the variable,
# the loop may never stop.

# Example of an infinite loop:

# ctr <- 1
#
# while(ctr <= 5){
#
#   print(ctr)
#
# }

# ctr never changes.
# The condition always stays TRUE.

# This creates an infinite loop.


############################################################
# 8. Another Example
############################################################

# Example:
# Count down from 10 to 1

n <- 10

while(n >= 1){
  
  print(n)
  
  n <- n - 1
  
}


############################################################
# 9. Real-Life Example
############################################################

# Example:
# Reduce car speed gradually

speed <- 80

while(speed > 30){
  
  print(paste("Current speed:", speed))
  
  speed <- speed - 10
  
}

# The loop stops once speed is 30 or less.


############################################################
# 10. Using break
############################################################

# Sometimes we want to stop a loop early.

# The break statement immediately stops the loop.

# Example:

ctr <- 1

while(ctr <= 10){
  
  print(ctr)
  
  if(ctr == 5){
    
    break
    
  }
  
  ctr <- ctr + 1
  
}

# The loop stops when ctr reaches 5.


############################################################
# 11. Example with break
############################################################

# Example:
# Stop when a number becomes divisible by 4

x <- 1

while(x <= 20){
  
  print(x)
  
  if(x %% 4 == 0){
    
    break
    
  }
  
  x <- x + 1
  
}

# %% means remainder (modulus operator)


############################################################
# 12. Combining while and if
############################################################

# We can place if statements inside loops.

temperature <- 35

while(temperature > 20){
  
  print(paste("Temperature:", temperature))
  
  if(temperature > 30){
    
    print("Very hot!")
    
  }
  
  temperature <- temperature - 5
  
}


############################################################
# 13. Common Beginner Mistakes
############################################################

# Mistake 1:
# Forgetting to update the variable

# Mistake 2:
# Wrong condition

# Example:
# x starts at 1

x <- 1

while(x > 5){
  
  print(x)
  
  x <- x + 1
  
}

# The loop never runs because:
# 1 > 5 is FALSE


############################################################
# 14. Practice Exercises
############################################################

# Exercise 1:
# Print numbers from 1 to 20 using a while loop.


# Exercise 2:
# Print even numbers from 2 to 20.


# Exercise 3:
# Start from 100 and decrease by 15
# until the number becomes 0 or negative.


# Exercise 4:
# Create a while loop that stops at 7 using break.


############################################################
# 15. Challenge Exercise
############################################################

# Print multiples of 3.
# Stop the loop once the number becomes divisible by 8.

# Hint:
# Use:
# %% for divisibility
# break to stop the loop


############################################################
# 16. Final Summary
############################################################

# A while loop repeats code
# while a condition is TRUE.

# A good while loop needs:
# - starting value
# - condition
# - update step

# Without the update step,
# the loop may never stop.

# break allows us to stop a loop early.


############################################################
# End of Lesson 07
############################################################