# Course Project for Getting and Cleaning Data

You should create one R script called run_analysis.R that does the following. 

1.	Merges the training and the test sets to create one data set.
2.	Extracts only the measurements on the mean and standard deviation for each measurement. 
3.	Uses descriptive activity names to name the activities in the data set
4.	Appropriately labels the data set with descriptive variable names. 
5.	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


##How to Run the Script.

The Script Name is run_analysis.R .  
To run this script, please copy the data downloaded from the course [instructions](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and unzip the data.  Copy the directory "UCI HAR Dataset" into your working directory before running this script.  
The raw data will be read from there when the directory is copied into your working directory.

Source the script in Rstudio.

If needed, the script will download and install the dplyr library/package.

When the script is finished, you will have a file, project_tidydata_summary.txt, in your working directory with the summarized and tidy data.  All the measurements represent the mean of all the variables for each set of Subject/Activities.

##How the Script Works


###1)Merges the training and the test sets to create one data set.

Reads in the 2947 observations of x-test.txt 	
Reads in the Subject ID's for observations in X_test.txt  
Reads in Activity type observed for each observation in x_test.txt  
Reads in the 7352 observations of x-train.txt  
Reads in the Subject ID's for observations in X_train.txt		  
Reads in Activity type number code observed for each observation in x_train.txt  
Combines all the columns for test data from the three training files  
Combines all the columns for training data from their three files  
Combines all the rows from test data with all the rows of training data  

###4)Appropriately labels the data set with descriptive variable names.

Reads in the features.txt file with original 561 descriptive column names which apply to both dataset test and train.  
Removes characters from the data set feature names that may cause problems.  
Removes, from the column labels, special characters that may cause problems later: "()"  
Also, replaces hyphens with underscores to prevent future problems with summarizing on field names.  
Applies the descriptive labels from the modified features.txt data to the appropriate columns.  
Applies Descriptive names to the first two columns.  

###2)Extracts only the measurements on the mean and standard deviation for each measurement.  

Subsets the data for features named with text ""BandsEngergy"" because they contain duplicate column names which obstruct our analysis and do not contains mean() or std() which we are looking for.  
Takes out the data causing problems using the subseted vector.  
Selects columns we do want to include. We don't include columns with "Mean", e.g. "angle(tBodyAccJerkMean),gravityMean)" because these are all angles and not mean measurements. Decided to leave out "meanFreq()" components because this function was a **weighted** average of frequency components only, and not the 
same as mean(). Otherwise data would have 81 columns instead of 68.  
Loads library dplyr to easily select only target data.  
Further Selects only our columns of interest using Select().  
  
					 
###3)Uses descriptive activity names to name the activities in the data set

Reads in the Labels for numerical Activity Codes from "activity_labels.txt" into a data frame.  
Replaces Activity Codes (1:6) with their descriptive labels.  
Writes a file of the project completed steps 1 to 4 to "project_tidydata_means_stds" in the working directory.  This step is not required output for the script.

###5)From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Groups by Subject and Activity using group_by() to create the data set for step 5.  
Using summarise_each(), creates a tidy table with the mean for each variable summarized by Subject and Activity combinations.  Step 5.  
Writes the resulting table to a file named "project_tidydata_summary.txt", to the working directory the tidy data set from step 5.  Submission instructions indicate use "row.name=FALSE"   


####Note that the dataset created in "project_tidydata_summary.txt" represents the mean() of those observations for each unique Subject and Activity combination.

##Sources for Raw Data
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.
 