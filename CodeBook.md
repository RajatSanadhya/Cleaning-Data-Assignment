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