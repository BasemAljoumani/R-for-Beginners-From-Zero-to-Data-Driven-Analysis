# Mini Assessment – Official Solution

# R for Beginners – From Zero to Data-Driven Analysis

# Module 1 (Lessons 1–6)

# Instructor: Dr. Basem Aljoumani

############################################################

# Initial Data

############################################################

city <- c("Berlin", "Paris", "Rome", "Madrid", "Tunis")

temperature <- c(18, 22, 27, 30, 35)

rain <- c(5, 2, 0, 1, 0)

soil_moisture <- c(0.25, 0.22, 0.15, 0.12, 0.08)

############################################################

# Part 1: Variables and Basic Calculations

############################################################

x <- 12
y <- 4

x + y
x * y
x / y
x^2

############################################################

# Part 2: Data Types and Vectors

############################################################

# Q2

class(city)
class(temperature)
class(soil_moisture)

# Q3

names(temperature) <- city
temperature

############################################################

# Part 3: Vector Filtering and Logical Thinking

############################################################

# Which cities have temperature greater than 25?

city[temperature > 25]

# Which soil moisture values are less than 0.20?

soil_moisture[soil_moisture < 0.20]

# Which cities have no rain?

city[rain == 0]

############################################################

# Part 3B: Matrix Challenge

############################################################

A <- matrix(1:12, nrow = 3)

# Dimensions

dim(A)

# Second row

A[2, ]

# First column

A[, 1]

############################################################

# Part 4: Data Frames

############################################################

# Q5

env_data <- data.frame(
  city,
  temperature,
  rain,
  soil_moisture
)

env_data

# Q6

head(env_data)

str(env_data)

nrow(env_data)

############################################################

# Part 5: Filtering a Data Frame

############################################################

# Temperature greater than 25

env_data[env_data$temperature > 25, ]

# Rain equal to 0

env_data[env_data$rain == 0, ]

# Temperature greater than 25

# and soil moisture less than 0.20

env_data[
  env_data$temperature > 25 &
    env_data$soil_moisture < 0.20,
]

############################################################

# Part 6: Simple Decision Rule with if / else

############################################################

sm <- 0.12

if (sm < 0.15) {
  print("Soil is dry")
} else {
  print("Soil moisture is acceptable")
}

############################################################

# Bonus Question

############################################################

env_data$water_stress <- env_data$soil_moisture < 0.15

env_data

############################################################

# End of Solution

############################################################





