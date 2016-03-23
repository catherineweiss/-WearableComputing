## run_analysis.R is a script developed to accomplish the 
## following tasks:

## 1A.  Read data that was collected from accelerometers mounted
##      within Samsung Galaxy S smartphones.  The data includes
##      training and test sets
## 1B.   Merge training and test sets into one dataset ("data").
## 2.   Extract measurements on the mean and standard deviation for
##      each measurement ("dataExtract").
## 3.   Use descritive activity names to name activities in dataset.
## 4.   Label data set with descriptive variable names.
## 5.   Create a second, independent tidy data set with the average
##      of each variable for each activity and each subject
##      ("newData").


run_analysis <- function(){

## TASK 1A.  READ IN FILES FROM UCI HAR DATASET

if(!file.exists("data")) {
        dir.create("data")
}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./data/raw.zip", method = "curl")  
setwd("data")
unzip("raw.zip", exdir = "./")
setwd("UCI HAR Dataset")

activity_labels <- read.table("activity_labels.txt", 
                        stringsAsFactors = FALSE)
features <- read.table("features.txt", stringsAsFactors = FALSE)

workingDir <- getwd()

testWorkingDir <- paste0(workingDir, "/test") 
setwd(testWorkingDir)

test <- read.table("X_test.txt", sep="", stringsAsFactors = FALSE)
test_labels <- read.table("Y_test.txt", stringsAsFactors = FALSE)
test_subjectLabels <- read.table("subject_test.txt", 
                                 stringsAsFactors = FALSE)

trainWorkingDir <- paste0(workingDir, "/train")  
setwd(trainWorkingDir)
train <- read.table("X_train.txt", sep="", stringsAsFactors = FALSE)
train_labels <- read.table("Y_train.txt", stringsAsFactors = FALSE)
train_subjectLabels <- read.table("subject_train.txt", 
                                  stringsAsFactors = FALSE)



## TASK 1B.  JOIN TRAINING AND TEST DATASETS INTO ONE DATASET.

library(dplyr)

## Create a character vector "variables" with names from "features".
variables <- features$V2

## Create a dataset with "test" measurements, and corresponding 
## "activity" and "subject" labels.

names(test_labels) <- c("activity")
names(test_subjectLabels) <- c("subject")
names(test) <- variables
testComplete <- cbind(test_labels, test_subjectLabels, test)

## Create a dataset with "train" measurements, and corresponding 
## "activity" and "subject" labels.

names(train_labels) <- c("activity")
names(train_subjectLabels) <- c("subject")
names(train) <- variables
trainComplete <- cbind(train_labels, train_subjectLabels, train)

## Join "test" and "train" datasets using rbind().
data <- rbind(testComplete, trainComplete)


## TASK 2.  EXTRACT MEASUREMENTS ON MEAN AND STANDARD DEVIATION

columnsToSelect <- c("activity", "subject", grep("[Mm]ean|[Ss]td", names(data), value=TRUE)) 
                ## create char vector with "activity", "subject", 
                ## plus variable names containing "mean" or "std"

dataExtract <- data[ ,columnsToSelect]
                ## Subset dataframe using the selected column names.



## TASK 3.  SUBSTITUTE DESCRIPTIVE ACTIVITY NAMES FOR ACTIVITY CODES.

mergedData <- merge(activity_labels, dataExtract,  
                        by.x = "V1", 
                        by.y = "activity",
                        all = TRUE)
mergedData_tbl <- tbl_df(mergedData)
mergedData_tbl <- mergedData_tbl %>%
                        select(-V1) %>%
                        rename(activity = V2)

## TASK 4.  ADD DESCRIPTIVE VARIABLE NAMES.

## The variable names for the measurements were taken from the 
## features.txt file and modified to remove underscores and 
## parentheses.  See codebook for explanation.

variableNames <- names(mergedData_tbl)
variableNames <- gsub("-mean()-", "Mean", variableNames, fixed=TRUE)
variableNames <- gsub("^t", "3D", variableNames)
variableNames <- gsub("Acc", "Accelerometer", variableNames, fixed=TRUE)
variableNames <- gsub("X", "XDirection", variableNames, fixed=TRUE)
variableNames <- gsub("Y", "YDirection", variableNames, fixed=TRUE)
variableNames <- gsub("Z", "ZDirection", variableNames, fixed=TRUE)
variableNames <- gsub("-std()-", "StdDev", variableNames, fixed=TRUE)
variableNames <- gsub("Mag", "Magnitude", variableNames, fixed=TRUE)
variableNames <- gsub("Gyro", "Gyroscope", variableNames, fixed=TRUE)
variableNames <- gsub("fBody", "frequencyBody", variableNames, fixed=TRUE)
variableNames <- gsub("-meanFreq()-", "MeanFrequency", variableNames, fixed=TRUE)
variableNames <- gsub("angle(", "angleBetween", variableNames, fixed=TRUE)
variableNames <- gsub(",gravity", "AndGravity", variableNames, fixed=TRUE)
variableNames <- gsub("Mean)", "Mean", variableNames, fixed=TRUE)
variableNames <- gsub("-mean()", "Mean", variableNames, fixed=TRUE)
variableNames <- gsub("-std()", "StdDev", variableNames, fixed=TRUE)
variableNames <- gsub("-meanFreq()", "MeanFrequency", variableNames, fixed=TRUE)
variableNames <- gsub("Betweent", "Between3D", variableNames, fixed=TRUE)
variableNames <- gsub("Gravity)", "Gravity", variableNames, fixed=TRUE)


## TASK 5.  CREATE INDEPENDENT TIDY DATASET WITH AVERAGE OF EACH 
## VARIABLE FOR EACH ACTIVITY AND EACH SUBJECT.

## Use dataset "mergedData_tbl" to create "newData"   
## Convert "activity", "activityCode" and "subject" into factor 
## variables.

mergedData_tbl$activity <- factor(mergedData_tbl$activity)
##mergedData_tbl$activityCode <- factor(mergedData_tbl$activityCode) 
mergedData_tbl$subject <- factor(mergedData_tbl$subject)

newData <- mergedData_tbl %>% 
                        group_by(activity, subject) %>%  
                        summarize_each(funs(mean))
                        
names(newData) <- variableNames



## SUBMIT NEW DATASET.

## Create a text file of "newData" to submit.

setwd(workingDir)
write.table(newData, file = "newData.txt", row.names=FALSE)

}

