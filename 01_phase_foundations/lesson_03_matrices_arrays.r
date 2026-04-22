
############################################################
# Lesson 03: Matrices and Arrays in R
# Course: R for Beginners – From Zero to Data-Driven Analysis
#Date: 18.04.2026
# Goal:
# This lesson introduces matrices and arrays in R.
# Students will learn how to create, inspect, manipulate,
# subset, and combine matrices, and how to work with
# three-dimensional arrays.
############################################################

############################################################
# Quick Review from Lesson 2 (Vectors)
############################################################

# In the previous lesson, we learned vectors.
# Before moving to matrices, let us review some important basics.

# Create a simple vector
x <- c(10, 20, 30, 40, 50)
x

# Basic functions
length(x)   # number of elements
sum(x)      # sum of elements
mean(x)     # average value

# Simple indexing (accessing elements)

x[1]        # first element
x[3]        # third element

x[2:4]      # elements from position 2 to 4

# Important:
# R starts counting from 1 (not 0)

# Logical indexing
x[x > 25]   # elements greater than 25
#####################################################


############################################################
# 1. Learning Objectives
############################################################

# By the end of this lesson, you should be able to:
# 1. Create matrices using matrix()
# 2. Combine data using cbind() and rbind()
# 3. Inspect dimensions with dim(), nrow(), and ncol()
# 4. Apply common functions to matrices
# 5. Distinguish element-wise operations from matrix multiplication
# 6. Extract subsets using [row, column] indexing
# 7. Work with three-dimensional arrays using array()


############################################################
# 2. Creating Matrices with matrix()
############################################################

# A matrix in R is a two-dimensional object:
# - rows
# - columns
#
# All values in a matrix must be of the same basic type.

# Example: create a matrix from the numbers 1 to 12
A <- matrix(1:12, ncol = 4)
A

# Explanation:
# - 1:12 creates the vector 1, 2, 3, ..., 12
# - ncol = 4 tells R to arrange the values into 4 columns
# - By default, R fills the matrix column by column


############################################################
# 3. Inspecting Matrix Dimensions
############################################################

dim(A)       # returns c(number of rows, number of columns)
dim(A)[2]    # extracts the number of columns
nrow(A)      # number of rows
ncol(A)      # number of columns

# How to read the output:
# - dim(A) returns two values:
#   first  = number of rows
#   second = number of columns


############################################################
# 4. Applying Functions to Matrices
############################################################

log(A)       # natural logarithm applied to each element
sum(A)       # sum of all elements in the matrix
mean(A)      # mean of all elements in the matrix

# Key idea:
# - log(A) works element by element
# - sum(A) and mean(A) reduce the whole matrix to one number


############################################################
# 5. Filling a Matrix by Rows
############################################################

# By default, matrix() fills values by columns.
# To fill by rows, use byrow = TRUE.

AA <- matrix(1:12, nrow = 3, byrow = TRUE)
AA

# Explanation:
# - nrow = 3 means the matrix must have 3 rows
# - Since we provide 12 values, R calculates the number of columns automatically
# - 12 values / 3 rows = 4 columns


############################################################
# 6. Creating Another Matrix
############################################################

# Good practice:
# make sure the number of values fits the dimensions exactly

B <- matrix(-5:3, ncol = 3)
B

# Here:
# - -5:3 gives 9 values
# - ncol = 3
# - so the matrix has 3 rows and 3 columns


############################################################
# 7. Transpose of a Matrix
############################################################

t(B)

# The transpose swaps rows and columns:
# - rows become columns
# - columns become rows


############################################################
# 8. Variance and Correlation
############################################################

var(B)   # covariance matrix
cor(B)   # correlation matrix

# Important:
# When var() or cor() is applied to a matrix, R assumes:
# - columns are variables
# - rows are observations
#
# In var(B):
# - diagonal values are variances of each column
#
# In cor(B):
# - values range from -1 to 1


############################################################
# 9. Diagonal Matrix with diag()
############################################################

diag(6)

# This creates a 6 x 6 identity matrix:
# - 1 on the diagonal
# - 0 elsewhere


############################################################
# 10. Operations Between Matrices
############################################################

# Important distinction:
# - +  is element-wise addition
# - *  is element-wise multiplication
# - %*% is matrix multiplication

dim(A)
dim(AA)
dim(B)
dim(t(B))


############################################################
# 10.1 Element-wise Addition
############################################################

A + AA

# This works because A and AA have the same dimensions


############################################################
# 10.2 Element-wise Multiplication
############################################################

A * AA

# This multiplies each element in A
# by the corresponding element in AA

# If dimensions do not match, R gives an error
# Example:
# A * B


############################################################
# 10.3 Element-wise Multiplication After Transpose
############################################################

dim(A)
dim(t(B))

# If dimensions match, element-wise multiplication works
# Example:
# A * t(B)

# Important:
# * is still element-wise multiplication
# It is NOT true matrix multiplication


############################################################
# 10.4 Matrix Multiplication
############################################################

# For matrix multiplication:
# If matrix X is m x n
# and matrix Y is n x k
# then X %*% Y is defined
# and the result will be m x k

# Create a compatible matrix
C <- matrix(1:8, nrow = 4, ncol = 2)
C
dim(C)

# A is 3 x 4
dim(A)

# Matrix multiplication
A %*% C

# Result dimensions:
dim(A %*% C)

# Explanation:
# - A is 3 x 4
# - C is 4 x 2
# - inner dimensions match (4 and 4)
# - result is 3 x 2


############################################################
# 11. Subsetting Matrices
############################################################

# General form:
# matrix[row, column]

A[2, 3]           # row 2, column 3
A[, 1]            # all rows, column 1
B[1:2, ]          # rows 1 and 2, all columns
A[c(1, 3), 2:3]   # rows 1 and 3, columns 2 and 3

# Mental trick:
# - blank before comma  -> all rows
# - blank after comma   -> all columns


############################################################
# 12. Combining Matrices
############################################################

# cbind() = combine by columns
# Requires same number of rows

# rbind() = combine by rows
# Requires same number of columns

X <- matrix(1:6, nrow = 3)
Y <- matrix(11:16, nrow = 3)

X
Y

cbind(X, Y)
rbind(X, Y)

# If the dimensions do not match, R gives an error


############################################################
# 13. Building a Matrix from Variables with cbind()
############################################################

# A common use in statistics:
# combine vectors of equal length into one matrix

alt <- c(170, 165, 180, 175, 169)
pes <- c(70, 60, 82, 76, 68)

mat <- cbind(alt, pes)
mat

mat[1:5, ]

# Interpretation:
# - each row represents one observation
# - first column = height
# - second column = weight


############################################################
# 14. Three-Dimensional Arrays
############################################################

# When data have more than two dimensions, use array()

D <- array(1:18, dim = c(2, 3, 3))
D

# This means:
# - 2 rows
# - 3 columns
# - 3 layers

# You can think of it as 3 separate matrices,
# each of size 2 x 3


############################################################
# 14.1 Extracting Full Layers
############################################################

D[, , 1]   # first layer
D[, , 2]   # second layer
D[, , 3]   # third layer


############################################################
# 14.2 Extracting Across Layers
############################################################

D[, 3, ]   # third column from all layers
D[2, , ]   # second row from all layers
D[1, , ]   # first row from all layers


############################################################
# 15. Practice Exercises
############################################################

# Exercise 1:
# Create a 4 x 3 matrix with the numbers 1 to 12, filled by rows.

ex1 <- matrix(1:12, nrow = 4, ncol = 3, byrow = TRUE)
ex1

# Exercise 2:
# Compute the sum and the mean of the second column of A.

A[, 2]
sum(A[, 2])
mean(A[, 2])

# Exercise 3:
# Use dim() to check when matrix multiplication is defined.

dim(A)
dim(B)
dim(t(B))
dim(C)

A %*% C      # works

# Try these and observe what happens:
# A %*% B
# A %*% t(B)

# Exercise 4:
# In array D, extract the first row from all layers.

D[1, , ]


############################################################
# 16. End of Lesson
############################################################

# In this lesson, you learned how to:
# - create matrices
# - inspect their dimensions
# - apply functions to matrices
# - distinguish element-wise from matrix multiplication
# - subset matrices
# - combine matrices
# - work with 3D arrays
#
# Next lesson:
# Data frames and working with real tabular data
############################################################


############################################################
# Why are we learning matrices and arrays?
#
# In the previous lesson, we learned vectors (a simple list of values).
# But in real-world data, information is usually more structured.
#
# Most data are organized as:
# - rows (observations)
# - columns (variables)
# - and sometimes layers (time, depth, scenarios)
#
# That is why we now learn:
#
# Vector  → a simple list
# Matrix  → a table (rows and columns)
# Array   → multiple tables stacked together (3D or more)
#
# Why is this important?
#
# Because many real datasets use this structure, for example:
# - Climate data (temperature across locations)
# - Soil measurements (depth × variables)
# - Images (pixels arranged in a grid)
#
# Important example (for this course):
# - Raster data (maps, satellite images) are actually matrices
# - Each pixel = one value (e.g. soil moisture, NDVI)
#
# If we add time (e.g. daily maps):
# - we get a 3D structure → an array
#
# Understanding matrices and arrays helps you:
# - work with spatial data (maps)
# - understand models and simulations
# - prepare for machine learning and real data analysis
#
# Key idea:
# "Before analyzing data, we must understand its structure."
############################################################