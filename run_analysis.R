

labelFeatures<- read.table("./data/features.txt")  ##Reads in the labels, as 
#column 2 of the observations in X_train.txt and X_test.txt

labelFeatures$V2 <- gsub("\\(\\)", "",labelFeatures$V2)   #Remove, from the 
#labels, special characters that may cause problems later: "()"
labelFeatures$V2 <- gsub("-", "_",labelFeatures$V2)  ##Also replace hyphens
#with underscores to prevent future problems with summarizing on field names.

subj_id_test <- read.table("./data/test/subject_test.txt")  ##Reads in the 
#Subject ID's for observations in X_test.txt

act_lbls_test <- read.table("./data/test/y_test.txt")  ##Reads in Activity type
#observed for each obs in x_test.txt

obs_x_test <- read.table("./data/test/x_test.txt")  ##Reads in the 2947 obs of
#x-test.txt

colnames(obs_x_test) = labelFeatures[,2]  ##Assigns labels from column 2 to 
#column names for for obs_x_test

obs_w_id_act_test <- cbind(subj_id_test,act_lbls_test,obs_x_test)  ##Merge 
#labeled obs with activity codes observed and Subject ID's for x_test.txt 
#subject Id's for test set.

names(obs_w_id_act_test)[1:2]<- c("subjectID", "Activity") ##Add descriptive 
#names to the first two columns of the combined table.

###Do the same thing with "train" set:

subj_id_train <- read.table("./data/train/subject_train.txt")

act_lbls_train <- read.table("./data/train/y_train.txt")

obs_x_train <- read.table("./data/train/x_train.txt")

colnames(obs_x_train) = labelFeatures[,2]  

obs_w_id_act_train <- cbind(subj_id_train,act_lbls_train,obs_x_train)

names(obs_w_id_act_train)[1:2]<- c("subjectID", "Activity")  ##Add descriptive
#names to the first two columns.

####Here we combine the two sets of data.
combined_data <- rbind(obs_w_id_act_train, obs_w_id_act_test)  ##Combine the two 
#datasets

library(tidyr) ##load library tidyr to help tidy the data

col_bandsEnergy <- grep("bandsEnergy",names(combined_data))  ##Identify columns
#containing "bandsEnergy" which have duplicate columnn names and can be elimi-
#nated because they are not part of the dataset we are interested in.

comb_data_86bandsE <- combined_data[,-1 * col_bandsEnergy]   ##Select all the
#columns that do not contain "bandsEnergy".

tidy_data1 <- select(comb_data_86bandsE, subjectID, Activity, contains("_mean"),
                     contains("_std"), -contains("meanFreq"))  ##Select columns we do want
##We don't include columns with "Mean", e.g. "angle(tBodyAccJerkMean),gravityMean)"
#because these are all angles and not mean measurements. Decided to leave out 
#meanFreq components because this function was a weighted average of frequency
#components only and not the same as mean(). Otherwise data would have 81 columns
#wide instead of 68.

### Read in the Labels for Activity Codes to data frame.
labelActivites<- read.table("./data/activity_labels.txt")

tidy_data1$Activity <- labelActivites[,2][match(tidy_data1$Activity, 
                                                labelActivites[,1])]  ##Replace
#Activity Codes (1:6) with their descriptive labels.


###ColMeans 0.274347261 Mean   : 0.2743


write.table(tidy_data1,"./data/project_tidydata_means_stds")  ##rite to file
#the tidy data set complete through step 4.

gbSubjACtvty <- group_by(tidy_data1,subjectID,Activity)  ##Groups by Subject 
#and Activity to create the data set for step 5.

sum_gbSubjActvty <- summarise_each(gbSubjACtvty, funs(mean), -subjectID,-Activity)
##created a tidy table with the mean for each variable summarized by Subject
#and Activity combinations.  Step 5.

write.table(sum_gbSubjActvty,"./data/project_tidydata_summary")  ##rite to file
#the tidy data set from step 5.