complete <- function(directory = "specdata", id = 1:332) {

  directory <- paste("C:\\Users\\NaveenJ\\Downloads", directory, sep = "\\")
  #Get file list in the directory
  AllFiles <- list.files(path = directory)

  #Create blank data frame for reading the file  
  AllData <- data.frame(Date=as.Date(character()),Pollutant1=character(),Pollutant2=character(),ID=integer())
  
  for (i in id)  {
    FileData <- read.csv(paste(directory, AllFiles[i], sep = "\\"))
    FileData <- na.omit(FileData)
    SavedResults <- c(i,NROW(FileData))
    AllData <- rbind(AllData,SavedResults)
  }
  
  colnames(AllData)<- c("id","nobs")
  AllData
}