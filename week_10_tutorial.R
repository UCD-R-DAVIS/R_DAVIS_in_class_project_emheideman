library(tidyverse)
surveys <- read.csv("data/portal_data_joined.csv")
#using for loop
#print longest species name
#for each taxa
#nchar() = #characters

for(i in unique(surveys$taxa)){
  mytaxon <- surveys %>% filter(taxa ==i)


myspecies <- unique(mytaxon$species)
maxlength <- max(nchar(myspecies))

mytaxon %>% filter(nchar(species)==maxlength)

mytaxon %>% filter(nchar(species) == maxlength) %>% 
  select(species) %>% unique()

print(mytaxon %>% filter(nchar(species)==maxlength) %>% 
        select(species) %>% unique())


}


mloa <- read_csv("https://raw.githubusercontent.com/ucd-cepb/R-DAVIS/master/data/mauna_loa_met_2001_minute.csv")

#use map function to print max of each of these columns 
mycols <- mloa %>% select("windDir", "windSpeed_m_s",
                          "baro_hPa",
                          "temp_C_2m",
                          "temp_C_10m",
                          "temp_C_towertop",
                          "rel_humid",
                          "precip_intens_mm_hr")

mycols %>% map(min, na.rm = T)


#part 3
#make function C_to_F
#multipy C * 1.8 then add 32
#make 3 new columns called temp_F_2m, temp_F_10m, temp_F_towertop

C_to_F <- function(x){
  x*1.8 + 32}

#mutate
mloa %>%  mutate(temp_F_2m = C_to_F(temp_C_2m),
                 temp_F_10m = C_to_F(temp_C_10m),
                 temp_F_towertop = C_to_F(temp_C_towertop))

mloa$newcolumn <- C_to_F(mloa$temp_C_2m)


#Bonus using map_df
newmloa <- mloa %>% select(c("temp_C_2m",
                             "temp_C_10m",
                             "temp_C_towertop" %>% 
        map_df(., C_to_F)  %>% rename("temp_F_2m" = "temp_C_2m",
                                      "temp_F_10m" = "temp_C_10m",
                                      "temp_F_towertop" = "temp_C_towertop") %>% 
          bind_cols(mloa)

        
                           