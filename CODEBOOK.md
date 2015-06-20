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
 
1	 	  subjectID	Min.   : 1.0  
2	 	  subjectID	1st Qu.: 8.0  
3	 	  subjectID	Median :15.5  
4	 	  subjectID	Mean   :15.5  
5	 	  subjectID	3rd Qu.:23.0  
6	 	  subjectID	Max.   :30.0  
7	 	              Activity	LAYING            :30  
8	 	              Activity	SITTING           :30  
9	 	              Activity	STANDING          :30  
10	 	              Activity	WALKING           :30  
11	 	              Activity	WALKING_DOWNSTAIRS:30  
12	 	              Activity	WALKING_UPSTAIRS  :30  
13	 	tBodyAcc_mean_X	Min.   :0.2216  
14	 	tBodyAcc_mean_X	1st Qu.:0.2712  
15	 	tBodyAcc_mean_X	Median :0.2770  
16	 	tBodyAcc_mean_X	Mean   :0.2743  
17	 	tBodyAcc_mean_X	3rd Qu.:0.2800  
18	 	tBodyAcc_mean_X	Max.   :0.3015  
19	 	tBodyAcc_mean_Y	Min.   :-0.040514  
20	 	tBodyAcc_mean_Y	1st Qu.:-0.020022  
21	 	tBodyAcc_mean_Y	Median :-0.017262  
22	 	tBodyAcc_mean_Y	Mean   :-0.017876  
23	 	tBodyAcc_mean_Y	3rd Qu.:-0.014936  
24	 	tBodyAcc_mean_Y	Max.   :-0.001308  
25	 	tBodyAcc_mean_Z	Min.   :-0.15251  
26	 	tBodyAcc_mean_Z	1st Qu.:-0.11207  
27	 	tBodyAcc_mean_Z	Median :-0.10819  
28	 	tBodyAcc_mean_Z	Mean   :-0.10916  
29	 	tBodyAcc_mean_Z	3rd Qu.:-0.10443  
30	 	tBodyAcc_mean_Z	Max.   :-0.07538  
31	 	tGravityAcc_mean_X	Min.   :-0.6800  
32	 	tGravityAcc_mean_X	1st Qu.: 0.8376  
33	 	tGravityAcc_mean_X	Median : 0.9208  
34	 	tGravityAcc_mean_X	Mean   : 0.6975  
35	 	tGravityAcc_mean_X	3rd Qu.: 0.9425  
36	 	tGravityAcc_mean_X	Max.   : 0.9745  
37	 	tGravityAcc_mean_Y	Min.   :-0.47989  
38	 	tGravityAcc_mean_Y	1st Qu.:-0.23319  
39	 	tGravityAcc_mean_Y	Median :-0.12782  
40	 	tGravityAcc_mean_Y	Mean   :-0.01621  
41	 	tGravityAcc_mean_Y	3rd Qu.: 0.08773  
42	 	tGravityAcc_mean_Y	Max.   : 0.95659  
43	 	tGravityAcc_mean_Z	Min.   :-0.49509  
44	 	tGravityAcc_mean_Z	1st Qu.:-0.11726  
45	 	tGravityAcc_mean_Z	Median : 0.02384  
46	 	tGravityAcc_mean_Z	Mean   : 0.07413  
47	 	tGravityAcc_mean_Z	3rd Qu.: 0.14946  
48	 	tGravityAcc_mean_Z	Max.   : 0.95787  
49	 	tBodyAccJerk_mean_X	Min.   :0.04269  
50	 	tBodyAccJerk_mean_X	1st Qu.:0.07396  
51	 	tBodyAccJerk_mean_X	Median :0.07640  
52	 	tBodyAccJerk_mean_X	Mean   :0.07947  
53	 	tBodyAccJerk_mean_X	3rd Qu.:0.08330  
54	 	tBodyAccJerk_mean_X	Max.   :0.13019  
55	 	tBodyAccJerk_mean_Y	Min.   :-0.0386872  
56	 	tBodyAccJerk_mean_Y	1st Qu.: 0.0004664  
57	 	tBodyAccJerk_mean_Y	Median : 0.0094698  
58	 	tBodyAccJerk_mean_Y	Mean   : 0.0075652  
59	 	tBodyAccJerk_mean_Y	3rd Qu.: 0.0134008  
60	 	tBodyAccJerk_mean_Y	Max.   : 0.0568186  
61	 	tBodyAccJerk_mean_Z	Min.   :-0.067458  
62	 	tBodyAccJerk_mean_Z	1st Qu.:-0.010601  
63	 	tBodyAccJerk_mean_Z	Median :-0.003861  
64	 	tBodyAccJerk_mean_Z	Mean   :-0.004953  
65	 	tBodyAccJerk_mean_Z	3rd Qu.: 0.001958  
66	 	tBodyAccJerk_mean_Z	Max.   : 0.038053  
67	 	tBodyGyro_mean_X	Min.   :-0.20578  
68	 	tBodyGyro_mean_X	1st Qu.:-0.04712  
69	 	tBodyGyro_mean_X	Median :-0.02871  
70	 	tBodyGyro_mean_X	Mean   :-0.03244  
71	 	tBodyGyro_mean_X	3rd Qu.:-0.01676  
72	 	tBodyGyro_mean_X	Max.   : 0.19270  
73	 	tBodyGyro_mean_Y	Min.   :-0.20421  
74	 	tBodyGyro_mean_Y	1st Qu.:-0.08955  
75	 	tBodyGyro_mean_Y	Median :-0.07318  
76	 	tBodyGyro_mean_Y	Mean   :-0.07426  
77	 	tBodyGyro_mean_Y	3rd Qu.:-0.06113  
78	 	tBodyGyro_mean_Y	Max.   : 0.02747  
79	 	tBodyGyro_mean_Z	Min.   :-0.07245  
80	 	tBodyGyro_mean_Z	1st Qu.: 0.07475  
81	 	tBodyGyro_mean_Z	Median : 0.08512  
82	 	tBodyGyro_mean_Z	Mean   : 0.08744  
83	 	tBodyGyro_mean_Z	3rd Qu.: 0.10177  
84	 	tBodyGyro_mean_Z	Max.   : 0.17910  
85	 	tBodyGyroJerk_mean_X	Min.   :-0.15721  
86	 	tBodyGyroJerk_mean_X	1st Qu.:-0.10322  
87	 	tBodyGyroJerk_mean_X	Median :-0.09868  
88	 	tBodyGyroJerk_mean_X	Mean   :-0.09606  
89	 	tBodyGyroJerk_mean_X	3rd Qu.:-0.09110  
90	 	tBodyGyroJerk_mean_X	Max.   :-0.02209  
91	 	tBodyGyroJerk_mean_Y	Min.   :-0.07681  
92	 	tBodyGyroJerk_mean_Y	1st Qu.:-0.04552  
93	 	tBodyGyroJerk_mean_Y	Median :-0.04112  
94	 	tBodyGyroJerk_mean_Y	Mean   :-0.04269  
95	 	tBodyGyroJerk_mean_Y	3rd Qu.:-0.03842  
96	 	tBodyGyroJerk_mean_Y	Max.   :-0.01320  
97	 	tBodyGyroJerk_mean_Z	Min.   :-0.092500  
98	 	tBodyGyroJerk_mean_Z	1st Qu.:-0.061725  
99	 	tBodyGyroJerk_mean_Z	Median :-0.053430  
100	 	tBodyGyroJerk_mean_Z	Mean   :-0.054802  
101	 	tBodyGyroJerk_mean_Z	3rd Qu.:-0.048985  
102	 	tBodyGyroJerk_mean_Z	Max.   :-0.006941  
103	 	tBodyAccMag_mean	Min.   :-0.9865  
104	 	tBodyAccMag_mean	1st Qu.:-0.9573  
105	 	tBodyAccMag_mean	Median :-0.4829  
106	 	tBodyAccMag_mean	Mean   :-0.4973  
107	 	tBodyAccMag_mean	3rd Qu.:-0.0919  
108	 	tBodyAccMag_mean	Max.   : 0.6446  
109	 	tGravityAccMag_mean	Min.   :-0.9865  
110	 	tGravityAccMag_mean	1st Qu.:-0.9573  
111	 	tGravityAccMag_mean	Median :-0.4829  
112	 	tGravityAccMag_mean	Mean   :-0.4973  
113	 	tGravityAccMag_mean	3rd Qu.:-0.0919  
114	 	tGravityAccMag_mean	Max.   : 0.6446  
115	 	tBodyAccJerkMag_mean	Min.   :-0.9928  
116	 	tBodyAccJerkMag_mean	1st Qu.:-0.9807  
117	 	tBodyAccJerkMag_mean	Median :-0.8168  
118	 	tBodyAccJerkMag_mean	Mean   :-0.6079  
119	 	tBodyAccJerkMag_mean	3rd Qu.:-0.2456  
120	 	tBodyAccJerkMag_mean	Max.   : 0.4345  
121	 	tBodyGyroMag_mean	Min.   :-0.9807  
122	 	tBodyGyroMag_mean	1st Qu.:-0.9461  
123	 	tBodyGyroMag_mean	Median :-0.6551  
124	 	tBodyGyroMag_mean	Mean   :-0.5652  
125	 	tBodyGyroMag_mean	3rd Qu.:-0.2159  
126	 	tBodyGyroMag_mean	Max.   : 0.4180  
127	 	tBodyGyroJerkMag_mean	Min.   :-0.99732  
128	 	tBodyGyroJerkMag_mean	1st Qu.:-0.98515  
129	 	tBodyGyroJerkMag_mean	Median :-0.86479  
130	 	tBodyGyroJerkMag_mean	Mean   :-0.73637  
131	 	tBodyGyroJerkMag_mean	3rd Qu.:-0.51186  
132	 	tBodyGyroJerkMag_mean	Max.   : 0.08758  
133	 	fBodyAcc_mean_X	Min.   :-0.9952  
134	 	fBodyAcc_mean_X	1st Qu.:-0.9787  
135	 	fBodyAcc_mean_X	Median :-0.7691  
136	 	fBodyAcc_mean_X	Mean   :-0.5758  
137	 	fBodyAcc_mean_X	3rd Qu.:-0.2174  
138	 	fBodyAcc_mean_X	Max.   : 0.5370  
139	 	fBodyAcc_mean_Y	Min.   :-0.98903  
140	 	fBodyAcc_mean_Y	1st Qu.:-0.95361  
141	 	fBodyAcc_mean_Y	Median :-0.59498  
142	 	fBodyAcc_mean_Y	Mean   :-0.48873  
143	 	fBodyAcc_mean_Y	3rd Qu.:-0.06341  
144	 	fBodyAcc_mean_Y	Max.   : 0.52419  
145	 	fBodyAcc_mean_Z	Min.   :-0.9895  
146	 	fBodyAcc_mean_Z	1st Qu.:-0.9619  
147	 	fBodyAcc_mean_Z	Median :-0.7236  
148	 	fBodyAcc_mean_Z	Mean   :-0.6297  
149	 	fBodyAcc_mean_Z	3rd Qu.:-0.3183  
150	 	fBodyAcc_mean_Z	Max.   : 0.2807  
151	 	fBodyAccJerk_mean_X	Min.   :-0.9946  
152	 	fBodyAccJerk_mean_X	1st Qu.:-0.9828  
153	 	fBodyAccJerk_mean_X	Median :-0.8126  
154	 	fBodyAccJerk_mean_X	Mean   :-0.6139  
155	 	fBodyAccJerk_mean_X	3rd Qu.:-0.2820  
156	 	fBodyAccJerk_mean_X	Max.   : 0.4743  
157	 	fBodyAccJerk_mean_Y	Min.   :-0.9894  
158	 	fBodyAccJerk_mean_Y	1st Qu.:-0.9725  
159	 	fBodyAccJerk_mean_Y	Median :-0.7817  
160	 	fBodyAccJerk_mean_Y	Mean   :-0.5882  
161	 	fBodyAccJerk_mean_Y	3rd Qu.:-0.1963  
162	 	fBodyAccJerk_mean_Y	Max.   : 0.2767  
163	 	fBodyAccJerk_mean_Z	Min.   :-0.9920  
164	 	fBodyAccJerk_mean_Z	1st Qu.:-0.9796  
165	 	fBodyAccJerk_mean_Z	Median :-0.8707  
166	 	fBodyAccJerk_mean_Z	Mean   :-0.7144  
167	 	fBodyAccJerk_mean_Z	3rd Qu.:-0.4697  
168	 	fBodyAccJerk_mean_Z	Max.   : 0.1578  
169	 	fBodyGyro_mean_X	Min.   :-0.9931  
170	 	fBodyGyro_mean_X	1st Qu.:-0.9697  
171	 	fBodyGyro_mean_X	Median :-0.7300  
172	 	fBodyGyro_mean_X	Mean   :-0.6367  
173	 	fBodyGyro_mean_X	3rd Qu.:-0.3387  
174	 	fBodyGyro_mean_X	Max.   : 0.4750  
175	 	fBodyGyro_mean_Y	Min.   :-0.9940  
176	 	fBodyGyro_mean_Y	1st Qu.:-0.9700  
177	 	fBodyGyro_mean_Y	Median :-0.8141  
178	 	fBodyGyro_mean_Y	Mean   :-0.6767  
179	 	fBodyGyro_mean_Y	3rd Qu.:-0.4458  
180	 	fBodyGyro_mean_Y	Max.   : 0.3288  
181	 	fBodyGyro_mean_Z	Min.   :-0.9860  
182	 	fBodyGyro_mean_Z	1st Qu.:-0.9624  
183	 	fBodyGyro_mean_Z	Median :-0.7909  
184	 	fBodyGyro_mean_Z	Mean   :-0.6044  
185	 	fBodyGyro_mean_Z	3rd Qu.:-0.2635  
186	 	fBodyGyro_mean_Z	Max.   : 0.4924  
187	 	fBodyAccMag_mean	Min.   :-0.9868  
188	 	fBodyAccMag_mean	1st Qu.:-0.9560  
189	 	fBodyAccMag_mean	Median :-0.6703  
190	 	fBodyAccMag_mean	Mean   :-0.5365  
191	 	fBodyAccMag_mean	3rd Qu.:-0.1622  
192	 	fBodyAccMag_mean	Max.   : 0.5866  
193	 	fBodyBodyAccJerkMag_mean	Min.   :-0.9940  
194	 	fBodyBodyAccJerkMag_mean	1st Qu.:-0.9770  
195	 	fBodyBodyAccJerkMag_mean	Median :-0.7940  
196	 	fBodyBodyAccJerkMag_mean	Mean   :-0.5756  
197	 	fBodyBodyAccJerkMag_mean	3rd Qu.:-0.1872  
198	 	fBodyBodyAccJerkMag_mean	Max.   : 0.5384  
199	 	fBodyBodyGyroMag_mean	Min.   :-0.9865  
200	 	fBodyBodyGyroMag_mean	1st Qu.:-0.9616  
201	 	fBodyBodyGyroMag_mean	Median :-0.7657  
202	 	fBodyBodyGyroMag_mean	Mean   :-0.6671  
203	 	fBodyBodyGyroMag_mean	3rd Qu.:-0.4087  
204	 	fBodyBodyGyroMag_mean	Max.   : 0.2040  
205	 	fBodyBodyGyroJerkMag_mean	Min.   :-0.9976  
206	 	fBodyBodyGyroJerkMag_mean	1st Qu.:-0.9813  
207	 	fBodyBodyGyroJerkMag_mean	Median :-0.8779  
208	 	fBodyBodyGyroJerkMag_mean	Mean   :-0.7564  
209	 	fBodyBodyGyroJerkMag_mean	3rd Qu.:-0.5831  
210	 	fBodyBodyGyroJerkMag_mean	Max.   : 0.1466  
211	 	tBodyAcc_std_X	Min.   :-0.9961  
212	 	tBodyAcc_std_X	1st Qu.:-0.9799  
213	 	tBodyAcc_std_X	Median :-0.7526  
214	 	tBodyAcc_std_X	Mean   :-0.5577  
215	 	tBodyAcc_std_X	3rd Qu.:-0.1984  
216	 	tBodyAcc_std_X	Max.   : 0.6269  
217	 	tBodyAcc_std_Y	Min.   :-0.99024  
218	 	tBodyAcc_std_Y	1st Qu.:-0.94205  
219	 	tBodyAcc_std_Y	Median :-0.50897  
220	 	tBodyAcc_std_Y	Mean   :-0.46046  
221	 	tBodyAcc_std_Y	3rd Qu.:-0.03077  
222	 	tBodyAcc_std_Y	Max.   : 0.61694  
223	 	tBodyAcc_std_Z	Min.   :-0.9877  
224	 	tBodyAcc_std_Z	1st Qu.:-0.9498  
225	 	tBodyAcc_std_Z	Median :-0.6518  
226	 	tBodyAcc_std_Z	Mean   :-0.5756  
227	 	tBodyAcc_std_Z	3rd Qu.:-0.2306  
228	 	tBodyAcc_std_Z	Max.   : 0.6090  
229	 	tGravityAcc_std_X	Min.   :-0.9968  
230	 	tGravityAcc_std_X	1st Qu.:-0.9825  
231	 	tGravityAcc_std_X	Median :-0.9695  
232	 	tGravityAcc_std_X	Mean   :-0.9638  
233	 	tGravityAcc_std_X	3rd Qu.:-0.9509  
234	 	tGravityAcc_std_X	Max.   :-0.8296  
235	 	tGravityAcc_std_Y	Min.   :-0.9942  
236	 	tGravityAcc_std_Y	1st Qu.:-0.9711  
237	 	tGravityAcc_std_Y	Median :-0.9590  
238	 	tGravityAcc_std_Y	Mean   :-0.9524  
239	 	tGravityAcc_std_Y	3rd Qu.:-0.9370  
240	 	tGravityAcc_std_Y	Max.   :-0.6436  
241	 	tGravityAcc_std_Z	Min.   :-0.9910  
242	 	tGravityAcc_std_Z	1st Qu.:-0.9605  
243	 	tGravityAcc_std_Z	Median :-0.9450  
244	 	tGravityAcc_std_Z	Mean   :-0.9364  
245	 	tGravityAcc_std_Z	3rd Qu.:-0.9180  
246	 	tGravityAcc_std_Z	Max.   :-0.6102  
247	 	tBodyAccJerk_std_X	Min.   :-0.9946  
248	 	tBodyAccJerk_std_X	1st Qu.:-0.9832  
249	 	tBodyAccJerk_std_X	Median :-0.8104  
250	 	tBodyAccJerk_std_X	Mean   :-0.5949  
251	 	tBodyAccJerk_std_X	3rd Qu.:-0.2233  
252	 	tBodyAccJerk_std_X	Max.   : 0.5443  
253	 	tBodyAccJerk_std_Y	Min.   :-0.9895  
254	 	tBodyAccJerk_std_Y	1st Qu.:-0.9724  
255	 	tBodyAccJerk_std_Y	Median :-0.7756  
256	 	tBodyAccJerk_std_Y	Mean   :-0.5654  
257	 	tBodyAccJerk_std_Y	3rd Qu.:-0.1483  
258	 	tBodyAccJerk_std_Y	Max.   : 0.3553  
259	 	tBodyAccJerk_std_Z	Min.   :-0.99329  
260	 	tBodyAccJerk_std_Z	1st Qu.:-0.98266  
261	 	tBodyAccJerk_std_Z	Median :-0.88366  
262	 	tBodyAccJerk_std_Z	Mean   :-0.73596  
263	 	tBodyAccJerk_std_Z	3rd Qu.:-0.51212  
264	 	tBodyAccJerk_std_Z	Max.   : 0.03102  
265	 	tBodyGyro_std_X	Min.   :-0.9943  
266	 	tBodyGyro_std_X	1st Qu.:-0.9735  
267	 	tBodyGyro_std_X	Median :-0.7890  
268	 	tBodyGyro_std_X	Mean   :-0.6916  
269	 	tBodyGyro_std_X	3rd Qu.:-0.4414  
270	 	tBodyGyro_std_X	Max.   : 0.2677  
271	 	tBodyGyro_std_Y	Min.   :-0.9942  
272	 	tBodyGyro_std_Y	1st Qu.:-0.9629  
273	 	tBodyGyro_std_Y	Median :-0.8017  
274	 	tBodyGyro_std_Y	Mean   :-0.6533  
275	 	tBodyGyro_std_Y	3rd Qu.:-0.4196  
276	 	tBodyGyro_std_Y	Max.   : 0.4765  
277	 	tBodyGyro_std_Z	Min.   :-0.9855  
278	 	tBodyGyro_std_Z	1st Qu.:-0.9609  
279	 	tBodyGyro_std_Z	Median :-0.8010  
280	 	tBodyGyro_std_Z	Mean   :-0.6164  
281	 	tBodyGyro_std_Z	3rd Qu.:-0.3106  
282	 	tBodyGyro_std_Z	Max.   : 0.5649  
283	 	tBodyGyroJerk_std_X	Min.   :-0.9965  
284	 	tBodyGyroJerk_std_X	1st Qu.:-0.9800  
285	 	tBodyGyroJerk_std_X	Median :-0.8396  
286	 	tBodyGyroJerk_std_X	Mean   :-0.7036  
287	 	tBodyGyroJerk_std_X	3rd Qu.:-0.4629  
288	 	tBodyGyroJerk_std_X	Max.   : 0.1791  
289	 	tBodyGyroJerk_std_Y	Min.   :-0.9971  
290	 	tBodyGyroJerk_std_Y	1st Qu.:-0.9832  
291	 	tBodyGyroJerk_std_Y	Median :-0.8942  
292	 	tBodyGyroJerk_std_Y	Mean   :-0.7636  
293	 	tBodyGyroJerk_std_Y	3rd Qu.:-0.5861  
294	 	tBodyGyroJerk_std_Y	Max.   : 0.2959  
295	 	tBodyGyroJerk_std_Z	Min.   :-0.9954  
296	 	tBodyGyroJerk_std_Z	1st Qu.:-0.9848  
297	 	tBodyGyroJerk_std_Z	Median :-0.8610  
298	 	tBodyGyroJerk_std_Z	Mean   :-0.7096  
299	 	tBodyGyroJerk_std_Z	3rd Qu.:-0.4741  
300	 	tBodyGyroJerk_std_Z	Max.   : 0.1932  
301	 	tBodyAccMag_std	Min.   :-0.9865  
302	 	tBodyAccMag_std	1st Qu.:-0.9430  
303	 	tBodyAccMag_std	Median :-0.6074  
304	 	tBodyAccMag_std	Mean   :-0.5439  
305	 	tBodyAccMag_std	3rd Qu.:-0.2090  
306	 	tBodyAccMag_std	Max.   : 0.4284  
307	 	tGravityAccMag_std	Min.   :-0.9865  
308	 	tGravityAccMag_std	1st Qu.:-0.9430  
309	 	tGravityAccMag_std	Median :-0.6074  
310	 	tGravityAccMag_std	Mean   :-0.5439  
311	 	tGravityAccMag_std	3rd Qu.:-0.2090  
312	 	tGravityAccMag_std	Max.   : 0.4284  
313	 	tBodyAccJerkMag_std	Min.   :-0.9946  
314	 	tBodyAccJerkMag_std	1st Qu.:-0.9765  
315	 	tBodyAccJerkMag_std	Median :-0.8014  
316	 	tBodyAccJerkMag_std	Mean   :-0.5842  
317	 	tBodyAccJerkMag_std	3rd Qu.:-0.2173  
318	 	tBodyAccJerkMag_std	Max.   : 0.4506  
319	 	tBodyGyroMag_std	Min.   :-0.9814  
320	 	tBodyGyroMag_std	1st Qu.:-0.9476  
321	 	tBodyGyroMag_std	Median :-0.7420  
322	 	tBodyGyroMag_std	Mean   :-0.6304  
323	 	tBodyGyroMag_std	3rd Qu.:-0.3602  
324	 	tBodyGyroMag_std	Max.   : 0.3000  
325	 	tBodyGyroJerkMag_std	Min.   :-0.9977  
326	 	tBodyGyroJerkMag_std	1st Qu.:-0.9805  
327	 	tBodyGyroJerkMag_std	Median :-0.8809  
328	 	tBodyGyroJerkMag_std	Mean   :-0.7550  
329	 	tBodyGyroJerkMag_std	3rd Qu.:-0.5767  
330	 	tBodyGyroJerkMag_std	Max.   : 0.2502  
331	 	fBodyAcc_std_X	Min.   :-0.9966  
332	 	fBodyAcc_std_X	1st Qu.:-0.9820  
333	 	fBodyAcc_std_X	Median :-0.7470  
334	 	fBodyAcc_std_X	Mean   :-0.5522  
335	 	fBodyAcc_std_X	3rd Qu.:-0.1966  
336	 	fBodyAcc_std_X	Max.   : 0.6585  
337	 	fBodyAcc_std_Y	Min.   :-0.99068  
338	 	fBodyAcc_std_Y	1st Qu.:-0.94042  
339	 	fBodyAcc_std_Y	Median :-0.51338  
340	 	fBodyAcc_std_Y	Mean   :-0.48148  
341	 	fBodyAcc_std_Y	3rd Qu.:-0.07913  
342	 	fBodyAcc_std_Y	Max.   : 0.56019  
343	 	fBodyAcc_std_Z	Min.   :-0.9872  
344	 	fBodyAcc_std_Z	1st Qu.:-0.9459  
345	 	fBodyAcc_std_Z	Median :-0.6441  
346	 	fBodyAcc_std_Z	Mean   :-0.5824  
347	 	fBodyAcc_std_Z	3rd Qu.:-0.2655  
348	 	fBodyAcc_std_Z	Max.   : 0.6871  
349	 	fBodyAccJerk_std_X	Min.   :-0.9951  
350	 	fBodyAccJerk_std_X	1st Qu.:-0.9847  
351	 	fBodyAccJerk_std_X	Median :-0.8254  
352	 	fBodyAccJerk_std_X	Mean   :-0.6121  
353	 	fBodyAccJerk_std_X	3rd Qu.:-0.2475  
354	 	fBodyAccJerk_std_X	Max.   : 0.4768  
355	 	fBodyAccJerk_std_Y	Min.   :-0.9905  
356	 	fBodyAccJerk_std_Y	1st Qu.:-0.9737  
357	 	fBodyAccJerk_std_Y	Median :-0.7852  
358	 	fBodyAccJerk_std_Y	Mean   :-0.5707  
359	 	fBodyAccJerk_std_Y	3rd Qu.:-0.1685  
360	 	fBodyAccJerk_std_Y	Max.   : 0.3498  
361	 	fBodyAccJerk_std_Z	Min.   :-0.993108  
362	 	fBodyAccJerk_std_Z	1st Qu.:-0.983747  
363	 	fBodyAccJerk_std_Z	Median :-0.895121  
364	 	fBodyAccJerk_std_Z	Mean   :-0.756489  
365	 	fBodyAccJerk_std_Z	3rd Qu.:-0.543787  
366	 	fBodyAccJerk_std_Z	Max.   :-0.006236  
367	 	fBodyGyro_std_X	Min.   :-0.9947  
368	 	fBodyGyro_std_X	1st Qu.:-0.9750  
369	 	fBodyGyro_std_X	Median :-0.8086  
370	 	fBodyGyro_std_X	Mean   :-0.7110  
371	 	fBodyGyro_std_X	3rd Qu.:-0.4813  
372	 	fBodyGyro_std_X	Max.   : 0.1966  
373	 	fBodyGyro_std_Y	Min.   :-0.9944  
374	 	fBodyGyro_std_Y	1st Qu.:-0.9602  
375	 	fBodyGyro_std_Y	Median :-0.7964  
376	 	fBodyGyro_std_Y	Mean   :-0.6454  
377	 	fBodyGyro_std_Y	3rd Qu.:-0.4154  
378	 	fBodyGyro_std_Y	Max.   : 0.6462  
379	 	fBodyGyro_std_Z	Min.   :-0.9867  
380	 	fBodyGyro_std_Z	1st Qu.:-0.9643  
381	 	fBodyGyro_std_Z	Median :-0.8224  
382	 	fBodyGyro_std_Z	Mean   :-0.6577  
383	 	fBodyGyro_std_Z	3rd Qu.:-0.3916  
384	 	fBodyGyro_std_Z	Max.   : 0.5225  
385	 	fBodyAccMag_std	Min.   :-0.9876  
386	 	fBodyAccMag_std	1st Qu.:-0.9452  
387	 	fBodyAccMag_std	Median :-0.6513  
388	 	fBodyAccMag_std	Mean   :-0.6210  
389	 	fBodyAccMag_std	3rd Qu.:-0.3654  
390	 	fBodyAccMag_std	Max.   : 0.1787  
391	 	fBodyBodyAccJerkMag_std	Min.   :-0.9944  
392	 	fBodyBodyAccJerkMag_std	1st Qu.:-0.9752  
393	 	fBodyBodyAccJerkMag_std	Median :-0.8126  
394	 	fBodyBodyAccJerkMag_std	Mean   :-0.5992  
395	 	fBodyBodyAccJerkMag_std	3rd Qu.:-0.2668  
396	 	fBodyBodyAccJerkMag_std	Max.   : 0.3163  
397	 	fBodyBodyGyroMag_std	Min.   :-0.9815  
398	 	fBodyBodyGyroMag_std	1st Qu.:-0.9488  
399	 	fBodyBodyGyroMag_std	Median :-0.7727  
400	 	fBodyBodyGyroMag_std	Mean   :-0.6723  
401	 	fBodyBodyGyroMag_std	3rd Qu.:-0.4277  
402	 	fBodyBodyGyroMag_std	Max.   : 0.2367  
403	 	fBodyBodyGyroJerkMag_std	Min.   :-0.9976  
404	 	fBodyBodyGyroJerkMag_std	1st Qu.:-0.9802  
405	 	fBodyBodyGyroJerkMag_std	Median :-0.8941  
406	 	fBodyBodyGyroJerkMag_std	Mean   :-0.7715  
407	 	fBodyBodyGyroJerkMag_std	3rd Qu.:-0.6081  
408	 	fBodyBodyGyroJerkMag_std	Max.   : 0.2878         
 

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
