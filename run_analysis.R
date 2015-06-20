##Objective:
#You should create one R script called run_analysis.R that does the following. 
#1)Merges the training and the test sets to create one data set.
#2)Extracts only the measurements on the mean and standard deviation for each measurement. 
#3)Uses descriptive activity names to name the activities in the data set
#4)Appropriately labels the data set with descriptive variable names. 
#5)From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


##To run this script, please copy the downloaded and unzipped data directory 
#"UCI HAR Dataset" into your working directory before running this script.  
#The raw data will be read from there when the directory is copied into your
#working directory.

#1)Merges the training and the test sets to create one data set.
		##Read in the 2947 obs of x-test.txt	
obs_x_test <- read.table("./UCI HAR Dataset/test/x_test.txt")  
	##Reads in the Subject ID's for observations in X_test.txt
subj_id_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")  
	##Reads in Activity type observed for each observation in x_test.txt
act_lbls_test <- read.table("./UCI HAR Dataset/test/y_test.txt")  
	##Read in the 7352 obseravations of x-train.txt
obs_x_train <- read.table("./UCI HAR Dataset/train/x_train.txt")
	##Reads in the Subject ID's for observations in X_train.txt		
subj_id_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
	##Reads in Activity type observed for each observation in x_train.txt
act_lbls_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
	##Combine all the columns for test data
obs_w_id_act_test <- cbind(subj_id_test,act_lbls_test,obs_x_test) 
	##Combine all the columns for training data
obs_w_id_act_train <- cbind(subj_id_train,act_lbls_train,obs_x_train)
	##Combine all the rows from test data with all the rows of training data
combined_data <- rbind(obs_w_id_act_train, obs_w_id_act_test)


#4)Appropriately labels the data set with descriptive variable names.
	##Read in the file with original descriptive column names for both data sets.
labelFeatures<- read.table("./UCI HAR Dataset/features.txt")  
	
	##Remove characters from the data set feature names that may cause problems.
	#Remove, from the column labels, special characters that may cause problems later: "()"
	labelFeatures$V2 <- gsub("\\(\\)", "",labelFeatures$V2)   
	##Also replace hyphens with underscores to prevent future problems with summarizing on field names.
labelFeatures$V2 <- gsub("-", "_",labelFeatures$V2)
	##Apply labels to the appropriate columns
colnames(combined_data)[3:(length(labelFeatures[,2]) + 2)] = labelFeatures[,2]
        ##Apply Descriptive names to the first two columns
colnames(combined_data)[1:2]<- c("subjectID", "Activity")


#2)Extracts only the measurements on the mean and standard deviation for each measurement.
	##Subset the data for features named BandsEngergy because they contain 
	#duplicate column names which obstruct our analysis and do not contains mean()
	#or std() which we are looking for.
col_bandsEnergy <- grep("bandsEnergy",names(combined_data))
	#take out the data causing problems
comb_data_86bandsE <- combined_data[,-1 * col_bandsEnergy]
	##Select columns we do want. We don't include columns with "Mean", e.g. 
	#"angle(tBodyAccJerkMean),gravityMean)" because these are all angles and not 
	#mean measurements. Decided to leave out "meanFreq()" components because this 
	#function was a weighted average of frequency components only and not the 
	#same as mean(). Otherwise data would have 81 columns instead of 68.

library(dplyr) ##load library dplyr to easily select only target data

tidy_data1 <- select(comb_data_86bandsE, subjectID, Activity, contains("_mean"),
                     contains("_std"), -contains("meanFreq"))  
					 
#3)Uses descriptive activity names to name the activities in the data set

	### Read in the Labels for Activity Codes to data frame.
labelActivites<- read.table("./UCI HAR Dataset/activity_labels.txt")
	##Replace Activity Codes (1:6) with their descriptive labels.
tidy_data1$Activity <- labelActivites[,2][match(tidy_data1$Activity, 
                                                labelActivites[,1])] 
	####Write to file the tidy data set complete from setp 1 through step 4.									
write.table(tidy_data1,"./project_tidydata_means_stds")  	
												
#5)From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
	##Groups by Subject and Activity to create the data set for step 5.				 
gbSubjActvty <- group_by(tidy_data1, subjectID, Activity)  ##Groups by Subject 
#and Activity to create the data set for step 5.
	##create a tidy table with the mean for each variable summarized by Subject 
	#and Activity combinations.  Step 5.
sum_gbSubjActvty <- summarise_each(gbSubjActvty, funs(mean), -subjectID, -Activity)

	##write to file named "project_tidydata_summary.txt" the tidy data set from 
	#step 5.  Submission instructions indicate use "row.name=FALSE" 				 
write.table(sum_gbSubjActvty,"./project_tidydata_summary.txt",row.name=FALSE)  
					 



