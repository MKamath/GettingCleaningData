## Set the path to the directory
## PLEASE NOTE!! CHANGE "..." to the path the folder which contains the UCI HAR Dataset

delimiter <- "\\"

wPath <- "C:\\ ... \\UCI HAR Dataset"
setwd(wPath)

## Read the Activity labels into lData 
lPath <- paste(wPath, delimiter, "activity_labels.txt", sep="")
lData <- read.table(lPath, sep="", header=FALSE, as.is=TRUE)
lData <- lData$V2
lData <- gsub("_", " ", lData)

## Read the Features into fData
fPath <- paste(wPath, delimiter, "features.txt", sep="")
fData <- read.table(fPath, sep=" ", header=FALSE, as.is=TRUE)
fData <- fData$V2
fData <- gsub("\\()", "", fData)

## This code will be repeated hence made into a function
readtxt <- function(file, path){
        xPath <- paste(path, delimiter, file, delimiter, "X_", file, ".txt", sep="")
        yPath <- paste(path, delimiter, file, delimiter, "Y_", file, ".txt", sep="")
        sPath <- paste(path, delimiter, file, delimiter, "subject_", file, ".txt", sep="")
        
        yData <- as.numeric(readLines(yPath))
        sData <- as.numeric(readLines(sPath))
        
        xData <- matrix(scan(xPath), nrow = length(sData), ncol = 561)
        Data <- data.frame(source=file, Activity=lData[yData], volunteerID=sData, xData, 
                           stringsAsFactors=FALSE)
        Data
}

## Read the test data into teData
teData <- readtxt("test", wPath)

## Read the training data into trData
trData <- readtxt("train", wPath)

## Combine both the training and test data into 1 data and give it appropriate column names
tData <- rbind(teData, trData)
names(tData)[4:ncol(tData)] <- fData

## Select only those columns which have "mean" or "std" in the name
sCols <- c(1:3, grep("mean|std", names(tData)))
eData <- tData[, sCols]

## Separate the data into separate sets depending upon the activity being performed and the
## ID of the volunteer
sepData <- split(eData, list(eData$Activity, eData$volunteerID))

## Combine the separated data in the required format
rData <- do.call(rbind, lapply(sepData, function(z) {
        data.frame(Activity = z$Activity[1], volunteerID = z$volunteerID[1],
        t(colMeans(z[,-1:-3])), stringsAsFactors=FALSE)
}))

## Arrange the final data by the activity and the volunteer ID
rData <- rData[order(rData$Activity, rData$volunteerID),]

## Create the file which has to be uploaded
write.table(rData, "Required-Data.txt", row.names=FALSE, sep="\t")

