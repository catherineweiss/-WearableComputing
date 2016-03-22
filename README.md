#-WearableComputing
Getting and Cleaning Data Course Project

#Objective

The purpose of this project is to create an R script, run_analysis.R, that accesses and manipulates a set of wearable computing data published by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, and Luca Oneto of Smartlab - Non Linear Complex Systems Laboratory.  The data were collected from experiments conducted on a group of 30 volunteers. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. The device has an embedded accelerometer and gyroscope and measures 3-axial linear acceleration and 3-axial angular velocity. The obtained dataset was broken into two datasets (training data and test data).  Both datasets include the measurements mentioned above, as well as computed variables (i.e., separation of the sensor acceleration signal into acceleration and gravity components, separation of variables from the time and frequency domain, and statistics including mean and standard deviation. A full description of the dataset is available at the site where the data was obtained:  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.  The data for the project are available at the following website: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.


#Five Tasks Accomplished by run_analysis.R

##TASK 1. Downloads the training and test datasets and merges them into one dataset
When a user launches run_analysis.R, a zip file (raw.zip) is downloaded into a directory "data" that is created in the user's working directory.  The script unzips the file into a directory called "UCI HAR Dataset".  Within the UCI HAR Dataset directory, there are the following files:
  - 'README.txt': inlcudes a description of the variables, both measured and computed. 
  - 'features_info.txt': Provides an explanation of how variables are named.
  - 'features.txt': List of all 561 variables in the train and test datasets.
  - 'activity_labels.txt': Links the 6 class labels with their activity name, referred to herein as "activity code".
  - 'train/X_train.txt': Training dataset.
  - 'train/y_train.txt': Labels for the train data set that correspond to the activity code (1 to 6).
  - 'train/subject_train.txt': Labels for the training data set that correspond to the subject number (1 to 30).
  - 'test/X_test.txt': Test dataset.
  - 'test/y_test.txt': Labels for the test data set that correspond to the activity code (1 to 6).
  - 'test/subject_test.txt': Labels for the test data set that correspond to the subject number (1 to 30).
There are subdirectories within test/ and train/ called 'Inertial Signals'; none of the files within these subdirectories are used in this project. 

In TASK 1A, 'run_analysis.R' reads all of the files listed above, except for 'README.txt' and 'features_info.txt'.  
In TASK 1B, a merged dataset 'data' is created in three steps:  (1) combining measurements from 'X_test' (7,352 observations) with the activity codes in 'y_test' and the subject ID numbers in 'subject_test' to create 'testComplete'; (2) combining measurements from 'X_train' (2,947 observations) with the activity codes in 'y_train' and the subject ID numbers in 'subject_train' to create 'trainComplete'; and (3) using rbind() to join the test and train datasets into the dataset 'data' (10,299 observations).


##TASK 2.  Extracts Only the Measurements on the Mean and Standard Deviation for Each Measurement
Variables that represent computed means and standard deviations for various measurements are extracted from 'data' by subsetting.  In order to create a vector for subsetting, the first step is to select the variables of 'X_train' and 'X_test' that pertain to mean and standard deviation.  To do this, the vector 'variables' is subsetted from the full list of 561 variables contained within 'features' using grep() and a search for relevant rational expressions.  The names "activity" and "subject" are added to 'variables' to create 'columnsToSelect'.  This vector, 'columnsToSelect' is used to subset 'data' into a new dataframe called 'dataExtract', a dataframe with 10,299 observations of 88 variables. 


##TASK 3.  Uses Descriptive Activity Names to Name the Activities in the Dataset 
The first column of the dataframe 'dataExtract', "activityCode", represents the class labels which correspond to 6 different activities (e.g., (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).  To make our dataset easier to read, descriptive activity names are substituted for the activity class labels using merge() within the dplyr package.  'dataExtract' is merged with 'activity_labels'.  Then the column with the class labels is removed and the column representing the activity names is renamed "activity". The new merged dataset is called 'mergedData_tbl'.  This dataframe also has 10,299 observations and 88 variables.


##TASK 4.  Labels the Dataset with Descriptive Variable Names
The variable names for 'mergedData_tbl' are modified to remove all hyphens and parentheses and to include more description and less abbreviation.  The variable names are as descriptive as possible, however they do not contain spaces so they may still require explanation.  A full description of the variable names is included in the Codebook, which is part of this repository. The original variable names UCI HAR Dataset (and as listed in 'features.txt') were modified using gsub().  


##TASK 5.  Creates a Second, Independent Tidy Dataset with the Average of Each Variable for Each Activity and Each Subject  
The final task that 'run_analysis.R' performs is to create 'newData'.  'newData' is a dataframe in which there is one observation for each unique activity/subject combination and the columns are filled with averages of the variables from 'mergedData_tbl'.  To accomplish this, the variables 'activity' and 'subject' were converted into factors.  The dataset 'mergedData_tbl' is grouped by "activity" and then "subject".  The function summarize_each() is used to compute the mean of each variable for each group.  The dimensions of the second, independent tidy dataset, 'newData', are 180 observations and 88 variables.  The script concludes with a command write.table(), which saves this dataset as the file 'newData.txt' in the user's working directory.
