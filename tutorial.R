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



