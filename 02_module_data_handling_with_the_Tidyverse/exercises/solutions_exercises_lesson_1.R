####################################################################
# EC_teaching — Exercise Solutions (Lesson 01)
####################################################################

library(tidyverse)
library(readxl)
library(lubridate)

####################################################################
# Exercise 1
# Import EC_teaching.csv using read_csv().
# Run the six-command arrival checklist on it.
# Does the timestamp column load as POSIXct or as a character?
####################################################################

ec <- read_csv("EC_teaching.csv")

dim(ec)          # 8760 rows x 12 columns
names(ec)        # 12 variable names
glimpse(ec)      # <dttm> for timestamp -> loads as POSIXct, not character
head(ec)
tail(ec)
summary(ec)

# Answer: read_csv() parses ISO-8601 strings (e.g. "2019-01-01T00:00:00Z")
# automatically, so timestamp arrives as POSIXct (<dttm>), already in UTC.
# No manual as.POSIXct() conversion is needed here (contrast with Exercise 4,
# where Excel's numeric date serial requires a manual fix).


####################################################################
# Exercise 2
# How many hours in 2019 had air temperature above 30 degrees C?
# Express this as a percentage of all hours.
# Hint: use sum() and mean() with a logical condition.
####################################################################

# Problematic when the variable contains NA:
# sum(ec$Ta > 30)     -> would return NA if any Ta is NA
# mean(ec$Ta > 30)     -> same problem

# Correct base R approach (robust to NA, though Ta has none here):
n_hot_hours <- sum(ec$Ta > 30, na.rm = TRUE)
pct_hot_hours <- mean(ec$Ta > 30, na.rm = TRUE) * 100

n_hot_hours     # 126 hours
pct_hot_hours   # ~1.44 %

# Tidyverse approach — filter() automatically drops NA conditions
ec |>
  filter(Ta > 30) |>
  summarise(n_hot_hours = n(),
            pct_hot_hours = n() / nrow(ec) * 100)

# Answer: 126 hours out of 8760 (~1.44%) exceeded 30°C in 2019.


####################################################################
# Exercise 3
# What percentage of hours had zero solar radiation (Rin == 0)?
# Does the result make sense for Berlin at latitude 52 degrees N?
####################################################################

ec |>
  summarise(n_dark_hours = sum(Rin == 0, na.rm = TRUE),
            pct_dark_hours = mean(Rin == 0, na.rm = TRUE) * 100)

# Answer: 3993 hours (~45.6%) had Rin == 0.
# This makes sense: at 52°N, night length alone accounts for roughly
# 40-50% of all hours over the year (short winter days, long winter
# nights near the solstice, close to 12/12 near the equinoxes), so a
# figure close to 45-46% is exactly what's expected — this is a
# sanity check, not a surprise.


####################################################################
# Exercise 4
# Import EC_teaching.xlsx using read_excel().
# Check the timestamp column — does it show a date or a number?
# If it shows a number, apply the fix from Section 5.
####################################################################

ec_xlsx <- read_excel("EC_teaching.xlsx")

glimpse(ec_xlsx)
head(ec_xlsx$timestamp)

# If timestamp shows a plain number (e.g. 43466.0) instead of a date,
# Excel has stored it as its internal date serial (days since
# 1899-12-30) and readxl did not auto-detect the column type.
# Fix (Section 5): convert manually using Excel's epoch.

ec_xlsx <- ec_xlsx |>
  mutate(timestamp = as.POSIXct(timestamp * 86400,
                                 origin = "1899-12-30",
                                 tz = "UTC"))

glimpse(ec_xlsx$timestamp)   # should now show <dttm>


####################################################################
# Exercise 5 (Challenge)
# Group the data by time of day using hour(timestamp).
# Define four groups: Morning (6-11), Afternoon (12-17),
# Evening (18-21), Night (all other hours).
# Calculate mean and max solar radiation for each group.
# Note: timestamp is stored in UTC — convert to Berlin time first.
####################################################################

df |>
  mutate(
    local_time  = with_tz(timestamp, tzone = "Europe/Berlin"),
    time_of_day = case_when(
      hour(local_time) >= 6  & hour(local_time) <= 11 ~ "Morning",
      hour(local_time) >= 12 & hour(local_time) <= 17 ~ "Afternoon",
      hour(local_time) >= 18 & hour(local_time) <= 21 ~ "Evening",
      TRUE                                              ~ "Night"
    )
  ) |>
  group_by(time_of_day) |>
  summarise(
    n        = n(),
    mean_Rin = round(mean(Rin, na.rm = TRUE), 1),
    max_Rin  = round(max(Rin,  na.rm = TRUE), 1)
  ) |>
  arrange(factor(time_of_day, levels = c("Morning", "Afternoon", "Evening", "Night")))
# Answer (approx.):
#   Morning:   mean ~181 W/m2, max ~785 W/m2
#   Afternoon: mean ~336 W/m2, max ~865 W/m2  <- highest, as expected
#   Evening:   mean ~58  W/m2, max ~475 W/m2
#   Night:     mean ~0.2 W/m2, max ~21  W/m2  <- near-zero, sanity check


####################################################################
# 12. Challenge Exercise
# Group the data by wind direction sector: North, East, South, West.
#   North: wd >= 315 OR wd < 45
#   East:  wd >= 45  AND wd < 135
#   South: wd >= 135 AND wd < 225
#   West:  wd >= 225 AND wd < 315
####################################################################

df |>
  mutate(wind_dir = case_when(
    wd >= 315 | wd < 45   ~ "North",   # wraps around the 0/360 boundary — needs OR, not AND
    wd >= 45  & wd < 135  ~ "East",
    wd >= 135 & wd < 225  ~ "South",
    wd >= 225 & wd < 315  ~ "West"
  )) |>
  group_by(wind_dir) |>
  summarise(
    n         = n(),
    mean_temp = round(mean(Ta,      na.rm = TRUE), 1),
    mean_RH   = round(mean(RH,      na.rm = TRUE), 1),
    mean_rain = round(mean(prec_mm, na.rm = TRUE), 3)
  ) |>
  arrange(desc(mean_rain))

# Answer:
#   West   n=3592  mean_prec ~0.057 mm  <- most rain
#   South  n=2481  mean_prec ~0.055 mm
#   North  n=776   mean_prec ~0.061 mm  (highest per-hour, but few hours)
#   East   n=1910  mean_prec ~0.030 mm  <- driest
#
# West is also by far the most frequent wind sector (3592 of 8760 hours),
# confirming Berlin's prevailing westerly flow. West brings the most
# *total* rain to the site. North shows a slightly higher mean
# precipitation-per-hour, but over far fewer hours (776) — so it
# contributes less overall. This is a good teaching moment: "most rain"
# depends on whether you mean per-hour intensity or total accumulated
# volume, and the two questions can point to different sectors.


####################################################################
# 13. Final Summary — arrival checklist reminder
####################################################################
# - read_csv()    for CSV files
# - read_delim()  for text files with any delimiter
# - read_excel()  for Excel files (always check the date column)
# - read_spss()   for SPSS files (convert labels with as_factor)
# - read_stata()  for Stata files
# - readRDS()     for R native files (best for R-to-R sharing)
# After importing — always run the arrival checklist:
# dim(), names(), glimpse(), head(), tail(), summary()
####################################################################
# End of Lesson 01 — Exercise Solutions
####################################################################
