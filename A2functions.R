pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of  the pollutant for which we will calcultate the
  ## mean; either "sulfate" or "nitrate"
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  ## NOTE: Do not round the result
  means <- c()
  
  for(monitor in id){
    path <- paste(getwd(), "/", directory, "/", sprintf("%03d", monitor), ".csv", sep = "")
    monitor_data <- read.csv(path)
    interested_data <- monitor_data[pollutant]
    means <- c(means, interested_data[!is.na(interested_data)])
  }
  
  mean(means)
}

complete1 <- function(directory, id = 1:332){
  filename <- numeric(0)
  row <- numeric(0)
  for(monitor in id){
  path <- paste(getwd(), "/", directory, "/", sprintf("%03d", monitor), ".csv", sep = "")
  monitor_data <- read.csv(path)
  interested_data <- monitor_data[(!is.na(monitor_data$sulfate)) , ]
  interested_data <- interested_data[(!is.na(monitor_data$nitrate)), ]
  filename[monitor] = paste(sprintf("%03d", monitor), ".csv", sep = "")
  row[monitor] = nrow(interested_data)
  }
  filename <-filename[!is.na(filename)]
  row <-row[!is.na(row)]
  df <- data.frame(filename,row)
}
complete <- function(directory, id = 1:332){
  ## 'director' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the from:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  results <- data.frame(id=numeric(0), nobs=numeric(0))
  for(monitor in id){
    path <- paste(getwd(), "/", directory, "/", sprintf("%03d", monitor), ".csv", sep = "")
    monitor_data <- read.csv(path)
    interested_data <- monitor_data[(!is.na(monitor_data$sulfate)), ]
    interested_data <- interested_data[(!is.na(interested_data$nitrate)), ]
    nobs <- nrow(interested_data)
    results <- rbind(results, data.frame(id=monitor, nobs=nobs))
  }
  results
}
corr <- function(directory, threshold = 0){
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the 
  ## number of completely observed observations (on all
  ## variables) requi?red to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  ## NOTE: Do not round the result!
  cor_results <- numeric(0)
  
  complete_cases <- complete(directory)
  complete_cases <- complete_cases[complete_cases$nobs>=threshold, ]
  #print(complete_cases["id"])
  #print(unlist(complete_cases["id"]))
  #print(complete_cases$id)
  
  if(nrow(complete_cases)>0){
    for(monitor in complete_cases$id){
      path <- paste(getwd(), "/", directory, "/", sprintf("%03d", monitor), ".csv", sep = "")
      #print(path)
      monitor_data <- read.csv(path)
      #print(monitor_data)
      interested_data <- monitor_data[(!is.na(monitor_data$sulfate)), ]
      interested_data <- interested_data[(!is.na(interested_data$nitrate)), ]
      sulfate_data <- interested_data["sulfate"]
      nitrate_data <- interested_data["nitrate"]
      cor_results <- c(cor_results, cor(sulfate_data, nitrate_data))
    }
  }
  cor_results
}