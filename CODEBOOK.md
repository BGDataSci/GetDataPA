---
title: Codebook for Coursera Getting and Cleaning Data Programming Assignment
author: B Garnsey
date: 18-JUN-2015
output:
  html_document:
    keep_md: yes
---
 
## Project Description
This project was to take data a large complex data set available on line and 
process it into tidy data for latter analysis.  The data was available online
from the [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).
The data was captured from 30 volunteers wearing a Samsung Galaxy S II on their waist and performing 6 different activities. 

Our goals were to create one R script called run_analysis.R that does the following:
 
1.	Merges the training and the test sets to create one data set.
2.	Extracts only the measurements on the mean and standard deviation for each measurement. 
3.	Uses descriptive activity names to name the activities in the data set
4.	Appropriately labels the data set with descriptive variable names. 
5.	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
 
##Study design and data processing
RStudio was used to load files downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
and unzipped.  The unzipped data directory "UCI HAR Dataset" was placed into the working directory.  R library dplyr was used to help clean-up and tidy the data.
Many of the original fields were eliminated because they were not measures of "mean()" or "std()". Also characters were eliminated from column names that caused problems
with processing in R.  Some of the field names were so long that they showed up as duplicates in R.  These were eliminated to enable processing with dplyr functions as they
were not required for the data set we were looking for.

Data sets were merged, descriptive labels added and the resulting data was summarized after grouping by Subject ID and Activity.  The resulting independent
tidy data set was written out as a file.

###Collection of the raw data
This from the website of those collecting the original data:

Data Set Information:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

Check the [README.txt](https://github.com/BGDataSci/GetDataPA/blob/master/README.txt) file for further details about this dataset. 

A video of the experiment including an example of the 6 recorded activities with one of the participants can be seen in the following link: [Web Link](http://www.youtube.com/watch?v=XOEN9W05_4A)


Attribute Information:

For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.


 
###Notes on the original (raw) data 

The README.txt from the original data is here: [README.txt](https://github.com/BGDataSci/GetDataPA/blob/master/README.txt)
Even more information about the data is available in the [features_info.txt](https://github.com/BGDataSci/GetDataPA/blob/master/features_info.txt) file from the original. 

From the README file of Original Data:
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.
Fore more information about this dataset contact: activityrecognition@smartlab.ws
 
##Creating the tidy datafile
 
###Guide to create the tidy data file

Description on how to create the tidy data file: 

1. 	Download and unzip the data.
2. 	Read the data into objects for the observations, subjectID, and activities for both the test and training data.
3.	Combine the SubjectID and Activities with the observations using cbind on both training and test data.
4.	Combine the resulting training and and test datasets with rbind.
5.	Read in the 561 features names for the variables.
6.	Remove/replace characters from the feature names that will cause problems in processing.
7.	Apply the names to the columns of data
8.	Select Only the variables we are interest in, mean and std.
9.	Replace numerical factors with meaningful text factor names for the activities.
10.	Group by SubjectID and Activity. 
11.	Summarize the data with mean() function.
12.	Write the resulting summary file to disk.
 
###Cleaning of the data

The data is cleaned up by eliminating certain column names that cause problems with processing and eliminating columns that appear as duplicates after apply names to columns.
The only the columns which represent means and standard deviations are extracted.  Meaningful names are used to replace integer factors.  
Details of how the script works to clean the data can be found here[README](https://github.com/BGDataSci/GetDataPA/blob/master/README.md)
 
##Description of the variables in the project_tidy_data_summary.txt file
The file produced contains summary means of the variables in the raw data that
are grouped by SubjectID and Activity.  So for each subjectID/Activity pair there is a mean
of the variable.

The dimensions of the returned dataset are 180 rows with 68 variables.

Following are the variables in the datset: 

subjectID                : int  1 1 1 1 1 1 2 2 2 2 ... Values 1 to 30

Activity                 : Factor w/ 6 levels "LAYING","SITTING",..: 1 2 3 4 5 6 1 2 3 4 ...

The rest of the variables are normalized between -1 and 1:

tBodyAcc_mean_X          : num  0.222 0.261 0.279 0.277 0.289 ...
tBodyAcc_mean_Y          : num  -0.04051 -0.00131 -0.01614 -0.01738 -0.00992 ...
tBodyAcc_mean_Z          : num  -0.113 -0.105 -0.111 -0.111 -0.108 ...
tGravityAcc_mean_X       : num  -0.249 0.832 0.943 0.935 0.932 ...
tGravityAcc_mean_Y       : num  0.706 0.204 -0.273 -0.282 -0.267 ...
tGravityAcc_mean_Z       : num  0.4458 0.332 0.0135 -0.0681 -0.0621 ...
tBodyAccJerk_mean_X      : num  0.0811 0.0775 0.0754 0.074 0.0542 ...
tBodyAccJerk_mean_Y      : num  0.003838 -0.000619 0.007976 0.028272 0.02965 ...
tBodyAccJerk_mean_Z      : num  0.01083 -0.00337 -0.00369 -0.00417 -0.01097 ...
tBodyGyro_mean_X         : num  -0.0166 -0.0454 -0.024 -0.0418 -0.0351 ...
tBodyGyro_mean_Y         : num  -0.0645 -0.0919 -0.0594 -0.0695 -0.0909 ...
tBodyGyro_mean_Z         : num  0.1487 0.0629 0.0748 0.0849 0.0901 ...
tBodyGyroJerk_mean_X     : num  -0.1073 -0.0937 -0.0996 -0.09 -0.074 ...
tBodyGyroJerk_mean_Y     : num  -0.0415 -0.0402 -0.0441 -0.0398 -0.044 ...
tBodyGyroJerk_mean_Z     : num  -0.0741 -0.0467 -0.049 -0.0461 -0.027 ...
tBodyAccMag_mean         : num  -0.8419 -0.9485 -0.9843 -0.137 0.0272 ...
tGravityAccMag_mean      : num  -0.8419 -0.9485 -0.9843 -0.137 0.0272 ...
tBodyAccJerkMag_mean     : num  -0.9544 -0.9874 -0.9924 -0.1414 -0.0894 ...
tBodyGyroMag_mean        : num  -0.8748 -0.9309 -0.9765 -0.161 -0.0757 ...
tBodyGyroJerkMag_mean    : num  -0.963 -0.992 -0.995 -0.299 -0.295 ...
fBodyAcc_mean_X          : num  -0.9391 -0.9796 -0.9952 -0.2028 0.0382 ...
fBodyAcc_mean_Y          : num  -0.86707 -0.94408 -0.97707 0.08971 0.00155 ...
fBodyAcc_mean_Z          : num  -0.883 -0.959 -0.985 -0.332 -0.226 ...
fBodyAccJerk_mean_X      : num  -0.9571 -0.9866 -0.9946 -0.1705 -0.0277 ...
fBodyAccJerk_mean_Y      : num  -0.9225 -0.9816 -0.9854 -0.0352 -0.1287 ...
fBodyAccJerk_mean_Z      : num  -0.948 -0.986 -0.991 -0.469 -0.288 ...
fBodyGyro_mean_X         : num  -0.85 -0.976 -0.986 -0.339 -0.352 ...
fBodyGyro_mean_Y         : num  -0.9522 -0.9758 -0.989 -0.1031 -0.0557 ...
fBodyGyro_mean_Z         : num  -0.9093 -0.9513 -0.9808 -0.2559 -0.0319 ...
fBodyAccMag_mean         : num  -0.8618 -0.9478 -0.9854 -0.1286 0.0966 ...
fBodyBodyAccJerkMag_mean : num  -0.9333 -0.9853 -0.9925 -0.0571 0.0262 ...
fBodyBodyGyroMag_mean    : num  -0.862 -0.958 -0.985 -0.199 -0.186 ...
fBodyBodyGyroJerkMag_mean: num  -0.942 -0.99 -0.995 -0.319 -0.282 ...
tBodyAcc_std_X           : num  -0.928 -0.977 -0.996 -0.284 0.03 ...
tBodyAcc_std_Y           : num  -0.8368 -0.9226 -0.9732 0.1145 -0.0319 ...
tBodyAcc_std_Z           : num  -0.826 -0.94 -0.98 -0.26 -0.23 ...
tGravityAcc_std_X        : num  -0.897 -0.968 -0.994 -0.977 -0.951 ...
tGravityAcc_std_Y        : num  -0.908 -0.936 -0.981 -0.971 -0.937 ...
tGravityAcc_std_Z        : num  -0.852 -0.949 -0.976 -0.948 -0.896 ...
tBodyAccJerk_std_X       : num  -0.9585 -0.9864 -0.9946 -0.1136 -0.0123 ...
tBodyAccJerk_std_Y       : num  -0.924 -0.981 -0.986 0.067 -0.102 ...
tBodyAccJerk_std_Z       : num  -0.955 -0.988 -0.992 -0.503 -0.346 ...
tBodyGyro_std_X          : num  -0.874 -0.977 -0.987 -0.474 -0.458 ...
tBodyGyro_std_Y          : num  -0.9511 -0.9665 -0.9877 -0.0546 -0.1263 ...
tBodyGyro_std_Z          : num  -0.908 -0.941 -0.981 -0.344 -0.125 ...
tBodyGyroJerk_std_X      : num  -0.919 -0.992 -0.993 -0.207 -0.487 ...
tBodyGyroJerk_std_Y      : num  -0.968 -0.99 -0.995 -0.304 -0.239 ...
tBodyGyroJerk_std_Z      : num  -0.958 -0.988 -0.992 -0.404 -0.269 ...
tBodyAccMag_std          : num  -0.7951 -0.9271 -0.9819 -0.2197 0.0199 ...
tGravityAccMag_std       : num  -0.7951 -0.9271 -0.9819 -0.2197 0.0199 ...
tBodyAccJerkMag_std      : num  -0.9282 -0.9841 -0.9931 -0.0745 -0.0258 ...
tBodyGyroMag_std         : num  -0.819 -0.935 -0.979 -0.187 -0.226 ...
tBodyGyroJerkMag_std     : num  -0.936 -0.988 -0.995 -0.325 -0.307 ...
fBodyAcc_std_X           : num  -0.9244 -0.9764 -0.996 -0.3191 0.0243 ...
fBodyAcc_std_Y           : num  -0.834 -0.917 -0.972 0.056 -0.113 ...
fBodyAcc_std_Z           : num  -0.813 -0.934 -0.978 -0.28 -0.298 ...
fBodyAccJerk_std_X       : num  -0.9642 -0.9875 -0.9951 -0.1336 -0.0863 ...
fBodyAccJerk_std_Y       : num  -0.932 -0.983 -0.987 0.107 -0.135 ...
fBodyAccJerk_std_Z       : num  -0.961 -0.988 -0.992 -0.535 -0.402 ...
fBodyGyro_std_X          : num  -0.882 -0.978 -0.987 -0.517 -0.495 ...
fBodyGyro_std_Y          : num  -0.9512 -0.9623 -0.9871 -0.0335 -0.1814 ...
fBodyGyro_std_Z          : num  -0.917 -0.944 -0.982 -0.437 -0.238 ...
fBodyAccMag_std          : num  -0.798 -0.928 -0.982 -0.398 -0.187 ...
fBodyBodyAccJerkMag_std  : num  -0.922 -0.982 -0.993 -0.103 -0.104 ...
fBodyBodyGyroMag_std     : num  -0.824 -0.932 -0.978 -0.321 -0.398 ...
fBodyBodyGyroJerkMag_std : num  -0.933 -0.987 -0.995 -0.382 -0.392 ...    
 

Original raw variable **tBodyAcc-std()-Y** was changed to **tBodyAcc_std_Y**, and is in g, standard gravity units
Original raw variable **tBodyAcc-std()-Z** was changed to **tBodyAcc_std_Z**, and is in g, standard gravity unitsOriginal raw variable **tGravityAcc-std()-X** was changed to **tGravityAcc_std_X**, and is in g, standard gravity units

Original raw variable **tGravityAcc-std()-Y** was changed to **tGravityAcc_std_Y**, and is in g, standard gravity units

Original raw variable **tGravityAcc-std()-Z** was changed to **tGravityAcc_std_Z**, and is in g, standard gravity units
Original raw variable **tBodyAccJerk-std()-X** was changed to **tBodyAccJerk_std_X**, and is in g, standard gravity units
Original raw variable **tBodyAccJerk-std()-Y** was changed to **tBodyAccJerk_std_Y**, and is in g, standard gravity units
Original raw variable **tBodyAccJerk-std()-Z** was changed to **tBodyAccJerk_std_Z**, and is in g, standard gravity units
Original raw variable **tBodyGyro-std()-X** was changed to **tBodyGyro_std_X**, and is in radians per second
Original raw variable **tBodyGyro-std()-Y** was changed to **tBodyGyro_std_Y**, and is in radians per second
Original raw variable **tBodyGyro-std()-Z** was changed to **tBodyGyro_std_Z**, and is in radians per second
Original raw variable **tBodyGyroJerk-std()-X** was changed to **tBodyGyroJerk_std_X**, and is in radians per second
Original raw variable **tBodyGyroJerk-std()-Y** was changed to **tBodyGyroJerk_std_Y**, and is in radians per second
Original raw variable **tBodyGyroJerk-std()-Z** was changed to **tBodyGyroJerk_std_Z**, and is in radians per second
Original raw variable **tBodyAccMag-std()** was changed to **tBodyAccMag_std**, and is in g, standard gravity units
Original raw variable **tGravityAccMag-std()** was changed to **tGravityAccMag_std**, and is in g, standard gravity units
Original raw variable **tBodyAccJerkMag-std()** was changed to **tBodyAccJerkMag_std**, and is in g, standard gravity units
Original raw variable **tBodyGyroMag-std()** was changed to **tBodyGyroMag_std**, and is in radians per second
Original raw variable **tBodyGyroJerkMag-std()** was changed to **tBodyGyroJerkMag_std**, and is in radians per second
Original raw variable **fBodyAcc-std()-X** was changed to **fBodyAcc_std_X**, and is in g, standard gravity units
Original raw variable **fBodyAcc-std()-Y** was changed to **fBodyAcc_std_Y**, and is in g, standard gravity units
Original raw variable **fBodyAcc-std()-Z** was changed to **fBodyAcc_std_Z**, and is in g, standard gravity units
Original raw variable **fBodyAccJerk-std()-X** was changed to **fBodyAccJerk_std_X**, and is in g, standard gravity units
Original raw variable **fBodyAccJerk-std()-Y** was changed to **fBodyAccJerk_std_Y**, and is in g, standard gravity units
Original raw variable **fBodyAccJerk-std()-Z** was changed to **fBodyAccJerk_std_Z**, and is in g, standard gravity units
Original raw variable **fBodyGyro-std()-X** was changed to **fBodyGyro_std_X**, and is in radians per second
Original raw variable **fBodyGyro-std()-Y** was changed to **fBodyGyro_std_Y**, and is in radians per second
Original raw variable **fBodyGyro-std()-Z** was changed to **fBodyGyro_std_Z**, and is in radians per second
Original raw variable **fBodyAccMag-std()** was changed to **fBodyAccMag_std**, and is in g, standard gravity units
Original raw variable **fBodyBodyAccJerkMag-std()** was changed to **fBodyBodyAccJerkMag_std**, and is in g, standard gravity units
Original raw variable **fBodyBodyGyroMag-std()** was changed to **fBodyBodyGyroMag_std**, and is in radians per second
Original raw variable **fBodyBodyGyroJerkMag-std()** was changed to **fBodyBodyGyroJerkMag_std**, and is in radians per second
More information about the variable names is available in the [features_info.txt](https://github.com/BGDataSci/GetDataPA/blob/master/features_info.txt) file from the original. 

 
 
##Sources
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.
 
