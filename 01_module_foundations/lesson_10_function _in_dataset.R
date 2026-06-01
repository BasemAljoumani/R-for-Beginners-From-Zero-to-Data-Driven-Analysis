############################################################
# Lesson 09: Function in R --- work using DATASET 
# Course: R for Beginners - From Zero to Data-Driven Analysis
#
# 
#################################################
# work using DATASET 
###############
#Step 1. Create Eddy Covariance Dataset

set.seed(123)

timestamp <- seq.POSIXt(
  from = as.POSIXct("2026-01-01 00:00"),
  by = "30 min",
  length.out = 48 * 7
)

hour <- as.numeric(format(timestamp, "%H"))

radiation <- ifelse( hour >= 7 & hour <= 18,runif(length(timestamp), 100, 800),0 )

ec_data <- data.frame(
               timestamp = timestamp,
                      Ta = rnorm(length(timestamp), 20, 5),
                      SM = runif(length(timestamp), 0.10, 0.35),
                      LE = ifelse(radiation > 0,runif(length(timestamp), 50, 300),runif(length(timestamp), 0, 30) ),
                      ET = ifelse(radiation > 0,runif(length(timestamp), 0.02, 0.5),runif(length(timestamp), 0, 0.03)),
                     pre = sample(c(0, 0, 0.2, 0.5, 1),length(timestamp),replace = TRUE,prob = c(0.7, 0.1, 0.1, 0.1, 0.1) ),
               radiation = radiation
)

head(ec_data)

# Step 2 — What is a For Loop?

#A for loop repeats code multiple times.

# General structure:
for (i in 1:5) {
  
  print(i)
  
}

# Step 3 — Create Empty Column

ec_data$rain_type <- NA              # NA means empty value # the loop will fill this column later

head(ec_data)

# Step 4 — Access One Row Inside a Loop

for (i in 1:nrow(ec_data)) {
  
  rain_value <- ec_data$pre[i]      # ec_data$pre[i]   take precipitation value from row number i
  
  print(rain_value)
  
}


#Step 5 — Add If Statement

# 0 → No rain
# greater than 0 → Rain

for (i in 1:nrow(ec_data)) {
  
  rain_value <- ec_data$pre[i]
  
  if (rain_value == 0) {
    
    print("No rain")
    
  } else {
    
    print("Rain")
    
  }
}

# Step 6 — Save Results into Data Frame

for (i in 1:nrow(ec_data)) {
  rain_value <- ec_data$pre[i]
  
  if (rain_value == 0) {
      ec_data$rain_type[i] <- "No rain"
     } else {
        ec_data$rain_type[i] <- "Rain"
     }
}

# Step 7 — Check Results
head(ec_data)

# Step 8 — Count Rain Events

table(ec_data$rain_type)



#####Function####
rain_state <- function(ec_data){
  for (i in 1:nrow(ec_data)) {
    rain_value <- ec_data$pre[i]
    
    if (rain_value == 0) {
      ec_data$rain_type[i] <- "No rain"
    } else {
      ec_data$rain_type[i] <- "Rain"
    }
  }
  return(ec_data)
}

ec_data2 <- rain_state(ec_data)

#####
# better version
################

rain_state <- function(data, rain_col){

data$rain_type <- ifelse(
  data[[rain_col]] == 0,
  "No rain",
  "Rain"
)

return(data)
}
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