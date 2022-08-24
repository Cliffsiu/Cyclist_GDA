# Install and load the packages that I need for cleaning the data
install.packages("dplyr")
install.packages("tidyverse")
install.packages('lubridate')
install.packages('janitor')

library(dplyr)
library(tidyverse)
library(lubridate)
library(janitor)



# Import that data from divvy. In my case study, I am use the data from Aug2021 to Jul2022.
trip_2021_08<-read.csv("trip_2021_08.csv")
trip_2021_09<-read.csv("trip_2021_09.csv")
trip_2021_10<-read.csv("trip_2021_10.csv")
trip_2021_11<-read.csv("trip_2021_11.csv")
trip_2021_12<-read.csv("trip_2021_12.csv")
trip_2022_01<-read.csv("trip_2022_01.csv")
trip_2022_02<-read.csv("trip_2022_02.csv")
trip_2022_03<-read.csv("trip_2022_03.csv")
trip_2022_04<-read.csv("trip_2022_04.csv")
trip_2022_05<-read.csv("trip_2022_05.csv")
trip_2022_06<-read.csv("trip_2022_06.csv")
trip_2022_07<-read.csv("trip_2022_07.csv")



# Check if they are the same type and having same amount of columns. 
# Combine the all the data into one single data frame by using rbind() function.
compare_df_cols(trip_2021_08,trip_2021_09,trip_2021_10,trip_2021_11,trip_2021_12,
                trip_2022_01,trip_2022_02,trip_2022_03,trip_2022_04,trip_2022_05,
                trip_2022_06,trip_2022_07)

total_trip <- rbind(trip_2021_08,trip_2021_09,trip_2021_10,trip_2021_11,trip_2021_12,
                trip_2022_01,trip_2022_02,trip_2022_03,trip_2022_04,trip_2022_05,
                trip_2022_06,trip_2022_07)



# Drop unwanted data frame
rm(trip_2021_08,trip_2021_09,trip_2021_10,trip_2021_11,trip_2021_12,
   trip_2022_01,trip_2022_02,trip_2022_03,trip_2022_04,trip_2022_05,
   trip_2022_06,trip_2022_07)



# Clean name: make sure all the column names are followers the same structure and easy to work with.
clean_names(total_trip)
colnames(total_trip)



# Drop NULL row, and check for duplicate.
total_trip <- drop_na(total_trip)
length(unique(total_trip$ride_id)) == nrow(total_trip)  #return TRUE == no duplicate



# Change the format from chr to difftime in order to calculate the time different between start and end.
total_trip$started_at <- strptime(total_trip$started_at, format = "%Y-%m-%d %H:%M:%S")
total_trip$ended_at <- strptime(total_trip$ended_at, format = "%Y-%m-%d %H:%M:%S")
str(total_trip)



# Create 2 new columns for trip duration in seconds and minutes.
total_trip <- mutate(total_trip, trip_duration_sec = difftime(total_trip$ended_at, total_trip$started_at, units="sec"))
total_trip <- mutate(total_trip, trip_duration_mins = difftime(total_trip$ended_at, total_trip$started_at, units="mins"))



# Create a new column 'dayweek'(1=Sunday, 7=Saturday).
total_trip$dayweek <- wday(substr(total_trip$started_at,1,10))



# Accouding to the divvy staff, there are electric_bike and non_electric_bike. 
# For non_electric_bike, they are labelled as classic_bike and docked_bike.
# Here, I combine classic_bike and docked_bike into non_electric_bike and make a new column.
total_trip$rideable_type2 <- 
  with(total_trip, factor(rideable_type2, levels = c('electric_bike', 'classic_bike', 'docked_bike'), 
                                labels = c("electric_bike", "non_electric_bike", "non_electric_bike")))



# Filter out some data since some of the data end_at > started_at or duration = 0
total_trip_clean <-filter(total_trip, trip_duration_sec > 0)


# Have a copy of the data frames.
write.csv(total_trip_clean,"total_trip_clean.csv")





