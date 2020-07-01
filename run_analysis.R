## Project on Getting and Cleaning data
## Author <- Rajat Sanadhya

## Downloading the data
dir.create(file.path(getwd(),"Data"))
download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip',file.path(getwd(),"Data/data.zip"))
unzip("data.zip")

## Extracting Activity Labels and Names
activities <- fread(file.path(getwd(),"Data/UCI HAR Dataset/activity_labels.txt"))
names(activities)<-c("class_label","activity_name")
## Extracting Feature Labels and Names
features <- fread(file.path(getwd(),"Data/UCI HAR Dataset/features.txt"))
names(features)<-c("feature_label","feature_name")
## extracting only the features with mean or standard deviation observations
required_features <- grep("(mean|std)\\(\\)", features[, feature_name])
measurements <- gsub('[()]', '', features[required_features, feature_name])

## Loading train data
train <- fread(file.path(getwd(), "Data/UCI HAR Dataset/train/X_train.txt"))
train <- train[,required_features,with=FALSE] ## using only required features
names(train) <- measurements ## setting correct feature names
train_activities <- fread(file.path(getwd(), "Data/UCI HAR Dataset/train/Y_train.txt")) ## reading activity data
names(train_activities) <- "activity"
train_subjects <- fread(file.path(getwd(), "Data/UCI HAR Dataset/train/subject_train.txt"))
names(train_subjects) <- "subjectNumber"
train <- cbind(train_subjects, train_activities, train)

## Loading test data
test <- fread(file.path(getwd(), "Data/UCI HAR Dataset/test/X_test.txt"))
test <- test[,required_features,with=FALSE] ## using only required features
names(test) <- measurements ## setting correct feature names
test_activities <- fread(file.path(getwd(), "Data/UCI HAR Dataset/test/Y_test.txt")) ## reading activity data
names(test_activities) <- "activity"
test_subjects <- fread(file.path(getwd(), "Data/UCI HAR Dataset/test/subject_test.txt"))
names(test_subjects) <- "subjectNumber"
test <- cbind(test_subjects, test_activities, test)

## Merging both train and test data  
combined_data <- rbind(train,test)

## setting acivity names for each class labels
combined_data[['activity']] <- factor(combined_data[,activity], levels=activities[['class_label']],labels = activities[['activity_name']])
combined_data[['subjectNumber']] <- as.factor(combined_data[,subjectNumber]) ## making subject number a factor variable

combined_data <- melt(combined_data,c("subjectNumber","activity")) ## grouping the data by subject number and activities
combined_data <- dcast(combined_data,subjectNumber+activity~variable,fun.aggregate = mean) ## taking average over features grouped previously

write.table(combined_data, "Data/Clean Data.txt",row.names = FALSE) ## saving clean data in a text file inside the data folder
fwrite(combined_data, "Data/Clean Data.csv") ## saving clean data in a csv file inside the data folder