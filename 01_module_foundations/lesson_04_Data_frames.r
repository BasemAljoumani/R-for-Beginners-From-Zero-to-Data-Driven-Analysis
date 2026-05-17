
############################################################
# Lesson 04: Data Frames in R
# Course: R for Beginners – From Zero to Data-Driven Analysis
#Dr. Basem Aljoumani - 25-04-2026
#
# Goal:
# This lesson introduces data frames, the most important
# structure for working with real-world data in R.
############################################################


############################################################
# 1. Learning Objectives
############################################################

# By the end of this lesson, you should be able to:
# - understand what a data frame is
# - create a data frame using data.frame()
# - inspect its structure
# - access rows, columns, and individual values
# - use head() and tail() to preview datasets
# - filter rows using logical conditions
# - add and modify columns
# - apply basic functions to columns


############################################################
# 2. What is a Data Frame?
############################################################

# A data frame is like an Excel table in R.
#
# - rows    = observations (e.g. people, days, cities)
# - columns = variables (e.g. age, temperature, rainfall)
#
# Unlike a matrix:
# - a data frame can contain different data types
# - one column can be numeric
# - another can be character
# - another can be logical

# As a beginner, think of it as:
# "A table for storing real-world data in R"


############################################################
# 3. Creating a Simple Data Frame
############################################################

df <- data.frame(
  name = c("Kosi", "Tim", "Hatim"),
  age = c(25, 30, 28),
  height = c(170, 165, 180)
)

df

# Each column is a vector
# All columns must have the same length


############################################################
# 4. Inspecting a Data Frame
############################################################

class(df)     # object type
dim(df)       # rows and columns
nrow(df)      # number of rows
ncol(df)      # number of columns

names(df)     # column names
str(df)       # structure (very important)
head(df)      # first rows
tail(df)      # last rows

# Note:
# str() shows:
# - variable names
# - variable types
# - number of observations


############################################################
# 5. Accessing Columns
############################################################

df$age           # most common
df[["age"]]      # alternative
df[, "age"]      # indexing

# All return the same column


############################################################
# 6. Accessing Rows
############################################################

df[1, ]          # first row
df[1:2, ]        # first two rows

# Empty column position means:
# "show all columns"


############################################################
# 7. Accessing Individual Values
############################################################

df[2, 3]         # row 2, column 3


############################################################
# 8. Filtering Rows
############################################################

df[df$age > 25, ]

# Explanation:
# condition creates TRUE/FALSE
# only TRUE rows are returned


############################################################
# 9. Adding a New Column
############################################################

df$weight <- c(70, 60, 80)
df


############################################################
# 10. Modifying a Column
############################################################

df$age <- df$age + 1
df


############################################################
# 11. Applying Functions to Columns
############################################################

mean(df$age)
sum(df$height)
length(df$name)

# Each column is a vector → we can use vector functions

# Calculate Mass Body Index
df$bmi <- df$weight / (df$height/100)^2

############################################################
# 12. Environmental Example
############################################################

df_env <- data.frame(
  day = 1:5,
  soil_moisture = c(0.20, 0.18, 0.15, 0.22, 0.25),
  temperature = c(25, 27, 30, 28, 26)
)

df_env

str(df_env)
df_env$soil_moisture
mean(df_env$temperature)

# Filter
df_env[df_env$temperature > 26, ]


############################################################
# 13. Larger Dataset Example
############################################################

df_practice <- data.frame(
  city = c("Berlin", "Paris", "Rome", "Madrid", "Vienna",
           "Prague", "Lisbon", "Athens", "Dublin", "Warsaw",
           "Budapest", "Brussels", "Amsterdam", "Copenhagen", "Stockholm"),
  
  temp = c(18, 22, 25, 27, 20,
           19, 24, 28, 17, 21,
           23, 20, 19, 18, 16),
  
  rain = c(5, 2, 0, 1, 3,
           4, 0, 0, 6, 2,
           1, 3, 5, 4, 6)
)

df_practice

head(df_practice)
tail(df_practice)
str(df_practice)
dim(df_practice)


############################################################
# 14. Accessing Data
############################################################

# Columns
df_practice$temp
df_practice$rain

# Rows
df_practice[1, ]
df_practice[3:7, ]

# Single value
df_practice[5, 2]

# Multiple columns
df_practice[, c("city", "temp")]

# Rows + columns
df_practice[1:5, c("city", "rain")]


############################################################
# 15. Filtering Data
############################################################

df_practice[df_practice$temp > 22, ]
df_practice[df_practice$rain == 0, ]
df_practice[df_practice$temp < 20, ]

# Multiple conditions
df_practice[df_practice$temp > 20 & df_practice$rain < 3, ]

# Greater or equal
df_practice[df_practice$temp >= 25, ]

# Filter by text
df_practice[df_practice$city == "Berlin", ]

# Not equal
df_practice[df_practice$rain != 0, ]


############################################################
# 16. Adding and Modifying Columns
############################################################

df_practice$hot_day <- df_practice$temp > 25
df_practice

df_practice$temp_f <- df_practice$temp * 9/5 + 32
df_practice

# Important: do NOT overwrite original data for teaching
df_practice$rain_plus1 <- df_practice$rain + 1
df_practice


############################################################
# 17. Summary Calculations
############################################################

mean(df_practice$temp)
sum(df_practice$rain)
length(df_practice$city)

max(df_practice$temp)
min(df_practice$temp)


############################################################
# 18. Practice Exercises
############################################################

# 1
df_practice$temp

# 2
df_practice$rain

# 3
df_practice[1, ]

# 4
df_practice[3:7, ]

# 5
df_practice[5, "temp"]

# 6
df_practice[, c("city", "temp")]

# 7
df_practice[df_practice$temp > 22, ]

# 8
df_practice[df_practice$rain == 0, ]

# 9
df_practice[df_practice$temp < 20, ]

# 10
df_practice[df_practice$temp > 20 & df_practice$rain < 3, ]


############################################################
# 19. Additional Tasks
############################################################

# Highest temperature
df_practice[df_practice$temp == max(df_practice$temp), ]

# No rain
df_practice[df_practice$rain == 0, ]

# Count cities with temp >= 25
nrow(df_practice[df_practice$temp >= 25, ])

# Add cold_day column
df_practice$cold_day <- df_practice$temp < 18
df_practice


############################################################
# 20. Important Note
############################################################

# Data frame = table
# Each column = vector

# Column names are case-sensitive:
# temp != Temp


############################################################
# 21. End of Lesson
############################################################

# You learned:
# - create data frames
# - inspect them
# - access data
# - filter rows
# - modify and add columns
# - apply functions

# Data frames are the foundation of data analysis in R.

# Next lesson:
#  Logical Thinking in R
############################################################