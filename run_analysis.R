library(plyr)

## harDatset function assumes that dataset is present in current 
## working directory and returns an object which can be used to 
## access the loaded training/test datasets and processing them.
harDataset <- function() {
    # Test/training/processed dataset dir and file names
    pathSep = "/"
    testDirName <- "test"
    trainDirName <- "train"
    activityLabelsFileName <- "activity_labels.txt"
    featureLabelsFileName <- "features.txt"
    
    testSubjectFileName <- "subject_test.txt"
    testXFileName <- "X_test.txt"
    testyFileName <- "y_test.txt"
    
    trainSubjectFileName <- "subject_train.txt"
    trainXFileName <- "X_train.txt"
    trainyFileName <- "y_train.txt"
    
    processedDatasetFileName <- "processed_dataset.txt"
    
    # Data frame for activity labels
    activityLabelsDF <- NULL
    headerActivityLabelsDF <- c("activityid", "activityname")
    
    # Data frame for features
    featureLabelsDF <- NULL
    headerFeactureLabelsDF <- c("featureid", "featurename")
    featureMeanStdLabelsDF <- NULL
    
    # Data frames for test dataset
    testSubjectDF <- NULL
    testXDF <- NULL
    testyDF <- NULL
    
    # Data frames for training dataset
    trainSubjectDF <- NULL
    trainXDF <- NULL
    trainyDF <- NULL
    
    headerSubjectDF <- c("subjectid")
    headeryDF <- headerActivityLabelsDF[1]
    
    # Data frames for combined dataset
    combinedSubjectDF <- NULL
    combinedXDF <- NULL
    combinedyDF <- NULL
    combinedDF <- NULL
    
    # Data frame for final procesesd dataset
    finalProcessedDF <- NULL
    
    # Function to get data frame containing activity labels
    getActivityLabelsDF <- function() {
        activityLabelsDF
    }
    
    # Function to get data frame containing feature labels
    getFeatureLabelDF <- function() {
        featureLabelsDF
    }
    
    # Function to get data frame containing mean and std 
    # deviation based feature labels
    getFeatureMeanStdLabelsDF <- function() {
        featureMeanStdLabelsDF
    }
    
    # Function to get data frame containing test dataset subjects
    getTestSubjectDF <-  function() {
        testSubjectDF
    }
    
    # Function to get data frame containing test dataset X
    getTestXDF <- function() {
        testXDF
    }
    
    # Function to get data frame containing test dataset y
    getTestyDF <- function() {
        testyDF
    }
    
    # Function to get data frame containing training dataset subjects
    getTrainSubjectDF <- function() {
        trainSubjectDF
    }
    
    # Function to get data frame containing training dataset X
    getTrainXDF <- function() {
        trainXDF
    }
    
    # Function to get data frame containing training dataset y
    getTrainyDF <- function() {
        trainyDF
    }
    
    # Function to get data frame containing combined dataset subjects
    getCombinedSubjectDF <- function() {
        combinedSubjectDF
    }
    
    # Function to get data frame containing combined dataset X
    getCombinedXDF <- function() {
        combinedXDF
    }
    
    # Function to get data frame containing combined dataset y
    getCombinedyDF <- function() {
        combinedyDF
    }
    
    # Function to get data frame containing combined dataset
    getCombinedDF <- function() {
        combinedDF
    }
    
    # Function to get data frame containing final processed dataset
    getFinalProcessedDF <- function() {
        finalProcessedDF
    }
    
    # Function to load activity labels from file into activityLabelsDF data frame
    loadActivityLabels <- function() {
        activityLabelsDF <<- read.table(activityLabelsFileName)
        names(activityLabelsDF) <<- headerActivityLabelsDF
    }
    
    # Function to load features from file into featureLabelsDF data frame
    loadFeatureLabels <- function() {
        featureLabelsDF <<- read.table(featureLabelsFileName)
        names(featureLabelsDF) <<- headerFeactureLabelsDF
    }
    
    # Function to filter out mean and standard deviation based features 
    # and load them into featureMeanStdLabelsDF data frame
    setFeatureMeanStdLabelsDF <- function() {
        if(is.null(featureLabelsDF)){
            loadFeatureLabels()
        }
        
        featureMeanStdLabelsDF <<- featureLabelsDF[grepl("mean\\(\\)|std\\(\\)", 
                                        featureLabelsDF[, "featurename"]), ]
    }

    # Function to load subjects from a given file into a data frame and return
    # the resulting data frame
    loadSubject <- function(subjectFile) {
        subjectDF <- read.table(subjectFile)
        names(subjectDF) <- headerSubjectDF
        subjectDF
    }
        
    # Function to load X measurements from a given file into a data frame
    # and return the resulting data frame
    loadX <- function(XFile, XDF) {
        if(is.null(featureLabelsDF)) {
            loadFeatureLabels()
        }
        
        XDF <- read.table(XFile)
        names(XDF) <- featureLabelsDF[, 2]
        XDF
    }
    
    # Function to load y from a given file into a data frame and return the 
    # resulting data frame
    loady <- function(yFile, yDF) {
        yDF <- read.table(yFile)
        names(yDF) <- headeryDF
        yDF
    }
    
    # Function to load test data into testSubjectDF, testXDF and testyDF
    # data frames
    loadTestData <- function() {
        testSubjectDF <<- loadSubject(paste(testDirName, testSubjectFileName, sep = pathSep))
        testXDF <<- loadX(paste(testDirName, testXFileName, sep = pathSep))
        testyDF <<- loady(paste(testDirName, testyFileName, sep = pathSep))
    }
    
    # Function to load training data into trainSubjectDF, trainXDF and trainyDF
    # data frames
    loadTrainData <- function() {
        trainSubjectDF <<- loadSubject(paste(trainDirName, trainSubjectFileName, sep = pathSep))
        trainXDF <<- loadX(paste(trainDirName, trainXFileName, sep = pathSep))
        trainyDF <<- loady(paste(trainDirName, trainyFileName, sep = pathSep))
    }
    
    # Function to load the complete HAR dataset from directory
    load <- function() {
        loadActivityLabels()
        loadFeatureLabels()
        setFeatureMeanStdLabelsDF()
        loadTestData()
        loadTrainData()
    }
    
    # Function to generate the combined subjects data frame
    generateCombinedSubjectDF <- function() {
        combinedSubjectDF <<- rbind(testSubjectDF, trainSubjectDF)
    }
    
    # Function to generate the combined X data frame
    generateCombinedXDF <- function() {
        filteredTestXDF <- testXDF[, featureMeanStdLabelsDF[, 1]]
        filteredTrainXDF <- trainXDF[, featureMeanStdLabelsDF[, 1]]
        combinedXDF <<- rbind(filteredTestXDF, filteredTrainXDF)
        names(combinedXDF) <<- featureMeanStdLabelsDF[, 2]
    }
    
    # Function to get activity name for a given activity id
    getActivityNameForId <- function(activityId) {
        activityLabelsDF[activityId, 2]
    }
    
    # Function to generate the combined y data frame
    generateCombinedyDF <- function() {
        combinedyDF <<- rbind(testyDF, trainyDF)
        combinedyDF[, 1] <<- sapply(combinedyDF[, 1], getActivityNameForId)
        names(combinedyDF) <<- headerActivityLabelsDF[2]
    }
    
    # Function to generate the combined data frame containing both
    # test and train datasets
    generateCombinedDF <- function() {
        generateCombinedSubjectDF()
        generateCombinedXDF()
        generateCombinedyDF()
        combinedDF <<- cbind(combinedSubjectDF, combinedXDF, combinedyDF)
    }
    
    # Function to export the final processed dataset to a file
    exportFinalProcessedDataset <-  function() {
        if(is.null(finalProcessedDF)) {
            generateFinalProcessedDF()
        }
    
        write.table(finalProcessedDF, processedDatasetFileName, row.names = FALSE)
    }
    
    generateFinalProcessedDF <- function() {
        if(is.null(combinedDF)) {
            generateCombinedDataset()
        }
        
        groupCols <- c("subjectid", "activityname")
        headerCombinedDF <- names(combinedDF)
        meanCols <- headerCombinedDF[! headerCombinedDF %in% groupCols]
        finalProcessedDF <<- ddply(combinedDF, groupCols, function(x) colMeans(x[meanCols]))
        headerFinalProcessedDF <- names(finalProcessedDF)
        
        updatedColName <- function(colName) {
            if (colName %in% featureMeanStdLabelsDF[, 2]) {
                paste("avg(", colName, ")", sep = "")
            } else {
                colName
            }
        }
        names(finalProcessedDF) <<- sapply(headerFinalProcessedDF, updatedColName)
    }
    
    # Function to generate the data frame containing combined test and train dataets
    generateCombinedDataset <- function() {
        if(is.null(activityLabelsDF) || is.null(featureMeanStdLabelsDF) ||
           is.null(testSubjectDF) || is.null(testX) || is.null(testyDF) ||
           is.null(trainSubjectDF) || is.null(trainXDF) || is.null(trainyDF)) {
            load()
        }
        generateCombinedDF()
    }
    
    # List object containing externally exposed functions for accessing/processing
    # HAR dataset
    list(load = load, generateFinalProcessedDF = generateFinalProcessedDF, 
         exportFinalProcessedDataset = exportFinalProcessedDataset, getActivityLabelsDF = getActivityLabelsDF, 
         getFeatureLabelDF = getFeatureLabelDF, getFeatureMeanStdLabelsDF = getFeatureMeanStdLabelsDF, 
         getTestSubjectDF = getTestSubjectDF, getTestXDF = getTestXDF, getTestyDF = getTestyDF, 
         getTrainSubjectDF = getTrainSubjectDF, getTrainXDF = getTrainXDF, getTrainyDF = getTrainyDF, 
         getCombinedSubjectDF = getCombinedSubjectDF, getCombinedXDF = getCombinedXDF, 
         getCombinedyDF = getCombinedyDF, getCombinedDF = getCombinedDF, getFinalProcessedDF = getFinalProcessedDF)
}