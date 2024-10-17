surveys

#load survey data frame
survey <- read.csv("data/portal_data_joined")
surveys <- read.csv ("data/portal_data_joined.csv")

#columns and new data frame with species_id, the weight, and the plot_type columns
colnames
colnames(surveys)
#species_id is column 6, weight is 9, and plot_type is 13 (from colnames(surveys))

#first 5,000 rows and only columns 6, 9, 13
surveys_base <- surveys[1:5000, c(6,9,13)]

#remove all rows with NA (aka only complete cases) in the weight column
surveys_base <- surveys_base [complete.cases(surveys_base)] # error, didn't work
surveys_base <- surveys_base [complete.cases(surveys_base),] #worked with comma

#convert from species_id and weight plot_type to factors
surveys_base$species_id <- factor(surveys_base$species_id)
surveys_base$plot_type <- factor(surveys_base$plot_type)
