# load in url
library(tidyverse)
library(lubridate)
url <- 'https://raw.githubusercontent.com/UCD-R-DAVIS/R-DAVIS/refs/heads/main/data/tyler_activity_laps_12-6.csv'
laps <- read_csv(url)
str(laps)

# filter out non-running activities & remove lap with pace >10 mmp, abnormally fast < 5 mmp, and abnormally short < 1 mmp
# group observations into three time periods corresponding to pre-2024 running, Tyler’s initial rehab efforts from January to June of this year, and activities from July to the present.
running_laps <- laps %>% 
  filter(sport == 'running') %>%
  filter(total_elapsed_time_s >= 60) %>%
  filter(minutes_per_mile < 10 & minutes_per_mile > 5) %>% 
  mutate(
    date = ymd(paste(year,month,day)), # used paste to combine year, month, day columns into one string
    time_period = case_when(
      date < ymd("2024-01-01") ~ "pre-2024 running",
      date >= ymd("2024-01-01") & date <= ymd("2024-06-30") ~ "rehab jan-june",
      date >= ymd("2024-07-01") ~ "post-rehab"
    )
  )

# spent a lot of time working between using as.Date or ymd but ymd worked better


# make a scatter plot that graphs SPM (strides per minute) over speed by lap.

names(laps) 
# SPM is steps_per_minute but there is not a specific speed coluumn, do I need to calculate it?
# tried this code but the graph looked funny so I decided just to use total_elapsed_time_s:
# laps <- laps %>% 
 # mutate(speed = total_distance_m / total_elapsed_time_s)


library(ggplot2)
ggplot(laps, aes(x = total_elapsed_time_s, y = steps_per_minute)) +
  geom_point() +
  labs(title = "SPM over Speed by Lap", x = "Speed", y = "SPM") +
  theme_classic()

# make 5 aesthetic changes to the plot to improve the visual.


# ran out of time



