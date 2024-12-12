library(tidyverse)
library(lubridate)
mloa <- read_csv("https://raw.githubusercontent.com/ucd-r-davis/R-DAVIS/master/data/mauna_loa_met_2001_minute.csv")

mloa2 = mloa %>%
  
  filter(rel_humid != -99) %>%
  filter(temp_C_2m != -999.9) %>%
  filter(windSpeed_m_s != -999.9) %>%
  mutate(datetime = ymd_hm(paste0(year,"-", 
                                  month, "-", 
                                  day," ", 
                                  hour24, ":", 
                                  min), 
                           tz = "UTC")) %>%
  mutate(datetimeLocal = with_tz(datetime, tz = "Pacific/Honolulu"))

