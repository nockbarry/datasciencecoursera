# Week 2
# if(condition) {

#do something
#} else {     (can be else if() , just always end with an else)
#do something else
#}
if(x>3) {
  y <- 10
} else {
  y <- 0
}
#same as 
y<- if(x>3){ 10
} else {0}

#all of these bellow are the same
x <- c("a", "b", "c", "d")
for(i in 1:4) {
  print(x[i]) 
}
for(i in seq_along(x)) {
  print(x[i])
}
for(letter in x) {
  print(letter)
}
for(i in 1:4) print(x[i])

## all above are the same
x <- matrix(1:6, 2, 3)
for(i in seq_len(nrow(x))) {
  for(j in seq_len(ncol(x))) {
    print(x[i, j])        
  }
}
#While loops
count <- 0
while(count < 10) {
  print(count)
  count <- count + 1
}
#make sure the loop can end, here is a random coin flip where it is undetermined how long the loop will last
z <- 6
count <- 0
zc <- rep(0,10)
while(z >= 3 && z <= 10) {
  print(z)
  coin <- rbinom(1, 1, 0.5)
  count <- count +1
  zc[count] <- z
  if(coin == 1) {  ## random walk
    z <- z + 1
  } else {
    z <- z - 1  
  }
}
plot(zc, ,"l")
#
for(i in 1:100) {
  if(i <= 20) {
    ## Skip the first 20 iterations
    next        
  }
  ## Do something here
}

#paste function joins strings
args(paste)
args(cat) #joins string and then exports to file
paste("a", "b", sep = ":")
paste("a", "b", se = ":")# ignores partial matching due to the ...
add2 <- function(x,y){
  x+y #function automatically returns last value
}
above <- function(x,n){
  use <- x > n
  x[use]
}
above <- function(x, n= 10){ #10 is default value
  use <- x > n
  x[use]
}

colmean <- function(y, removeNA =TRUE){ #remove NA's by default
  nc <- ncol(y) #number of col
  means <- numeric(nc)
  for(i in 1:nc){
    means[i] <- mean(y[ ,i], na.rm = removeNA)
  }
  means
}
#can use formal to find all arguments if not all of them are necessary to call the function
#can use arugmuments in wrong order if you name them correctly, can also use partial matching of arguments
#if when you define a function, you defien mroe arguments than are used, no error will occur if you call the function without the unused arguments
myplot <- function(x,y, type="l", ...) { #... is used when extending another function with many arguments
  plot(x,y type = type, ...) #dont need to specify all of the arugments for plot, just the ones your modifiying
}
#... alo necessary when the number of arguments is not known in advacne
make.power <- function(n) {
  pow <- function(x) {
    x^n         #n dosent exist in the environment of pow, but does exist in its parent environment of make.power
  }        
  pow 
}
cube <- make.power(3) #this defines cube as the function pow with n = 3
square <- make.power(2)#this defines cube as the function pow with n = 2

#dates are stored as objects of the date class
# POSIXct is just a very large integer under the hood; it use a useful class when
# you want to storetimes in something like a data frame
# POSIXlt is a list underneath and it stores a bunch of other useful information
#like the day of theweek, day of the year, month, day of the month
# a number of functions use dates and times
#weekdays, months and quarters
x <- Sys.time()
p <- as.POSIXlt(x)
names(unclass(p))
p$yday
x <- Sys.time()
x  ## Already in ‘POSIXct’ format
unclass(x)
datestring <- c("January 10, 2012 10:40", "December 9, 2011 9:10")
x <- strptime(datestring, "%B %d, %Y %H:%M")
x #use ?strptime for details
<- as.Date("2012-03-01") 
y <- as.Date("2012-02-28") 
x-y## Time difference of 2 days
x <- as.POSIXct("2012-10-25 01:00:00")
y <- as.POSIXct("2012-10-25 06:00:00", tz = "GMT")
y-x## Time difference of 1 hours
