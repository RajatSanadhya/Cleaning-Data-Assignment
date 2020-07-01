This is the Code Book that gives information about the data cleaning process used by me to clean the data given for the assignment.
The main file in this process is a R script run_analysis.R.
Running this script will download, clean and then save the tidy data in the "Data" folder.
The script performs the following tasks in this order :-

## 1. Download the data
Create a Data folder, download the data in zip format inside the Data folder and unzip the data. 

## 2. Load Data
* Extract names of various activities and features from Data/UCI HAR Dataset/activity_labels.txt and Data/UCI HAR Dataset/features.txt.
* Select only feature names that are associated with mean or standard deviation.
* Load train data from Data/UCI HAR Dataset/train/X_train.txt ,dimensions = (7352,561), this file contains the train data.
* Load train activities data from Data/UCI HAR Dataset/train/Y_train.txt, dimensions = (7352,1), this file contains class labels of activivties.
* Load train subjects data from Data/UCI HAR Dataset/train/subject_train.txt, dimensions = (7352,1), this file contains data of subjects of experiment.
* Load test data from Data/UCI HAR Dataset/test/X_test.txt, dimensions = (2947,561), this file contains the test data.
* Load test activities from Data/UCI HAR Dataset/test/Y_test.txt, dimensions = (2947,1), this file contains class labels of test activities.
* Load test subjects data from /UCI HAR Dataset/test/subject_test.txt, dimensions = (2947,1), this file contains data of subjects of experiment.

## 3. Filter Data
From the loaded training and test data, this script will filter out only the required data, which here is all the features that give mean and standard devidation values.

## 4. Merge Data
This script then merges the filtered train and test data.

## 5. Group Data
Then the data is grouped by activites and subject numbers. Also each activity label is replaced by respective activity name. Then takes average value for each group.

## 6. Export Data
Finally exports the tidy data inside the Data folder as Clean Data.txt and Clean Data.csv

# Variables
* ```train``` : This variable contains the train data
* ```train_activities``` : This variable contains the Y_train activity labels
* ```train_subjects``` : This variable contains the subject info
* ```test``` : This variable contains the test data
* ```test_activities``` : This variable contains the Y_test activity labels
* ```test_subjects``` : This variable contains the subject info
* ```activities``` : This variable contains the activity labels and names
* ```required_features``` : This variable contains required variables that hold the mean and standard deviation info
* ```combined_data``` : This variable contains the merged data of train and test variable
# List of Required Feature Names
* "tBodyAcc-mean-X" 
* "tBodyAcc-mean-Y" 
* "tBodyAcc-mean-Z" 
* "tBodyAcc-std-X" 
* "tBodyAcc-std-Y" 
* "tBodyAcc-std-Z" 
* "tGravityAcc-mean-X" 
* "tGravityAcc-mean-Y" 
* "tGravityAcc-mean-Z" 
* "tGravityAcc-std-X" 
* "tGravityAcc-std-Y" 
* "tGravityAcc-std-Z" 
* "tBodyAccJerk-mean-X" 
* "tBodyAccJerk-mean-Y" 
* "tBodyAccJerk-mean-Z" 
* "tBodyAccJerk-std-X" 
* "tBodyAccJerk-std-Y" 
* "tBodyAccJerk-std-Z" 
* "tBodyGyro-mean-X" 
* "tBodyGyro-mean-Y" 
* "tBodyGyro-mean-Z" 
* "tBodyGyro-std-X" 
* "tBodyGyro-std-Y" 
* "tBodyGyro-std-Z" 
* "tBodyGyroJerk-mean-X" 
* "tBodyGyroJerk-mean-Y" 
* "tBodyGyroJerk-mean-Z" 
* "tBodyGyroJerk-std-X" 
* "tBodyGyroJerk-std-Y" 
* "tBodyGyroJerk-std-Z" 
* "tBodyAccMag-mean" 
* "tBodyAccMag-std" 
* "tGravityAccMag-mean" 
* "tGravityAccMag-std" 
* "tBodyAccJerkMag-mean" 
* "tBodyAccJerkMag-std" 
* "tBodyGyroMag-mean" 
* "tBodyGyroMag-std" 
* "tBodyGyroJerkMag-mean" 
* "tBodyGyroJerkMag-std" 
* "fBodyAcc-mean-X" 
* "fBodyAcc-mean-Y" 
* "fBodyAcc-mean-Z" 
* "fBodyAcc-std-X" 
* "fBodyAcc-std-Y" 
* "fBodyAcc-std-Z" 
* "fBodyAccJerk-mean-X" 
* "fBodyAccJerk-mean-Y" 
* "fBodyAccJerk-mean-Z" 
* "fBodyAccJerk-std-X" 
* "fBodyAccJerk-std-Y" 
* "fBodyAccJerk-std-Z" 
* "fBodyGyro-mean-X" 
* "fBodyGyro-mean-Y" 
* "fBodyGyro-mean-Z" 
* "fBodyGyro-std-X" 
* "fBodyGyro-std-Y" 
* "fBodyGyro-std-Z" 
* "fBodyAccMag-mean" 
* "fBodyAccMag-std" 
* "fBodyBodyAccJerkMag-mean" 
* "fBodyBodyAccJerkMag-std" 
* "fBodyBodyGyroMag-mean" 
* "fBodyBodyGyroMag-std" 
* "fBodyBodyGyroJerkMag-mean" 
* "fBodyBodyGyroJerkMag-std" 
