library (tidyverse)

# question 1: url file 
tylerurl <- https://raw.githubusercontent.com/ucd-cepb/R-DAVIS/refs/heads/main/data/tyler_activity_laps_10-24.csv
#doesn't work without ''
tylerurl <- 'https://raw.githubusercontent.com/ucd-cepb/R-DAVIS/refs/heads/main/data/tyler_activity_laps_10-24.csv' 
laps <- read.csv(tylerurl)
str(laps)

# question 2: filter out non-running activities & 
# question 3: remove lap with pace >10 mmp, abnormally fast < 5 mmp, and abnormally short < 1 mmp, &
# question 4: create a new categorical variable, form distinguishes between laps run in the year 2024 (“new”, as Tyler started his rehab in January 2024) and all prior years (“old”).

running <- laps %>% 
  filter (sport == 'running') %>% 
  filter (total_elapsed_time_s >= 60) %>% 
  filter(minutes_per_mile < 10 & minutes_per_mile >5) %>% 
  mutate(pace = case_when (minutes_per_mile < 6 ~ 'abfast', 
                           minutes_per_mile >=6 & minutes_per_mile < 8 ~ 'medium',
                           T ~ 'slow'), 
         form = case_when (year == 2024 ~ 'newform',
                           T ~ 'oldform'))

#tried to run form separately from the other line of code and got an error, told me to run this line of code 
form = case_when (year == 2024 ~ 'newform', T ~ 'oldform')
rlang::last_trace() 

#question 4: average steps per minute for laps by form and pace, and generate a table showing these values with old and new as separate rows and pace categories as columns

running %>% 


         
  


