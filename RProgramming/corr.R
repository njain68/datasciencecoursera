corr <- function(directory = "specdata", threshold=0) {
  
  AllData <- complete (directory,1:332)
  DataAboveThreshold <- subset(AllData, nobs>threshold)
  
  directory <- paste("C:\\Users\\NaveenJ\\Downloads", directory, sep = "\\")
  #Get file list in the directory
  AllFiles <- list.files(path = directory)
  
  
  #Create blank data frame for reading the file  
  AllCorr <- vector(mode="numeric", length=NROW(DataAboveThreshold))
  
  if (NROW(DataAboveThreshold) > 0) {
    for (i in 1:NROW(DataAboveThreshold))  {
      j <- DataAboveThreshold[i,1]
      FileData <- read.csv(paste(directory, AllFiles[j], sep = "\\"))
      FileData <- na.omit(FileData)
      x <- FileData[,2]
      y <- FileData[,3]
      AllCorr[i] <- cor(x,y)
    }
  }
  AllCorr
}