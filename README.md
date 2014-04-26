This script will get and clean data from the "Human Activity Recognition Using Smartphones Data Set"according to the specifications given in the Peer Assessment of Coursera course "Getting and Cleaning
Data Project




1. It will Merge the training and the test sets to create one data set

   1.1. It will upload the text files to the individual dataframes:

        - features: It will contain all the different features with their description
        - activity_labels: It will contain all the different activities with their descrption
        - subject_test: It will contain the number of the subject for each measurement (of X_test dataframe)
        - X_test: Measurements used for testing
        - y_test: Activities of each measurement for testing
        - subject_train: Different subjects of the training measurement dataframe (X_train)
        - X_train: Measurements used for training
        - y_train: Activities of each measurement for training


   1.2. Merge individual data sets
        It will concatenate testing and training measurements in "total_X" dataframe



2. Extracts only de measurements on the mean and standard deviation for each measurement
        
   2.1. We get first the mean and standard variables accesing the features dataframe and matching the strings "-mean()"
        and "-std()"
        
   2.2. Then we create a new dataframe called "extracted_X" with only these columns
   
 

3. Uses descriptive activity names to name the activities in the data set

   3.1. We use the descriptions in features for naming the different columns in the dataframe "Extracted_X"


4. Appropiately labels the data set with descriptive activity names

   4.1. We concantenate the dataframes of activities for testing and training
   
   4.2. We add the activity labels to this concatenation
   
   4.3. We add a new column to the dataframe "Extracted_X" with the activity descriptions


5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject
   
   5.1. As with activities we add a new columns "Subject" to the "Extracted_X" data frame
   
   5.2. We melt based in "Activity" and "Subject", and then we cast calculating the mean for each of the measurements
        based in Activity and Subject




