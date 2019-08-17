# Lists 
x <- list(1:3, "a", "b c", TRUE, 1 + 2i, FALSE)
x = list(1:3, "a", "b c", TRUE, 1 + 2i, FALSE)
# Matricies
m <-1:10
dim(m) = c(2,5)
m
x1= 1:3
y1 = 10:12
m1 =cbind(x1,y1)
rbind(x1,y1)
m1
# Factors
x2 <- factor(c("yes","yes","no","yes","no")) #case sensitive
x2
table(x2)
unclass(x2)
x3<- factor(c("yes","yes","no","yes","no"), levels = c("yes","no")) 
#automaticaly sorts levels by aplhpabetical order, use levels() to define the order
x3
table(x2)

y2<- c(1, 2, NA, 10, 3)
is.na(y2) #check for NA values
is.nan(y2)#check for NAN Values
# Data Frames, columns can each be a different type of data
d <- data.frame(foo = 1:4, bar = c(T,T,F,F)) # all columns same length
#names function
x = 1:3
names(x) <- c("foo","bar","norf")
# read.table or read.csv improt data from file, see help for clarity especially for large data sets
# use colClasses argument for large data sets
initial <- read.table("datatable.txt", nrows = 100) #read first 100 rows
classes <- sapply(initial,class) #find classes for those columns 
tabAll <- read.table("datatable.txt", colClasses = classes) #Use the classes to speed up read
#dump and dput preserve metadata (like column info) when exporting data, while sacrificeing space efficiency
y <- data.frame(a=1, b= 'a')
dput(y) # shows the code used in dput
dput(y, file = "y.R")
new.y <- dget("y.R")
new.y
# dump can be used on multiple objects
x <- "foo"
y 
dump(c("x","y"), file = "data.R") 
# rm(x,y) to remove x,y
source("data.R")
y
x
#file connections
str(file)
str(url) #str gives structure of a function
#descirption is the name of a file, opeb is a code indicating 
# "r" read only, "w" writing and initalizing a new file, "a" appending
con <- url("http://www.jhsph.edu","r")
x <- readLines(con, n = 10)
head(x)
close(con)
# subsetting, [ always returns objects of the same class as original
# [[ extracts elements of a list or data frame, can only be used on a single elemnt, and the class will not neeccesarily be t a list or data fram
# $ is used to extract elements of a lsit or data fram by name
x <- c("a","b","c","d","a")
x[1]
x[2]
x[1:4]
x[x>"a"]
u <- x > "a" 
u
#lists
x <- list(foo = 1:4,bar = 0.6)
x[1] #gives list
x[[1]] # gives sequence

x$bar # gives element with name bar, dont have to remember postion of object, only name
x[["bar"]] # gives element as sequence
x["bar"] #gives element as original object, in this case a list

x<- list(foo = 1:4, bar = .6, baz = "hello")
x[c(1,3)] # gets 1st and 3rd element, can only use [  or to get multiple elements
name <- "foo"
x[[name]] # works
x$name # dosent work
x$foo # works
# [[ can take an integer sequence
x <- list(a = list(10,12,14),b = c(3.14, 2.8))
x[[c(1,3)]]
x[[1]][[3]]#same as above
x[[c(2,1)]]

#matricies, similar to matlab, using single brackets instead of parenthises
x <- matrix(1:6,2,3)
x[1,2] #gives a 1x1 vector, can use drop = false in [] to get a matrix
x[1, ] #gives first row
x[1, , drop = FALSE] # gives matrix of first row

#partial matching, msotly useful in command line
x <- list(aardvark = 1:5)
x$a # finds any name with an a
x[["a" , exact = FALSE]] # same thing as above

#removing NA values
x <- c(1,2,NA,4,NA,5)
bad <- is.na(x)
x[!bad] #removes bad indacted  elements ! is caleld bang operator
x <- c(1,2,NA,4,NA,5)
y <- c("a","b",NA, "d", NA, "f")
good <- complete.cases(x,y) # also works for data frams
good
x[good]
y[good]

#vectorized operations
x <- 1:4; y<- 6:9
x+y #adds elements
x>2
x >= 2
y == 8
x*y #element by element
x/y #element by element
x <- matrix (1:4, 2, 2); t <- matrix(rep(10,4),2,2) #repeat 10 4 tiems
x * t # elementwise
x %*% t # true matrix multiplication

#quiz code
#extract last 2 rows of data set named data
data <- read.csv("hw1_data.csv")
data[(dim(data)[1]-1):dim(data)[1], ]
bad <- is.na(data[ , "Ozone"])

#How many NA values in Ozone
Ozone <- data[ , "Ozone"]
Ozone_trim <- Ozone[!bad]
length(Ozone)-length(Ozone_trim)
#Extract the subset of rows of the data frame where
#Ozone values are above 31 and Temp values are above 90.
#What is the mean of Solar.R in this subset?
good <- complete.cases(data[ , "Ozone"])
data_o <- data[good , ] # trimmed na values for ozone
Ozone_rows <- 31 < data_o[ , "Ozone"]
data_or <- data_o[Ozone_rows, ]
good2 <- complete.cases(data_or[ ,"Solar.R"])
data_s <- data_or[good2 , ]
Solar_rows <- 90 < data_s[ , "Temp"]
data_sr <- data_s[Solar_rows, ]
mean(data_sr[ , "Solar.R"])
#What is the mean of "Temp" when "Month" is equal to 6? 
month <- data[ , "Month" ]
month6 <- month == 6
datamonth <- data[month6 , ]
mean(datamonth[ , "Temp"])
#
month <- data[ , "Month" ]
month5 <- month == 5
datamonth5 <- data[month5 , ]
good <- complete.cases(datamonth5[ , "Ozone"])
data_m5trim <- datamonth5[good , ] # trimmed na values for ozone
max(data_m5trim[ , "Ozone"])
