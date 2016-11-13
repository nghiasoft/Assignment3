# @autho: Nghia Dai Tran
# @assignment 3: Getting and Cleaning Data

# Put the data set and this script to the same folder
# Set the working dir to source file location

# All file paths of data set/labels
fActivityLabels  <- "./UCI\ HAR\ Dataset/activity_labels.txt"
fFeatures        <- "./UCI\ HAR\ Dataset/features.txt"

fTraining        <- "./UCI\ HAR\ Dataset/train/X_train.txt"
fTrainingLabels  <- "./UCI\ HAR\ Dataset/train/y_train.txt"
fSubjectTrain    <- "./UCI\ HAR\ Dataset/train/subject_train.txt"

fTest            <- "./UCI\ HAR\ Dataset/test/X_test.txt"
fTestLabels      <- "./UCI\ HAR\ Dataset/test/y_test.txt"
fSubjectTest     <- "./UCI\ HAR\ Dataset/test/subject_test.txt"

# Load library dplyr, data.table
library(dplyr)
library(data.table)

# Load file data set to data table
dtActivityLabels <- fread(fActivityLabels, stringsAsFactors = FALSE)
dtFeatures <- fread(fFeatures, stringsAsFactors = FALSE)
dtTrainingSet <- fread(fTraining)
dtTrainingLabels <- fread(fTrainingLabels)
dtSubjectTrain <- fread(fSubjectTrain)
dtTestSet <- fread(fTest)
dtTestLabels <- fread(fTestLabels)
dtSubjectTest <- fread(fSubjectTest)

# clean don't need variables
rm(fTest, fTestLabels, fSubjectTest, fSubjectTrain, fTrainingLabels, fTraining, fFeatures, fActivityLabels)

# Add labels to features and activity labels table.
names(dtFeatures)       <- c("feature_id", "feature_name")
names(dtActivityLabels) <- c("activity_id", "activity")

names(dtTestLabels)     <- c("activity_id")
names(dtTrainingLabels) <- c("activity_id")

names(dtSubjectTest)    <- c("subject")
names(dtSubjectTrain)   <- c("subject")


# 1. Merges the training and the test sets to create one data set.
dtTrainingTiny <- mutate(dtTrainingSet, activity_id = dtTrainingLabels[, activity_id], subject = dtSubjectTrain[, subject])
dtTestTiny <- mutate(dtTestSet, activity_id = dtTestLabels[, activity_id], subject = dtSubjectTest[, subject])
# use rbindlist to improve performance for merging of two big data.tables
# system.time(dtTiny <- merge(dtTrainingTiny, dtTestTiny, by = names(dtTrainingTiny), all = TRUE))
system.time(l <- list(dtTrainingTiny, dtTestTiny))
system.time(dtTiny <- rbindlist(l, use.names = TRUE))

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
dtStdMean <- dtFeatures[grepl("mean\\(\\)|std\\(\\)", dtFeatures[, feature_name])]
# choose the column mean and std and two column activiy and subject.
# The column activiy and subject is at end of tiny data.
dtTiny <- select(dtTiny, c(dtStdMean[, feature_id], ncol(dtTiny) - 1, ncol(dtTiny)))

# 3. Uses descriptive activity names to name the activities in the data set
dtActivityLabelId <- select(dtTiny, activity_id)
dtActivity <- merge(dtActivityLabelId, dtActivityLabels, by = "activity_id", all = TRUE, sort = FALSE)
system.time(dtTiny <- mutate(dtTiny, activity_id = dtActivity[, activity]))
setnames(dtTiny, old = c("activity_id"), new = c("activity"))

# 4. Appropriately labels the data set with descriptive variable names.
variableNames <- gsub("V", "", names(dtTiny))
variableNames <- as.numeric(variableNames[1: (length(variableNames) - 2)])
variableNames <- dtFeatures[variableNames, ]
setnames(x = dtTiny,
         old = names(dtTiny),
         new = c(variableNames[, feature_name], "activity", "subject"))

# 5. From the data set in step 4, creates a second, independent tidy data set
# with the average of each variable for each activity and each subject.

# clone second tiny data and replace t, f by full their names.
dtTiny2 <- dtTiny
names(dtTiny2) <- gsub("^t", "time-", names(dtTiny2))
names(dtTiny2) <- gsub("^f", "frequency-", names(dtTiny2))

# group data by two column subject and activity the summerize all variables.
dtTiny2 <- dtTiny2 %>%
    group_by_(.dots= c("subject", "activity")) %>%
    summarise_each(funs(mean(., na.rm=TRUE)))

write.table(dtTiny2, row.names = FALSE, file = "tinydata.txt")
