# other data types
#lists
c(4, 6, "dog")
a <- list(4, 6, "dog")
class(a)
str(a)

# data.frames
letters
data.frame(letters)
df <- data.frame(letters)
length(df)
dim(df)
nrow(df)
ncol(df)

#factors
animals <- factor(c("duck", "duck", "goose", "goose"))
animals
class(animals)
levels(animals)
nlevels(animals)

animals <- factor(x = animals, levels = c("goose","duck"))
animals

year <- factor(c(1978, 1980, 1934, 1979))
year
class(year)
as.numeric(year)
levels(year)

#######################


?read.csv

surveys <- read.csv ("data/portal_data_joined.csv")
str(surveys)
surveys
class(surveys)

nrow(surveys)
ncol(surveys)
dim(surveys)

?str
str(surveys)
class(surveys)

summary(surveys)
summary(surveys$record_id)


head(surveys)
tail(surveys)
head(surveys,n=3)

summary(object=surveys)
summary.data.frame(surveys)
?summary.data.frame

surveys [1,5]

#first 5 rows
surveys[1:5]

surveys[,1]
surveys['record_id']
colnames(surveys)
surveys[c('record_id', 'year', 'day')]
dim(surveys[c('record_id', 'year', 'day')])


head(surveys)
dim(surveys)
head(surveys[1:10])
dim(surveys[c('record_id', 'year', 'day')])
head(surveys,1)

tail(surveys)
head(surveys)
surveys[1:6,]

surveys[1,]
surveys[,1]
head(surveys[1])
head(surveys[,1])

surveys[,1]

head(surveys["genus"])
head(surveys[["genus"]])

surveys$genus
surveys$plot_id


install.packages('tidyverse')
library(tidyverse)

t_surveys <- read_csv('data/portal_data_joined.csv')
class(t_surveys)
t_surveys
