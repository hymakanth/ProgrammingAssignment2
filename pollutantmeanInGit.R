pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  ## NOTE: Do not round the result!
  
  means<-vector("numeric")
  ##Set path to current working directory/directory arg and concatenate required 0's to file name(id arg) and .csv 
  fname<-paste(getwd(),directory,sprintf("%03d.csv",id),sep="/")
  ## print(fname)
  ## read csv file <fname> in loop using lapply into tempdata which is a list
  tempdata<-lapply(fname, read.csv, header = TRUE)
  ##ldply to split list and get data in data frame. Package 'plyr' needs to be loaded
  data<-ldply(tempdata)
  ##dataFR<-tempdata[complete.cases(tempdata),]
  ##print(pollutant)
  ##print(data[,pollutant])
  ##calculate mean of col pollutant passed as arg
  means<-mean(data[,pollutant], na.rm = TRUE)
  ##means<-mean(data$pollutant, na.rm = TRUE)
  ##print(means)
  
}
