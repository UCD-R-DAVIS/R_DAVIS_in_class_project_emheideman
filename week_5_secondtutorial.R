library (tidyverse)
tail <- read_csv ('data/tail_length.csv')
surveys <- read_csv ('data/portal_data_joined.csv')

dim(tail)
dim(surveys)
head(tail)

surveys_inner <- inner_join(x=surveys, y=tail)
dim(surveys_inner)
head(surveys_inner)

surveys_left <- left_join(x=surveys, y=tail)
dim(surveys_left)
table(is.na(surveys_left$tail_length))

surveys_right <- right_join(x=surveys, y=tail)
dim(surveys_right)
surveys_left_right_equivalent <- left_join (x=tail, y=surveys)
dim(surveys_left_right_equivalent)

surveys_full <- full_join(surveys,tail)
dim(surveys_full)
full_join(x=surveys, y=tail)

left_join(surveys,tail %>% rename(record_id2 = record_id), by= c('record_id'= 'record_id2'))


all(surveys$record_id %in% tail$record_id)
all(tail$record_id %in% surveys$record_id)

surveys_mz <- surveys %>% 
  filter(!is.na(weight)) %>% 
  group_by(genus, plot_id) %>% 
  summarize (mean_weight = mean(weight))

surveys_mz %>%
  pivot_wider(id_cols = 'genus',
              names_from = 'plot_id', 
              values_from = 'mean_weight')

