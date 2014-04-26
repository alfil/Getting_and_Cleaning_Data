## This script will get and clean data from the "Human Activity Recognition Using Smartphones Data Set"
## according to the specifications given in the Peer Assessment of Coursera course "Getting and Cleaning
## Data Project"



## 1. Merges the training and the test sets to create one data set

# 1.1. Upload text files to individual data sets
# Labels
features <- read.table("./UCI HAR Dataset/features.txt")
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
# Tests
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
# Trains
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")



# 1.2. Merge individual data sets
total_X <- rbind(X_train, X_test)


## 2. Extracts only de measurements on the mean and standard deviation for each measurement
## Label Means index in features
label_means <- grep("-mean()", features$V2)
# Label Stds index in features
label_stds <- grep("-std()", features$V2)
# Total columns index to extract
cols_to_extract <- c(label_means, label_stds)
extracted_X <- total_X[, cols_to_extract]


## 3. Uses descriptive activity names to name the activities in the data set
colnames(extracted_X) <- features[cols_to_extract, "V2"]



## 4. Appropiately labels the data set with descriptive activity names
# Concatenation of activities for the total data set
total_y <- rbind(y_train, y_test)
# Merge with the decriptions data set
total_y_with_labels <- merge(total_y, activity_labels, by.x="V1", by.y="V1")
# We create a new columns with the Activity Data Set
extracted_X["Activity"] <- total_y_with_labels["V2"]

## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject
total_subjects <- rbind(subject_train, subject_test)
extracted_X["Subject"] <- total_subjects["V1"]
X_melted <- melt(extracted_X, id=c("Activity","Subject"), measure.vars=colnames(extracted_X)[1:79])
Final_X <- dcast(X_melted, Activity + Subject ~ variable, mean)

print(Final_X)



