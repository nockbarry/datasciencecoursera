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
 

