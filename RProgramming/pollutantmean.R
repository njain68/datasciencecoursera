pollutantmean <- function(directory = "specdata", pollutant, id = 1:332) {

directory <- paste("C:\\Users\\NaveenJ\\Downloads", directory, sep = "\\")
#Get file list in the directory
  AllFiles <- list.files(path = directory)
  
#Create blank data frame for reading the file  
  AllData <- data.frame(Date=as.Date(character()),Pollutant1=character(),Pollutant2=character(),ID=integer())
  for (i in id)  {
#    FileData <- read.csv(paste("C:\\Users\\NaveenJ\\Downloads", directory, AllFiles[i], sep = "\\"))
    FileData <- read.csv(paste(directory, AllFiles[i], sep = "\\"))
    AllData <- rbind(AllData,FileData)
  }
  
  Results <- vector(mode="character", length=1)
  
#Print the results based on the option specified  
  if (pollutant=="sulfate") {
    col2 <-AllData[,2]
    Results <- c(mean(col2,na.rm=TRUE))
    print (Results)
  } else if (pollutant=="nitrate") {
    col3 <-AllData[,3]
    Results <- c(mean(col3,na.rm=TRUE))
    print (Results)
  }
#  Results
}