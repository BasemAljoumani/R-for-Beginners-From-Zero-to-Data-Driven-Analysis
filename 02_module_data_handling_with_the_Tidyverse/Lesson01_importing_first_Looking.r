
############################################################
# Lesson 01: Importing Data and First Look at a Dataset
# Module 2: Data Handling with the Tidyverse
# Course: R for Beginners — From Zero to Data-Driven Analysis
# Dr. Basem Aljoumani
# Date: 9.8. 2026

# Dataset: EC_teaching
# Urban Climate Flux Tower , Berlin, Germany, 2019
# 8,759 rows x 12 columns 
#

# Goal:
# Learn how to import data from different file formats
# and explore a new dataset systematically.
############################################################


############################################################
# 1. Learning Objectives
############################################################

# By the end of this lesson, you should be able to:
# - install and load packages in R
# - import data from CSV, Excel, TXT, SPSS, Stata, and RDS
# - understand the difference between read_csv() and read.csv()
# - fix the Excel date serial number problem
# - apply a six-command arrival checklist to any new dataset
# - describe all 12 variables in EC_teaching
# - detect and interpret missing values across a dataset


############################################################
# 2. Setup — Install and Load Packages
############################################################

# Install packages — only once per machine
install.packages("tidyverse")   # core ecosystem: readr, dplyr, tidyr, ggplot2
install.packages("readxl")      # for Excel files
install.packages("haven")       # for SPSS, Stata, SAS files
install.packages("lubridate")   # for working with dates and times

# Load packages — run at the start of every session
library(tidyverse)
library(readxl)
library(haven)
library(lubridate)

# Note:
# install.packages() is like installing an app — do it once.
# library() is like opening the app — do it every session.


############################################################
# 3. How to Load the Dataset
############################################################

# Option A — load directly from GitHub (recommended for students)
url_github <- "https://raw.githubusercontent.com/BasemAljoumani/R-for-Beginners-From-Zero-to-Data-Driven-Analysis/main/02_module_data_handling_with_the_Tidyverse/data/EC_teaching.csv"

ec <- read.csv(url_github)
df <- read_csv(url_github)

# Option B — load from your local folder
# df <- read_csv("data/EC_teaching.csv")

# Option C — load RDS version (best for R-to-R sharing)
# df <- readRDS("data/EC_teaching.rds")

# Quick check after loading
dim(df)     # number of rows and columns
names(df)   # column names


############################################################
# 4. Importing Data — All Formats
############################################################

# We use EC_teaching saved in six different formats.
# The goal: same data, slightly different import code.
# After each import — always run dim() and names() to verify.


# ----------------------------------------------------------
# 4.1 CSV — Comma-Separated Values
# ----------------------------------------------------------

# The most universal data exchange format
df_csv <- read_csv("data/EC_teaching.csv")

dim(df_csv)    # should be 8759 rows, 12 columns
names(df_csv)  # check column names arrived correctly

# Important difference:
# read_csv()  — from tidyverse — faster, produces tibble,
#               detects types automatically (USE THIS)
# read.csv()  — from base R  — slower, produces data.frame,
#               may convert text to factors (AVOID)


# ----------------------------------------------------------
# 4.2 TXT — Tab-Separated Text
# ----------------------------------------------------------

# Text files use a delimiter character between values
df_txt <- read_delim("EC_teaching.txt", delim = "\t")

dim(df_txt)

# read_delim() works with any delimiter:
# "\t"  = Tab
# ";"   = Semicolon
# "|"   = Pipe


# ----------------------------------------------------------
# 4.3 Excel (.xlsx)
# ----------------------------------------------------------

# Most common format in offices and research groups
# WARNING: Excel stores dates as numbers — see Section 5
df_xlsx <- read_excel("EC_teaching.xlsx")

dim(df_xlsx)

# Useful options:
df_xlsx <- read_excel("EC_teaching.xlsx", sheet = "Sheet1")
df_xlsx <- read_excel("EC_teaching.xlsx", sheet = 1)
df_xlsx <- read_excel("EC_teaching.xlsx", range = "A1:F100")

# Check all sheet names first
excel_sheets("EC_teaching.xlsx")


# ----------------------------------------------------------
# 4.4 SPSS (.sav)
# ----------------------------------------------------------

# Common in social sciences, medicine, and psychology
df_sav <- read_spss("EC_teaching.sav")

dim(df_sav)
glimpse(df_sav)


# ----------------------------------------------------------
# 4.5 Stata (.dta)
# ----------------------------------------------------------

# Common in economics and political science
df_dta <- read_stata("data/EC_teaching.dta")

dim(df_dta)


# ----------------------------------------------------------
# 4.6 RDS — R Native Format (recommended)
# ----------------------------------------------------------

# The best format for R-to-R data sharing
# Preserves all column types — no conversion needed
df <- readRDS("data/EC_teaching.rds")

dim(df)

# Verify the timestamp loaded as a proper datetime
class(df$timestamp)   # should be: "POSIXct" "POSIXt"

# Why RDS is the best format for this course:
# - smallest file size
# - preserves column types automatically
# - loads in one line with no extra options
# - one object per file, no ambiguity


# ----------------------------------------------------------
# 4.7 Load from a URL (Google Sheets example)
# ----------------------------------------------------------

# Public Google Sheet — no login required
library(googlesheets4)

gs4_deauth()   # skip authentication for public sheets

df_gs <- read_sheet("https://docs.google.com/spreadsheets/d/1AeBCVp87vpj1PNEGvy1sunrGXjpsC6n1SxPzgb1QCLc/edit?gid=1717305497#gid=1717305497")

dim(df_gs)


# ----------------------------------------------------------
# 4.8 Built-in Datasets Inside R
# ----------------------------------------------------------

# R comes with many built-in datasets for practice
data()                                     # see all available datasets
data(iris)                                 # load iris
data(mtcars)                               # load mtcars
data(gapminder, package = "gapminder")     # from an external package

help("iris")      # documentation for iris



############################################################
# 5. The Excel Date Problem
############################################################

# Excel stores dates as numbers — days since 1 January 1900.
# When you import an Excel file, the timestamp may look like:
# 43466  instead of  "2019-01-01"

# Step 1: import and observe the problem
df_xlsx <- read_excel("EC_teaching.xlsx")
df_xlsx$timestamp[1]   # shows a number like 43466 — not a date

# Step 2: apply the fix
df_xlsx <- df_xlsx |>
  mutate(timestamp = as.POSIXct(timestamp * 86400,
                                origin = "1899-12-30",
                                tz     = "UTC"))

# Step 3: verify the fix worked
df_xlsx$timestamp[1:3]
# should now show "2019-01-01 00:00:00"

# Rule: always check the timestamp column after importing Excel.
# If you see a 5-digit number — apply this fix.


############################################################
# 6. Tibble vs Data Frame
############################################################

# A tibble is the tidyverse version of a data frame.
# Same idea — stores data in rows and columns — but smarter.

# Create a data frame
dff <- data.frame(
  name  = c("Alice", "Bob", "Carol"),
  age   = c(25, 30, 22),
  score = c(88.5, 92.0, 76.3)
)

# Create a tibble — same structure, different class
tb <- tibble(
  name  = c("Alice", "Bob", "Carol"),
  age   = c(25, 30, 22),
  score = c(88.5, 92.0, 76.3)
)

# Printing difference:
dff   # prints all rows, no type information
tb    # prints max 10 rows, shows column types

# Subsetting difference:
dff[ , "age"]    # drops to a vector — loses structure
tb[ , "age"]     # stays a tibble — keeps structure

# To get a vector from a tibble — be explicit:
tb[["age"]]      # returns a vector
pull(tb, age)    # tidyverse way — clearest intention

# Partial name matching:
dff$na   # returns the "name" column — silent and risky
tb$na    # returns NULL with a warning — safer

# Convert between the two:
as_tibble(dff)     # data frame to tibble
as.data.frame(tb)  # tibble to data frame


############################################################
# 7. The Pipe Operator
############################################################

# The pipe |> passes the result of one step to the next.
# It reads like plain English: take this, then do that.

# Without pipe , nested and hard to read:
summary(select(filter(df, Ta > 20), Ta, RH, ws))

# With pipe — reads left to right, top to bottom:
df |>
  filter(Ta > 20) |>
  select(Ta, RH, ws) |>
  summary()

# Both produce identical results.
# Always use the pipe in this course.

# Keyboard shortcut: Ctrl + Shift + M (Windows/Linux)
#                    Cmd  + Shift + M (Mac)

# Note: |> is the native R pipe (R 4.1+)
#       %>% is the magrittr pipe from tidyverse
#       They behave identically in almost all cases.


############################################################
# 8. Our Main Dataset — EC_teaching
############################################################

# From here we work only with df (the RDS version).
# to use directly "EC_teaching.rds" from the github:

urlr <- ("https://raw.githubusercontent.com/BasemAljoumani/R-for-Beginners-From-Zero-to-Data-Driven-Analysis/blob/main/02_module_data_handling_with_the_Tidyverse/data/EC_teaching.rds")


df <- readRDS(urlr)


# ----------------------------------------------------------
# 8.1 Size
# ----------------------------------------------------------

dim(df)     # [1] 8759   12
nrow(df)    # 8759 rows = 8759 hours of measurements
ncol(df)    # 12 columns = 12 variables

# A full year should have exactly:
365 * 24    # = 8760 hours

# We have 8759 — one hour is missing somewhere.
8760 - 8759 # = 1

# Which hour is missing?
# Germany changes clocks at the end of March (DST).
# Clocks jump from 2:00 AM to 3:00 AM — one hour disappears.
# We will find the exact timestamp in Lesson 2 using filter().


# ----------------------------------------------------------
# 8.2 Time Coverage
# ----------------------------------------------------------

range(df$timestamp)
# "2019-01-01 00:00:00 UTC"  "2019-12-31 22:00:00 UTC"
# Full year 2019 in Berlin

# Time step between measurements:
diff(df$timestamp[1:3])
# Time differences of 1 hours — confirmed hourly resolution


# ----------------------------------------------------------
# 8.3 Structure
# ----------------------------------------------------------

glimpse(df)

# What to look for in the output:
# - the class at the top: spc_tbl_ [8,759 x 12] — it is a tibble
# - the type of each column: <dttm> for timestamp, <dbl> for numbers
# - the first few values: do they make sense?


# ----------------------------------------------------------
# 8.4 The 12 Variables — Five Groups
# ----------------------------------------------------------

# GROUP 1: Time
# timestamp — date + time, one row per hour (POSIXct)
df$timestamp[1:3]
# [1] "2019-01-01 00:00:00" "2019-01-01 01:00:00" "2019-01-01 02:00:00"


# GROUP 2: Atmosphere
df |> select(Ta, RH, ws, wd) |> summary()

# Ta  = Air Temperature (degrees C)
#       how warm the air is
# RH  = Relative Humidity (%)
#       how saturated the air is with water vapour (100% = fog/rain)
# ws  = Wind Speed (m/s)
#       how fast the air is moving
# wd  = Wind Direction (degrees)
#       where wind comes FROM (0/360 = North, 90 = East, 270 = West)


# GROUP 3: Radiation
df |> select(Rin) |> summary()

# Rin = Incoming Shortwave Radiation (W/m2)
#       solar energy reaching the surface
#       zero at night, peaks around solar noon in summer

# How many hours have zero radiation?
sum(df$Rin == 0, na.rm = TRUE)          # count
sum(df$Rin == 0, na.rm = TRUE) / nrow(df) # proportion (~50%)


# GROUP 4: Water and Energy Fluxes
df |> select(prec_mm, ET_filled, LE.filled) |> summary()

# prec_mm   = Precipitation (mm/hour) — rain and snow
# ET_filled = Evapotranspiration (mm/hour) — water leaving surface
# LE.filled = Latent Heat Flux (W/m2) — energy used to evaporate water
# Note: ".filled" means gaps from instrument failures were estimated

# ET and LE measure the same physical process — different units
# They should be perfectly correlated:
cor(df$ET_filled, df$LE.filled,
    method = "pearson",
    use    = "complete.obs")
# [1] 1 — perfect correlation, same process, different units

# Most hours have no precipitation:
mean(df$prec_mm == 0, na.rm = TRUE)
# approximately 0.87 — 87% of hours are dry


# GROUP 5: Soil and Surface
df |> select(soil_temp10cm, veg_fraction, impervious_fraction) |> summary()

# soil_temp10cm       = Soil temperature at 10cm depth (degrees C)
#                       changes slowly — shows seasonal patterns
#                       has 1705 missing values (sensor failure)
# veg_fraction        = proportion of area covered by vegetation
#                       changes with wind direction
# impervious_fraction = proportion covered by roads and rooftops

# Do they add up to 1?
df |>
  mutate(check = veg_fraction + impervious_fraction) |>
  summarise(mean_sum = mean(check, na.rm = TRUE))
# approximately 1.00 — small remainder is water and bare soil


############################################################
# 9. The Six-Command Arrival Checklist
############################################################

# Run these six commands every time you open a new dataset.
# Make this a habit — use it in every lesson.

dim(df)        # 1. Size: rows and columns
names(df)      # 2. Column names
glimpse(df)    # 3. Structure: types and first values
head(df)       # 4. First 6 rows
tail(df)       # 5. Last 6 rows — check data ends where expected
summary(df)    # 6. Statistical overview of every column

# Bonus — always check missing values:
df |>
  summarise(across(everything(), ~sum(is.na(.)))) |>
  glimpse()

# Result for EC_teaching:
# timestamp              0
# Ta                     0
# RH                     0
# ws                     0
# wd                     0
# Rin                    0
# prec_mm                0
# ET_filled              0   <- gap-filled, complete by design
# LE.filled              0   <- gap-filled, complete by design
# soil_temp10cm       1705   <- sensor failure, 19.5% missing
# veg_fraction           0
# impervious_fraction    0


############################################################
# 10. First Meaningful Look at the Data
############################################################

# One real question answered with the data —
# before we know any advanced functions.

# "What was the average air temperature per season in 2019?"

df |>
  mutate(season = case_when(
    month(timestamp) %in% c(12, 1, 2)  ~ "Winter",
    month(timestamp) %in% c(3, 4, 5)   ~ "Spring",
    month(timestamp) %in% c(6, 7, 8)   ~ "Summer",
    month(timestamp) %in% c(9, 10, 11) ~ "Autumn"
  )) |>
  group_by(season) |>
  summarise(
    mean_temp  = round(mean(Ta,      na.rm = TRUE), 1),
    max_temp   = round(max(Ta,       na.rm = TRUE), 1),
    total_rain = round(sum(prec_mm,  na.rm = TRUE), 1)
  )

# Expected output:
#   season  mean_temp  max_temp  total_rain
#   Autumn      10.6      26.2       131.4
#   Spring      10.2      30.2       107.8
#   Summer      19.8      37.8        89.3
#   Winter       2.1       9.8       146.2

# Functions used: mutate(), case_when(), group_by(), summarise()
# We learn these properly in Lessons 3 and 4.
# For now — just read the pipeline and understand the result.


############################################################
# 11. Practice Exercises
############################################################

# Exercise 1:
# Import EC_teaching.csv using read_csv().
# Run the six-command arrival checklist on it.
# Does the timestamp column load as POSIXct or as a character?


# Exercise 2:
# How many hours in 2019 had air temperature above 30 degrees C?
# Express this as a percentage of all hours.
# Hint: use sum() and mean() with a logical condition.


# Exercise 3:
# What percentage of hours had zero solar radiation (Rin == 0)?
# Does the result make sense for Berlin at latitude 52 degrees N?


# Exercise 4:
# Import EC_teaching.xlsx using read_excel().
# Check the timestamp column — does it show a date or a number?
# If it shows a number, apply the fix from Section 5.


# Exercise 5 (Challenge):
# Group the data by time of day using hour(timestamp).
# Define four groups: Morning (6-11), Afternoon (12-17),
# Evening (18-21), Night (all other hours).
# Calculate mean and max solar radiation for each group.
# Note: timestamp is stored in UTC — convert to Berlin time first.
# Hint: with_tz(timestamp, tzone = "Europe/Berlin")


############################################################
# 12. Challenge Exercise
############################################################

# Group the data by wind direction sector.
# Define four sectors: North, East, South, West.
# Use these degree boundaries:
#   North: wd >= 315 OR wd < 45
#   East:  wd >= 45  AND wd < 135
#   South: wd >= 135 AND wd < 225
#   West:  wd >= 225 AND wd < 315
#
# Note: North needs two conditions joined by | (OR)
# because it wraps around the 0/360 degree boundary.
#
# For each sector, calculate:
# - number of hours (n)
# - mean temperature
# - mean relative humidity
# - mean precipitation
#
# Which wind direction brings the most rain to Berlin?
# Hint: Berlin has a prevailing westerly wind — do your results confirm this?


############################################################
# 13. Final Summary
############################################################

# Importing data:
# - read_csv()    for CSV files
# - read_delim()  for text files with any delimiter
# - read_excel()  for Excel files (always check the date column)
# - read_spss()   for SPSS files (convert labels with as_factor)
# - read_stata()  for Stata files
# - readRDS()     for R native files (best for R-to-R sharing)

# After importing — always run the arrival checklist:
# dim(), names(), glimpse(), head(), tail(), summary()

# EC_teaching has:
# - 8759 hourly rows (one hour missing — DST in March)
# - 12 variables across 5 groups: Time, Atmosphere,
#   Radiation, Water/Energy, Soil/Surface
# - 1705 missing values in soil_temp10cm only

# The pipe operator |> passes results from one step to the next.
# It makes code readable from left to right and top to bottom.


############################################################
# End of Lesson 01
############################################################
