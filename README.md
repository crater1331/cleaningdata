run_analysis.R file present in this repo can be used for loading and processing UCI HAR dataset (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). It generates an independent tidy dataset containing average of mean and standard deviation based measurements for each activity and each subject.

The script has been tested on Fedora 27 with R version 3.4.3 (2017-11-30) -- "Kite-Eating Tree".

Instructions to run_analysis.R:
===============================
The script defines harDataset() function which assumes that the dataset is present in the working directory. It returns an object (a list of functions) which can be used to access the loaded training/test datasets and processing them.

Step: 1
-------
Download and extract the UCI HAR dataset to some directory (let's say, ~/Downloads).

Step: 2 
-------
Using the directory containing the extracted dataset, execute below mentioned commands from R console or RStudio

> scriptPath <- '~/run_analysis.R' # run_analysis.R script path
> datasetDir <- "~/Downloads/UCI_HAR_Dataset" # Directory containing the extracted UCI HAR dataset
> setwd(datasetDir)
> source(scriptPath)
> har <- harDataset()
> har$exportFinalProcessedDataset()

It will create processed_dataset.txt file in the datasetDir. processed_dataset.txt file contains tidy dataset with average of mean and standard deviation based measurements for each activity and each subject.

Step: 3 (Optional)
------------------
Object returned by harDataset() function provides many useful getter functions to inspect the loaded test/training/combined/processed datasets. Before using these getter methods to inspect individual data frames, please run either har$exportFinalProcessedDataset() function or har$generateFinalProcessedDF() function to make sure that the datasets have been loaded and processed.

Getter functions to inspect loaded data frames:
-----------------------------------------------
getActivityLabelsDF(): Function to get data frame containing activity labels.
getFeatureLabelDF(): Function to get data frame containing feature labels.
getFeatureMeanStdLabelsDF(): Function to get data frame containing mean and standard deviation based feature labels.

getTestSubjectDF(): Function to get data frame containing test dataset subjects.
getTestXDF(): Function to get data frame containing test dataset X measurements.
getTestyDF(): Function to get data frame containing test dataset y  measurements.

getTrainSubjectDF(): Function to get data frame containing training dataset subjects.
getTrainXDF(): Function to get data frame containing training dataset X measurements.
getTrainyDF(): Function to get data frame containing training dataset y measurements.

getCombinedSubjectDF(): Function to get data frame containing combined (both test and training) dataset subjects.
getCombinedXDF(): Function to get data frame containing combined dataset X measurements. 
getCombinedyDF(): Function to get data frame containing combined dataset y measurements.
getCombinedDF(): Function to get data frame containing complete combined dataset (subjects + X + y).

getFinalProcessedDF(): Function to get data frame containing final processed dataset with average of mean and standard deviation based measurements for each activity and each subject.

Example:
--------
> har$getActivityLabelsDF()
  activityid       activityname
1          1            WALKING
2          2   WALKING_UPSTAIRS
3          3 WALKING_DOWNSTAIRS
4          4            SITTING
5          5           STANDING
6          6             LAYING
> 
