#introduction to r: arithmetic
3+4

2*
#incomplete command
  
  
#order of operations
4 + 8 * 3 ^ 2

#this is a comment

#scientific notation
2/100000
4e3

#mathematical functions
exp(1)
exp(3)

log(4)

sqrt(4)

?log
log(x=2, base=4)
log(base =4, x =2)

x <- 1
x
rm(x)


#nested functions
sqrt(exp(4))
log(exp(100))


#six comparison functions
mynumber <- 6
mynumber == 5
mynumber = 6
mynumber <- 5

mynumber > 4
mynumber >= 2

mynumber <- 7
othernumber <- -3
mynumber * othernumber


#object name conventions
numSamples <- 50
num_samples <- 40

rm(num_samples)


#errors and warnings
log("a_word")

log_of_word <- log ("a_word")

log_of_negative <- log(2)




#challenge
elephant1_kg <-3492
elephant2_lb <- 7757
elephant1_lb <- elephant1_kg *2.2

elephant2_lb > elephant1_lb 

myelephants <- c(elephant1_lb, elephant2_lb)

which(myelephants == max(myelephants))


getwd()


d <- read.cvs("./data/tail_length.csv")


#best practices
#treat raw data as read only
#treat generated output as disposable

dir.create("./lectures")


# How R thinks about data

#Inspection
length(weight_g)
str(weight_g)

#Change vectors

weight_g <- c(weight_g, 90)
weight_g


num_char <- c(1, 2, 3, "a")
num_char
num_logical <- c(1, 2, 3, TRUE)
char_logical <- c("a", "b", "c", TRUE)
tricky <- c(1, 2, 3, "4")


