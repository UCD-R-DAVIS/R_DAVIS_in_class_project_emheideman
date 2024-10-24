library(tidyverse)
surveys <- read_csv("data/portal_data_joined.csv")

#weight between 30 and 60
surveys %>% filter(weight > 30 & weight <60) %>% head(n = 5)


#part 3a
#new tibble showing max weight for each species + sex combination
biggest_critters <- surveys %>% filter(!is.na(weight)) %>% 
  group_by(species_id, sex) %>% 
  summarize(max_weight = max (weight))

#part 3b
#arrange
biggest_critters %>% arrange(-max_weight) %>% head()

#part 4
surveys %>% filter(is.na(weight)) %>% 
  group_by(species) %>% tally() %>% arrange(-n)

#part 5
#remove weight na
#new column = avg weight of species+sex combo
#get rid of all columbs except species, sex, weight, and avg_weight
surveys_avg_weight <- surveys %>% filter(!is.na(weight)) %>% 
  group_by(species_id, sex) %>% 
  mutate(avg_weight = mean(weight)) %>% 
  select(species_id, sex, weight, avg_weight)

#part 6
#takes surveys_avg_weight
#add new column
#called above_average that contains logical values 
#stating whether or not row's weight is above average for its species + sex combo

surveys_avg_weight %>% 
  mutate (above_average = weight > avg_weight)
