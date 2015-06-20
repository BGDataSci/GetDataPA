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
and unzipped.  The requisite files were placed into ./data directory.  R library dplyr was used to help clean-up and tidy the data.
Many of the original fields were eliminated because they were not measures of "mean()" or "std()". Also characters were eliminated from column names that caused problems
with processing in R.  Some of the field names were so long that they showed up as duplicates in R.  These were eliminated to enable processing as they
were not required for the data set we were looking for.

Data sets were merged, descriptive labels added and the resulting data was summarized after grouping by Subject ID and Activity.  The resulting independent
tidy data set was written out as a file.

###Collection of the raw data
This from the website of those collecting the original data:
Data Set Information:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

Check the README.txt file for further details about this dataset. 

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
Fore more infromation obout this dataset contact: activityrecognition@smartlab.ws
 
##Creating the tidy datafile
 
###Guide to create the tidy data file
Description on how to create the tidy data file (1. download the data, ...)/
 
###Cleaning of the data
Short, high-level description of what the cleaning script does. 
Details of how the script works to clean the data can be found here[README](https://github.com/BGDataSci/GetDataPA/blob/master/README.md)
 
##Description of the variables in the project_tidy_data_summary.txt file
General description of the file including:
 - Dimensions of the dataset
 - Summary of the data
 - Variables present in the dataset
 The dimensions of the returned dataset are 180 rows with 68 variables.
 
 A summary of the data follows:
   subjectID                  Activity  tBodyAcc_mean_X  tBodyAcc_mean_Y    
 Min.   : 1.0   LAYING            :30   Min.   :0.2216   Min.   :-0.040514  
 1st Qu.: 8.0   SITTING           :30   1st Qu.:0.2712   1st Qu.:-0.020022  
 Median :15.5   STANDING          :30   Median :0.2770   Median :-0.017262  
 Mean   :15.5   WALKING           :30   Mean   :0.2743   Mean   :-0.017876  
 3rd Qu.:23.0   WALKING_DOWNSTAIRS:30   3rd Qu.:0.2800   3rd Qu.:-0.014936  
 Max.   :30.0   WALKING_UPSTAIRS  :30   Max.   :0.3015   Max.   :-0.001308  
 tBodyAcc_mean_Z    tGravityAcc_mean_X tGravityAcc_mean_Y tGravityAcc_mean_Z
 Min.   :-0.15251   Min.   :-0.6800    Min.   :-0.47989   Min.   :-0.49509  
 1st Qu.:-0.11207   1st Qu.: 0.8376    1st Qu.:-0.23319   1st Qu.:-0.11726  
 Median :-0.10819   Median : 0.9208    Median :-0.12782   Median : 0.02384  
 Mean   :-0.10916   Mean   : 0.6975    Mean   :-0.01621   Mean   : 0.07413  
 3rd Qu.:-0.10443   3rd Qu.: 0.9425    3rd Qu.: 0.08773   3rd Qu.: 0.14946  
 Max.   :-0.07538   Max.   : 0.9745    Max.   : 0.95659   Max.   : 0.95787  
 tBodyAccJerk_mean_X tBodyAccJerk_mean_Y  tBodyAccJerk_mean_Z tBodyGyro_mean_X  
 Min.   :0.04269     Min.   :-0.0386872   Min.   :-0.067458   Min.   :-0.20578  
 1st Qu.:0.07396     1st Qu.: 0.0004664   1st Qu.:-0.010601   1st Qu.:-0.04712  
 Median :0.07640     Median : 0.0094698   Median :-0.003861   Median :-0.02871  
 Mean   :0.07947     Mean   : 0.0075652   Mean   :-0.004953   Mean   :-0.03244  
 3rd Qu.:0.08330     3rd Qu.: 0.0134008   3rd Qu.: 0.001958   3rd Qu.:-0.01676  
 Max.   :0.13019     Max.   : 0.0568186   Max.   : 0.038053   Max.   : 0.19270  
 tBodyGyro_mean_Y   tBodyGyro_mean_Z   tBodyGyroJerk_mean_X tBodyGyroJerk_mean_Y
 Min.   :-0.20421   Min.   :-0.07245   Min.   :-0.15721     Min.   :-0.07681    
 1st Qu.:-0.08955   1st Qu.: 0.07475   1st Qu.:-0.10322     1st Qu.:-0.04552    
 Median :-0.07318   Median : 0.08512   Median :-0.09868     Median :-0.04112    
 Mean   :-0.07426   Mean   : 0.08744   Mean   :-0.09606     Mean   :-0.04269    
 3rd Qu.:-0.06113   3rd Qu.: 0.10177   3rd Qu.:-0.09110     3rd Qu.:-0.03842    
 Max.   : 0.02747   Max.   : 0.17910   Max.   :-0.02209     Max.   :-0.01320    
 tBodyGyroJerk_mean_Z tBodyAccMag_mean  tGravityAccMag_mean tBodyAccJerkMag_mean
 Min.   :-0.092500    Min.   :-0.9865   Min.   :-0.9865     Min.   :-0.9928     
 1st Qu.:-0.061725    1st Qu.:-0.9573   1st Qu.:-0.9573     1st Qu.:-0.9807     
 Median :-0.053430    Median :-0.4829   Median :-0.4829     Median :-0.8168     
 Mean   :-0.054802    Mean   :-0.4973   Mean   :-0.4973     Mean   :-0.6079     
 3rd Qu.:-0.048985    3rd Qu.:-0.0919   3rd Qu.:-0.0919     3rd Qu.:-0.2456     
 Max.   :-0.006941    Max.   : 0.6446   Max.   : 0.6446     Max.   : 0.4345     
 tBodyGyroMag_mean tBodyGyroJerkMag_mean fBodyAcc_mean_X   fBodyAcc_mean_Y   
 Min.   :-0.9807   Min.   :-0.99732      Min.   :-0.9952   Min.   :-0.98903  
 1st Qu.:-0.9461   1st Qu.:-0.98515      1st Qu.:-0.9787   1st Qu.:-0.95361  
 Median :-0.6551   Median :-0.86479      Median :-0.7691   Median :-0.59498  
 Mean   :-0.5652   Mean   :-0.73637      Mean   :-0.5758   Mean   :-0.48873  
 3rd Qu.:-0.2159   3rd Qu.:-0.51186      3rd Qu.:-0.2174   3rd Qu.:-0.06341  
 Max.   : 0.4180   Max.   : 0.08758      Max.   : 0.5370   Max.   : 0.52419  
 fBodyAcc_mean_Z   fBodyAccJerk_mean_X fBodyAccJerk_mean_Y fBodyAccJerk_mean_Z
 Min.   :-0.9895   Min.   :-0.9946     Min.   :-0.9894     Min.   :-0.9920    
 1st Qu.:-0.9619   1st Qu.:-0.9828     1st Qu.:-0.9725     1st Qu.:-0.9796    
 Median :-0.7236   Median :-0.8126     Median :-0.7817     Median :-0.8707    
 Mean   :-0.6297   Mean   :-0.6139     Mean   :-0.5882     Mean   :-0.7144    
 3rd Qu.:-0.3183   3rd Qu.:-0.2820     3rd Qu.:-0.1963     3rd Qu.:-0.4697    
 Max.   : 0.2807   Max.   : 0.4743     Max.   : 0.2767     Max.   : 0.1578    
 fBodyGyro_mean_X  fBodyGyro_mean_Y  fBodyGyro_mean_Z  fBodyAccMag_mean 
 Min.   :-0.9931   Min.   :-0.9940   Min.   :-0.9860   Min.   :-0.9868  
 1st Qu.:-0.9697   1st Qu.:-0.9700   1st Qu.:-0.9624   1st Qu.:-0.9560  
 Median :-0.7300   Median :-0.8141   Median :-0.7909   Median :-0.6703  
 Mean   :-0.6367   Mean   :-0.6767   Mean   :-0.6044   Mean   :-0.5365  
 3rd Qu.:-0.3387   3rd Qu.:-0.4458   3rd Qu.:-0.2635   3rd Qu.:-0.1622  
 Max.   : 0.4750   Max.   : 0.3288   Max.   : 0.4924   Max.   : 0.5866  
 fBodyBodyAccJerkMag_mean fBodyBodyGyroMag_mean fBodyBodyGyroJerkMag_mean
 Min.   :-0.9940          Min.   :-0.9865       Min.   :-0.9976          
 1st Qu.:-0.9770          1st Qu.:-0.9616       1st Qu.:-0.9813          
 Median :-0.7940          Median :-0.7657       Median :-0.8779          
 Mean   :-0.5756          Mean   :-0.6671       Mean   :-0.7564          
 3rd Qu.:-0.1872          3rd Qu.:-0.4087       3rd Qu.:-0.5831          
 Max.   : 0.5384          Max.   : 0.2040       Max.   : 0.1466          
 tBodyAcc_std_X    tBodyAcc_std_Y     tBodyAcc_std_Z    tGravityAcc_std_X
 Min.   :-0.9961   Min.   :-0.99024   Min.   :-0.9877   Min.   :-0.9968  
 1st Qu.:-0.9799   1st Qu.:-0.94205   1st Qu.:-0.9498   1st Qu.:-0.9825  
 Median :-0.7526   Median :-0.50897   Median :-0.6518   Median :-0.9695  
 Mean   :-0.5577   Mean   :-0.46046   Mean   :-0.5756   Mean   :-0.9638  
 3rd Qu.:-0.1984   3rd Qu.:-0.03077   3rd Qu.:-0.2306   3rd Qu.:-0.9509  
 Max.   : 0.6269   Max.   : 0.61694   Max.   : 0.6090   Max.   :-0.8296  
 tGravityAcc_std_Y tGravityAcc_std_Z tBodyAccJerk_std_X tBodyAccJerk_std_Y
 Min.   :-0.9942   Min.   :-0.9910   Min.   :-0.9946    Min.   :-0.9895   
 1st Qu.:-0.9711   1st Qu.:-0.9605   1st Qu.:-0.9832    1st Qu.:-0.9724   
 Median :-0.9590   Median :-0.9450   Median :-0.8104    Median :-0.7756   
 Mean   :-0.9524   Mean   :-0.9364   Mean   :-0.5949    Mean   :-0.5654   
 3rd Qu.:-0.9370   3rd Qu.:-0.9180   3rd Qu.:-0.2233    3rd Qu.:-0.1483   
 Max.   :-0.6436   Max.   :-0.6102   Max.   : 0.5443    Max.   : 0.3553   
 tBodyAccJerk_std_Z tBodyGyro_std_X   tBodyGyro_std_Y   tBodyGyro_std_Z  
 Min.   :-0.99329   Min.   :-0.9943   Min.   :-0.9942   Min.   :-0.9855  
 1st Qu.:-0.98266   1st Qu.:-0.9735   1st Qu.:-0.9629   1st Qu.:-0.9609  
 Median :-0.88366   Median :-0.7890   Median :-0.8017   Median :-0.8010  
 Mean   :-0.73596   Mean   :-0.6916   Mean   :-0.6533   Mean   :-0.6164  
 3rd Qu.:-0.51212   3rd Qu.:-0.4414   3rd Qu.:-0.4196   3rd Qu.:-0.3106  
 Max.   : 0.03102   Max.   : 0.2677   Max.   : 0.4765   Max.   : 0.5649  
 tBodyGyroJerk_std_X tBodyGyroJerk_std_Y tBodyGyroJerk_std_Z tBodyAccMag_std  
 Min.   :-0.9965     Min.   :-0.9971     Min.   :-0.9954     Min.   :-0.9865  
 1st Qu.:-0.9800     1st Qu.:-0.9832     1st Qu.:-0.9848     1st Qu.:-0.9430  
 Median :-0.8396     Median :-0.8942     Median :-0.8610     Median :-0.6074  
 Mean   :-0.7036     Mean   :-0.7636     Mean   :-0.7096     Mean   :-0.5439  
 3rd Qu.:-0.4629     3rd Qu.:-0.5861     3rd Qu.:-0.4741     3rd Qu.:-0.2090  
 Max.   : 0.1791     Max.   : 0.2959     Max.   : 0.1932     Max.   : 0.4284  
 tGravityAccMag_std tBodyAccJerkMag_std tBodyGyroMag_std  tBodyGyroJerkMag_std
 Min.   :-0.9865    Min.   :-0.9946     Min.   :-0.9814   Min.   :-0.9977     
 1st Qu.:-0.9430    1st Qu.:-0.9765     1st Qu.:-0.9476   1st Qu.:-0.9805     
 Median :-0.6074    Median :-0.8014     Median :-0.7420   Median :-0.8809     
 Mean   :-0.5439    Mean   :-0.5842     Mean   :-0.6304   Mean   :-0.7550     
 3rd Qu.:-0.2090    3rd Qu.:-0.2173     3rd Qu.:-0.3602   3rd Qu.:-0.5767     
 Max.   : 0.4284    Max.   : 0.4506     Max.   : 0.3000   Max.   : 0.2502     
 fBodyAcc_std_X    fBodyAcc_std_Y     fBodyAcc_std_Z    fBodyAccJerk_std_X
 Min.   :-0.9966   Min.   :-0.99068   Min.   :-0.9872   Min.   :-0.9951   
 1st Qu.:-0.9820   1st Qu.:-0.94042   1st Qu.:-0.9459   1st Qu.:-0.9847   
 Median :-0.7470   Median :-0.51338   Median :-0.6441   Median :-0.8254   
 Mean   :-0.5522   Mean   :-0.48148   Mean   :-0.5824   Mean   :-0.6121   
 3rd Qu.:-0.1966   3rd Qu.:-0.07913   3rd Qu.:-0.2655   3rd Qu.:-0.2475   
 Max.   : 0.6585   Max.   : 0.56019   Max.   : 0.6871   Max.   : 0.4768   
 fBodyAccJerk_std_Y fBodyAccJerk_std_Z  fBodyGyro_std_X   fBodyGyro_std_Y  
 Min.   :-0.9905    Min.   :-0.993108   Min.   :-0.9947   Min.   :-0.9944  
 1st Qu.:-0.9737    1st Qu.:-0.983747   1st Qu.:-0.9750   1st Qu.:-0.9602  
 Median :-0.7852    Median :-0.895121   Median :-0.8086   Median :-0.7964  
 Mean   :-0.5707    Mean   :-0.756489   Mean   :-0.7110   Mean   :-0.6454  
 3rd Qu.:-0.1685    3rd Qu.:-0.543787   3rd Qu.:-0.4813   3rd Qu.:-0.4154  
 Max.   : 0.3498    Max.   :-0.006236   Max.   : 0.1966   Max.   : 0.6462  
 fBodyGyro_std_Z   fBodyAccMag_std   fBodyBodyAccJerkMag_std fBodyBodyGyroMag_std
 Min.   :-0.9867   Min.   :-0.9876   Min.   :-0.9944         Min.   :-0.9815     
 1st Qu.:-0.9643   1st Qu.:-0.9452   1st Qu.:-0.9752         1st Qu.:-0.9488     
 Median :-0.8224   Median :-0.6513   Median :-0.8126         Median :-0.7727     
 Mean   :-0.6577   Mean   :-0.6210   Mean   :-0.5992         Mean   :-0.6723     
 3rd Qu.:-0.3916   3rd Qu.:-0.3654   3rd Qu.:-0.2668         3rd Qu.:-0.4277     
 Max.   : 0.5225   Max.   : 0.1787   Max.   : 0.3163         Max.   : 0.2367     
 fBodyBodyGyroJerkMag_std
 Min.   :-0.9976         
 1st Qu.:-0.9802         
 Median :-0.8941         
 Mean   :-0.7715         
 3rd Qu.:-0.6081         
 Max.   : 0.2878         
 
<p>Original raw variable \*\*tBodyAcc-mean()-X\*\* was changed to \*\*tBodyAcc_mean_X\*\*, and is in g, standard gravity units<-p>
<p>Original raw variable \*\*tBodyAcc-mean()-Y\*\* was changed to \*\*tBodyAcc_mean_Y\*\*, and is in g, standard gravity units<-p>
<p>Original raw variable \*\*tBodyAcc-mean()-Z\*\* was changed to \*\*tBodyAcc_mean_Z\*\*, and is in g, standard gravity units<-p>
<p>Original raw variable \*\*tGravityAcc-mean()-X\*\* was changed to \*\*tGravityAcc_mean_X\*\*, and is in g, standard gravity units<-p>
<p>Original raw variable \*\*tGravityAcc-mean()-Y\*\* was changed to \*\*tGravityAcc_mean_Y\*\*, and is in g, standard gravity units<-p>
<p>Original raw variable \*\*tGravityAcc-mean()-Z\*\* was changed to \*\*tGravityAcc_mean_Z\*\*, and is in g, standard gravity units<-p>
<p>Original raw variable \*\*tBodyAccJerk-mean()-X\*\* was changed to \*\*tBodyAccJerk_mean_X\*\*, and is in g, standard gravity units<-p>
<p>Original raw variable \*\*tBodyAccJerk-mean()-Y\*\* was changed to \*\*tBodyAccJerk_mean_Y\*\*, and is in g, standard gravity units<-p>
<p>Original raw variable \*\*tBodyAccJerk-mean()-Z\*\* was changed to \*\*tBodyAccJerk_mean_Z\*\*, and is in g, standard gravity units<-p>
<p>Original raw variable \*\*tBodyGyro-mean()-X\*\* was changed to \*\*tBodyGyro_mean_X\*\*, and is in radians per second<-p>
<p>Original raw variable \*\*tBodyGyro-mean()-Y\*\* was changed to \*\*tBodyGyro_mean_Y\*\*, and is in radians per second<-p>
<p>Original raw variable \*\*tBodyGyro-mean()-Z\*\* was changed to \*\*tBodyGyro_mean_Z\*\*, and is in radians per second<-p>
<p>Original raw variable \*\*tBodyGyroJerk-mean()-X\*\* was changed to \*\*tBodyGyroJerk_mean_X\*\*, and is in radians per second<-p>
<p>Original raw variable \*\*tBodyGyroJerk-mean()-Y\*\* was changed to \*\*tBodyGyroJerk_mean_Y\*\*, and is in radians per second<-p>
<p>Original raw variable \*\*tBodyGyroJerk-mean()-Z\*\* was changed to \*\*tBodyGyroJerk_mean_Z\*\*, and is in radians per second<-p>
<p>Original raw variable \*\*tBodyAccMag-mean()\*\* was changed to \*\*tBodyAccMag_mean\*\*, and is in g, standard gravity units<-p>
<p>Original raw variable \*\*tGravityAccMag-mean()\*\* was changed to \*\*tGravityAccMag_mean\*\*, and is in g, standard gravity units<-p>
<p>Original raw variable \*\*tBodyAccJerkMag-mean()\*\* was changed to \*\*tBodyAccJerkMag_mean\*\*, and is in g, standard gravity units<-p>
<p>Original raw variable \*\*tBodyGyroMag-mean()\*\* was changed to \*\*tBodyGyroMag_mean\*\*, and is in radians per second<-p>
<p>Original raw variable \*\*tBodyGyroJerkMag-mean()\*\* was changed to \*\*tBodyGyroJerkMag_mean\*\*, and is in radians per second<-p>
<p>Original raw variable \*\*fBodyAcc-mean()-X\*\* was changed to \*\*fBodyAcc_mean_X\*\*, and is in g, standard gravity units<-p>
<p>Original raw variable \*\*fBodyAcc-mean()-Y\*\* was changed to \*\*fBodyAcc_mean_Y\*\*, and is in g, standard gravity units<-p>
<p>Original raw variable \*\*fBodyAcc-mean()-Z\*\* was changed to \*\*fBodyAcc_mean_Z\*\*, and is in g, standard gravity units<-p>
<p>Original raw variable \*\*fBodyAccJerk-mean()-X\*\* was changed to \*\*fBodyAccJerk_mean_X\*\*, and is in g, standard gravity units<-p>
<p>Original raw variable \*\*fBodyAccJerk-mean()-Y\*\* was changed to \*\*fBodyAccJerk_mean_Y\*\*, and is in g, standard gravity units<-p>
<p>Original raw variable \*\*fBodyAccJerk-mean()-Z\*\* was changed to \*\*fBodyAccJerk_mean_Z\*\*, and is in g, standard gravity units<-p>
<p>Original raw variable \*\*fBodyGyro-mean()-X\*\* was changed to \*\*fBodyGyro_mean_X\*\*, and is in radians per second<-p>
<p>Original raw variable \*\*fBodyGyro-mean()-Y\*\* was changed to \*\*fBodyGyro_mean_Y\*\*, and is in radians per second<-p>
<p>Original raw variable \*\*fBodyGyro-mean()-Z\*\* was changed to \*\*fBodyGyro_mean_Z\*\*, and is in radians per second<-p>
<p>Original raw variable \*\*fBodyAccMag-mean()\*\* was changed to \*\*fBodyAccMag_mean\*\*, and is in g, standard gravity units<-p>
<p>Original raw variable \*\*fBodyBodyAccJerkMag-mean()\*\* was changed to \*\*fBodyBodyAccJerkMag_mean\*\*, and is in g, standard gravity units<-p>
<p>Original raw variable \*\*fBodyBodyGyroMag-mean()\*\* was changed to \*\*fBodyBodyGyroMag_mean\*\*, and is in radians per second<-p>
<p>Original raw variable \*\*fBodyBodyGyroJerkMag-mean()\*\* was changed to \*\*fBodyBodyGyroJerkMag_mean\*\*, and is in radians per second<-p>
<p>Original raw variable \*\*tBodyAcc-std()-X\*\* was changed to \*\*tBodyAcc_std_X\*\*, and is in g, standard gravity units<-p>
<p>Original raw variable \*\*tBodyAcc-std()-Y\*\* was changed to \*\*tBodyAcc_std_Y\*\*, and is in g, standard gravity units<-p>
<p>Original raw variable \*\*tBodyAcc-std()-Z\*\* was changed to \*\*tBodyAcc_std_Z\*\*, and is in g, standard gravity units<-p>
<p>Original raw variable \*\*tGravityAcc-std()-X\*\* was changed to \*\*tGravityAcc_std_X\*\*, and is in g, standard gravity units<-p>
<p>Original raw variable \*\*tGravityAcc-std()-Y\*\* was changed to \*\*tGravityAcc_std_Y\*\*, and is in g, standard gravity units<-p>
<p>Original raw variable \*\*tGravityAcc-std()-Z\*\* was changed to \*\*tGravityAcc_std_Z\*\*, and is in g, standard gravity units<-p>
<p>Original raw variable \*\*tBodyAccJerk-std()-X\*\* was changed to \*\*tBodyAccJerk_std_X\*\*, and is in g, standard gravity units<-p>
<p>Original raw variable \*\*tBodyAccJerk-std()-Y\*\* was changed to \*\*tBodyAccJerk_std_Y\*\*, and is in g, standard gravity units<-p>
<p>Original raw variable \*\*tBodyAccJerk-std()-Z\*\* was changed to \*\*tBodyAccJerk_std_Z\*\*, and is in g, standard gravity units<-p>
<p>Original raw variable \*\*tBodyGyro-std()-X\*\* was changed to \*\*tBodyGyro_std_X\*\*, and is in radians per second<-p>
<p>Original raw variable \*\*tBodyGyro-std()-Y\*\* was changed to \*\*tBodyGyro_std_Y\*\*, and is in radians per second<-p>
<p>Original raw variable \*\*tBodyGyro-std()-Z\*\* was changed to \*\*tBodyGyro_std_Z\*\*, and is in radians per second<-p>
<p>Original raw variable \*\*tBodyGyroJerk-std()-X\*\* was changed to \*\*tBodyGyroJerk_std_X\*\*, and is in radians per second<-p>
<p>Original raw variable \*\*tBodyGyroJerk-std()-Y\*\* was changed to \*\*tBodyGyroJerk_std_Y\*\*, and is in radians per second<-p>
<p>Original raw variable \*\*tBodyGyroJerk-std()-Z\*\* was changed to \*\*tBodyGyroJerk_std_Z\*\*, and is in radians per second<-p>
<p>Original raw variable \*\*tBodyAccMag-std()\*\* was changed to \*\*tBodyAccMag_std\*\*, and is in g, standard gravity units<-p>
<p>Original raw variable \*\*tGravityAccMag-std()\*\* was changed to \*\*tGravityAccMag_std\*\*, and is in g, standard gravity units<-p>
<p>Original raw variable \*\*tBodyAccJerkMag-std()\*\* was changed to \*\*tBodyAccJerkMag_std\*\*, and is in g, standard gravity units<-p>
<p>Original raw variable \*\*tBodyGyroMag-std()\*\* was changed to \*\*tBodyGyroMag_std\*\*, and is in radians per second<-p>
<p>Original raw variable \*\*tBodyGyroJerkMag-std()\*\* was changed to \*\*tBodyGyroJerkMag_std\*\*, and is in radians per second<-p>
<p>Original raw variable \*\*fBodyAcc-std()-X\*\* was changed to \*\*fBodyAcc_std_X\*\*, and is in g, standard gravity units<-p>
<p>Original raw variable \*\*fBodyAcc-std()-Y\*\* was changed to \*\*fBodyAcc_std_Y\*\*, and is in g, standard gravity units<-p>
<p>Original raw variable \*\*fBodyAcc-std()-Z\*\* was changed to \*\*fBodyAcc_std_Z\*\*, and is in g, standard gravity units<-p>
<p>Original raw variable \*\*fBodyAccJerk-std()-X\*\* was changed to \*\*fBodyAccJerk_std_X\*\*, and is in g, standard gravity units<-p>
<p>Original raw variable \*\*fBodyAccJerk-std()-Y\*\* was changed to \*\*fBodyAccJerk_std_Y\*\*, and is in g, standard gravity units<-p>
<p>Original raw variable \*\*fBodyAccJerk-std()-Z\*\* was changed to \*\*fBodyAccJerk_std_Z\*\*, and is in g, standard gravity units<-p>
<p>Original raw variable \*\*fBodyGyro-std()-X\*\* was changed to \*\*fBodyGyro_std_X\*\*, and is in radians per second<-p>
<p>Original raw variable \*\*fBodyGyro-std()-Y\*\* was changed to \*\*fBodyGyro_std_Y\*\*, and is in radians per second<-p>
<p>Original raw variable \*\*fBodyGyro-std()-Z\*\* was changed to \*\*fBodyGyro_std_Z\*\*, and is in radians per second<-p>
<p>Original raw variable \*\*fBodyAccMag-std()\*\* was changed to \*\*fBodyAccMag_std\*\*, and is in g, standard gravity units<-p>
<p>Original raw variable \*\*fBodyBodyAccJerkMag-std()\*\* was changed to \*\*fBodyBodyAccJerkMag_std\*\*, and is in g, standard gravity units<-p>
<p>Original raw variable \*\*fBodyBodyGyroMag-std()\*\* was changed to \*\*fBodyBodyGyroMag_std\*\*, and is in radians per second<-p>
<p>Original raw variable \*\*fBodyBodyGyroJerkMag-std()\*\* was changed to \*\*fBodyBodyGyroJerkMag_std\*\*, and is in radians per second<-p>

 
###Variable 1 (repeat this section for all variables in the dataset)
Short description of what the variable describes.
 
Some information on the variable including:
 - Class of the variable
 - Unique values/levels of the variable
 - Unit of measurement (if no unit of measurement list this as well)
 - In case names follow some schema, describe how entries were constructed (for example time-body-gyroscope-z has 4 levels of descriptors. Describe these 4 levels). 
 
(you can easily use Rcode for this, just load the dataset and provide the information directly form the tidy data file)
 
####Notes on variable 1:
If available, some additional notes on the variable not covered elsewhere. If no notes are present leave this section out.
 
##Sources
Sources you used if any, otherise leave out.
 
##Annex
If you used any code in the codebook that had the echo=FALSE attribute post this here (make sure you set the results parameter to 'hide' as you do not want the results to show again)
