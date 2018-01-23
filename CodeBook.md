The dataset created by run_analysis.R script is based on UCI HAR dataset (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and provides the average of the mean and standard deviation based measurements present in the original dataset for each subject and each activity.

As part of the dataset cleaning and  processing, below listed steps were carried out in sequence:
1. Test and training datasets were merged to get the combined dataset.
2. For each measurement, only mean and standard deviation based measurements were extracted.
3. y measurements in original dataset were replaced with their corresponding descriptive activity names.
4. Descriptive variable names were assigned to each variable.
5. Finally, average of each variable was calculated for each activity and each subject.

## Description of variable names:
#### subjectid:
An integer value in the range \[1, 30\]. Each subject id identifies one of the 30 volunteers of the study.

#### activityname:
Descriptive activity names (character vectors) identifying one of the six activities carried out in the study.
* WALKING (corresponds to y = 1 measurement in original dataset)
* WALKING_UPSTAIRS (corresponds to y = 2 measurement in original dataset)
* WALKING_DOWNSTAIRS (corresponds to y = 3 measurement in original dataset)
* SITTING (corresponds to y = 4 measurement in original dataset)
* STANDING (corresponds to y = 5 measurement in original dataset)
* LAYING (corresponds to y = 6 measurements in original dataset)

#### avg(_x_):
Average of measurement _x_ for corresponding activity and subject. Here _x_ can be one of the following measurements present in original dataset: 
_tBodyAcc-mean()-X, tBodyAcc-mean()-Y, tBodyAcc-mean()-Z, tBodyAcc-std()-X, tBodyAcc-std()-Y, tBodyAcc-std()-Z, tGravityAcc-mean()-X, tGravityAcc-mean()-Y, tGravityAcc-mean()-Z, tGravityAcc-std()-X, tGravityAcc-std()-Y, tGravityAcc-std()-Z, tBodyAccJerk-mean()-X, tBodyAccJerk-mean()-Y, tBodyAccJerk-mean()-Z, tBodyAccJerk-std()-X, tBodyAccJerk-std()-Y, tBodyAccJerk-std()-Z, tBodyGyro-mean()-X, tBodyGyro-mean()-Y, tBodyGyro-mean()-Z, tBodyGyro-std()-X, tBodyGyro-std()-Y, tBodyGyro-std()-Z, tBodyGyroJerk-mean()-X, tBodyGyroJerk-mean()-Y, tBodyGyroJerk-mean()-Z, tBodyGyroJerk-std()-X, tBodyGyroJerk-std()-Y, tBodyGyroJerk-std()-Z, tBodyAccMag-mean(), tBodyAccMag-std(), tGravityAccMag-mean(), tGravityAccMag-std(), tBodyAccJerkMag-mean(), tBodyAccJerkMag-std(), tBodyGyroMag-mean(), tBodyGyroMag-std(), tBodyGyroJerkMag-mean(), tBodyGyroJerkMag-std(), fBodyAcc-mean()-X, fBodyAcc-mean()-Y, fBodyAcc-mean()-Z, fBodyAcc-std()-X, fBodyAcc-std()-Y, fBodyAcc-std()-Z, fBodyAccJerk-mean()-X, fBodyAccJerk-mean()-Y, fBodyAccJerk-mean()-Z, fBodyAccJerk-std()-X, fBodyAccJerk-std()-Y, fBodyAccJerk-std()-Z, fBodyGyro-mean()-X, fBodyGyro-mean()-Y, fBodyGyro-mean()-Z, fBodyGyro-std()-X, fBodyGyro-std()-Y, fBodyGyro-std()-Z, fBodyAccMag-mean(), fBodyAccMag-std(), fBodyBodyAccJerkMag-mean(), fBodyBodyAccJerkMag-std(), fBodyBodyGyroMag-mean(), fBodyBodyGyroMag-std(), fBodyBodyGyroJerkMag-mean(), fBodyBodyGyroJerkMag-std()_.
