############################################################
# Lesson 09: Functions in R
# Module 1: Foundations of R Programming
#
# Course: R for Beginners: From Zero to Data-Driven Analysis
#
# Goal:
# - Understand what functions are
# - Use built-in functions in R
# - Create simple user-defined functions
# - Apply functions to numbers, vectors, and simple data
############################################################


############################################################
# 1. What is a function?
############################################################

# A function is a tool that performs a specific task.
# We # give the function an input, and it gives us an output.

# General structure:
# function_name(input)

sqrt(16)
sqrt(25)

abs(-10)
round(3.76)


############################################################
# 2. Built-in functions in R
############################################################

temperature <- c(18, 22, 25, 30, 35)

mean(temperature)
min(temperature)
max(temperature)
sum(temperature)
length(temperature)


############################################################
# 3. Functions with missing values
############################################################

rain <- c(0, 2, NA, 5, 1)

mean(rain)

# To ignore missing values, we use na.rm = TRUE

mean(rain, na.rm = TRUE)
sum(rain, na.rm = TRUE)


############################################################
# 4. Functions with data frames
############################################################

weather <- data.frame(
  city = c("Berlin", "Paris", "Rome", "Madrid", "Tunis"),
  temperature = c(18, 22, 27, 30, 35),
  rain = c(5, 2, 0, 1, 0),
  soil_moisture = c(0.25, 0.22, 0.15, 0.12, 0.08)
)

weather

head(weather)
str(weather)
summary(weather)
nrow(weather)
ncol(weather)
names(weather)


############################################################
# 5. Functions on data frame columns
############################################################

mean(weather$temperature)
max(weather$temperature)
min(weather$soil_moisture)
sum(weather$rain)


############################################################
# 6. Functions with logical conditions
############################################################

weather$temperature > 25

weather[weather$temperature > 25, ]

sum(weather$temperature > 25)


############################################################
# 7. Why do we create our own functions?
############################################################

# Sometimes we repeat the same calculation many times.
# Instead of rewriting the same code, we create a function.

# Functions help us:
# - organize code
# - save time
# - avoid repetition
# - reuse calculations


############################################################
# 8. General structure of a user-defined function
############################################################

# function_name <- function(input){
#   
#   code
#   
# }


############################################################
# 9. First simple function
############################################################

say_hello <- function(){
  
  print("Hello student")
  
}

say_hello()


############################################################
# 10. Function with one input
############################################################

square_number <- function(x){
  
  x^2
  
}

square_number(4)
square_number(10)
square_number(2)


############################################################
# 11. Save the result from a function
############################################################

result <- square_number(5)

result


############################################################
# 12. Function with two inputs
############################################################

add_numbers <- function(x, y){
  
  x + y
  
}

add_numbers(5, 3)
add_numbers(10, 7)


############################################################
# 13. Environmental example: mean temperature
############################################################

calculate_mean_temp <- function(temp_vector){
  
  mean(temp_vector)
  
}

temperature <- c(18, 20, 25, 30, 22)

calculate_mean_temp(temperature)


############################################################
# 14. Unit conversion function
############################################################

# Convert Celsius to Kelvin

celsius_to_kelvin <- function(temp_c){
  
  temp_c + 273.15
  
}

celsius_to_kelvin(20)
celsius_to_kelvin(35)


############################################################
# 15. Function with if / else
############################################################

check_temperature <- function(temp){
  
  if(temp > 30){
    
    print("Hot day")
    
  } else {
    
    print("Normal day")
    
  }
  
}

check_temperature(35)
check_temperature(20)


############################################################
# 16. Function with return()
############################################################

temperature_summary <- function(temp){
  
  result <- c(
    mean_value = mean(temp),
    minimum = min(temp),
    maximum = max(temp)
  )
  
  return(result)
  
}

temperature <- c(18, 22, 27, 30, 35)

temperature_summary(temperature)


############################################################
# 17. Safe mean function with missing values
############################################################

safe_mean <- function(x){
  
  mean(x, na.rm = TRUE)
  
}

rain <- c(0, 2, NA, 5, 1)

safe_mean(rain)


############################################################
# 18. Function to calculate total ET
############################################################

calculate_ET <- function(et_values){
  
  sum(et_values, na.rm = TRUE)
  
}

ET <- c(0.2, 0.3, 0.4, 0.1)

calculate_ET(ET)


############################################################
# 19. Function to check rainfall
############################################################

check_rain <- function(rain){
  
  if(rain > 0){
    
    print("Rain detected")
    
  } else {
    
    print("No rain")
    
  }
  
}

check_rain(5)
check_rain(0)


############################################################
# 20. Function to evaluate student score
############################################################

score_eval <- function(score){
  
  if(score >= 90){
    
    print("Excellent")
    
  } else if(score >= 80){
    
    print("Very good")
    
  } else if(score >= 70){
    
    print("Good")
    
  } else if(score >= 60){
    
    print("Pass")
    
  } else {
    
    print("Fail")
    
  }
  
}

score_eval(95)
score_eval(82)
score_eval(74)
score_eval(58)


############################################################
# 21. Common beginner mistakes
############################################################

# Mistake 1: Forgetting parentheses

# Wrong:
# square_number

# Correct:
square_number(5)


# Mistake 2: Forgetting commas

# Wrong:
# add_numbers(5 3)

# Correct:
add_numbers(5, 3)


# Mistake 3: Using a variable that is not defined

# Wrong:
# my_fun <- function(x){
#   y + 2
# }

# Correct:
my_fun <- function(x){
  
  x + 2
  
}

my_fun(5)


############################################################
# 22. Practice tasks
############################################################

# Task 1:
# Create a function called calculate_area
# that calculates length * width

calculate_area <- function(length, width){
  
  length * width
  
}

calculate_area(5, 4)


# Task 2:
# Create a function called calculate_average_soil_moisture
# that calculates the average soil moisture

calculate_average_soil_moisture <- function(soil_moisture){
  
  mean(soil_moisture, na.rm = TRUE)
  
}

soil_moisture <- c(0.12, 0.18, 0.22, 0.25, 0.30)

calculate_average_soil_moisture(soil_moisture)


# Task 3:
# Create a function called check_soil_moisture
# If soil moisture is lower than 0.15, print "Dry soil"
# Otherwise, print "Soil moisture is acceptable"

check_soil_moisture <- function(sm){
  
  if(sm < 0.15){
    
    print("Dry soil")
    
  } else {
    
    print("Soil moisture is acceptable")
    
  }
  
}

check_soil_moisture(0.10)
check_soil_moisture(0.22)


############################################################
# End of Lesson 09
############################################################