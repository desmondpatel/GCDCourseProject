# Step 1
# Merges the training and the test sets to create one data set.

# If data.table and reshape2 packages are not already installed,
# please install them using install.packages("<packagename>") command.

# setwd("~/GCD/Course Project"), if required

# Download commands, if needed
# fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
# download.file(fileUrl, destfile = "UCI HAR Dataset.zip", method = "auto", mode="wb")

# Set working directory to point to UCI HAR Dataset folder
# setwd("~/GCD/Course Project/UCI HAR Dataset")

# Check if each row in training and test data files have 561 fields
# Both the following commands must return TRUE
# all(count.fields("./train/X_train.txt")==561)
# all(count.fields("./test/X_test.txt")==561)

# Get training data
trainact <- read.table("./train/y_train.txt")
trainsub <- read.table("./train/subject_train.txt")
traindat <- read.table("./train/X_train.txt")
# Run the function nrow(trainact), nrow(trainsub), nrow(traindat)
# They should all return 7352 (rows)
# Run the function ncol(traindat)
# It should return 561 (columns)

# Get test data
testact <- read.table("./test/y_test.txt")
testsub <- read.table("./test/subject_test.txt")
testdat <- read.table("./test/X_test.txt")
# Run the function nrow(testact), nrow(testsub), nrow(testdat)
# They should all return 2947 (rows)
# Run the function ncol(testdat)
# It should return 561 (columns)

# Create a data frame on complete training data
fulltraind <- data.frame(trainsub, trainact, traindat, stringsAsFactors=FALSE)
# Run the functions nrow(fulltraind) and ncol(fulltraind)
# They should return 7352 (rows) and 563 (columns) respectively

# Create a data frame on complete test data
fulltestd <- data.frame(testsub, testact, testdat, stringsAsFactors=FALSE)
# Run the functions nrow(fulltestd) and ncol(fulltestd)
# They should return 2947 (rows) and 563 (columns) respectively

# Merge training and test data sets
fulldat <- rbind(fulltraind, fulltestd)
# Run the functions nrow(fulldat) and ncol(fulldat)
# They should return 10299 (rows) and 563 (columns) respectively

# Check if there is no NA in fulldat
# all(!is.na(fulldat))


# Step 2
# Extracts only the measurements on the mean and standard deviation
# for each measurement.

# Get column names
features <- read.table("features.txt", stringsAsFactors=F)[,2]
# class(features) will be character instead of factor by setting stringsAsFactors to false

# Get logical vector (with TRUE/FALSE values).
# Columns with words, mean or standard deviation, will have TRUE value
# and other columns will have FALSE value.
reqfeatures <- grepl("mean|std", features)
# Please note that this will have TRUE value for any column
# containing words, mean or std e.g. mean(), meanFreq, std().

# Two columns for subjectid & activityid must be present as columns 1 & 2
allreqfeatures <- c(T, T, reqfeatures)

# Keep only the required columns in our sub data
subdat <- fulldat[,allreqfeatures]
# Run the function ncol(subdat)
# It should return 81 (columns)

# Check if there is no NA in subdat
# all(!is.na(subdat))


# Step 3
# Uses descriptive activity names to name the activities in the data set.

# Get activity names
activities <- read.table("activity_labels.txt")

# This could be done in Step 3.
# Then instead of second column name as activity, we will have to use V1.1
# I set it here because V1.1 looks odd name.
colnames(subdat)[2] <- "activity"

# Convert the activity codes to activity names
subdat$activity <- factor(subdat$activity, levels=c(1,2,3,4,5,6), labels=activities[,2])


# Step 4
# Appropriately labels the data set with descriptive variable names.
newcolnames <- c("subjectid", "activityname")
count <- 2
for(i in 1:length(features)){
    if(allreqfeatures[i+2]){
        count <- count + 1
        newcolnames[count] <- tolower(gsub("[-()]","",features[i]))
        newcolnames[count] <- sub("bodybody","body",newcolnames[count])
    }
}
colnames(subdat) <- newcolnames
# I did not prefix words, mean and std in all variable names after the 
# second column with the letters "meanof" because they will become too long.
# Moreover, they are already explained in the CodeBook.md file.


# Step 5
# From the sub data set in step 4, creates a second, independent tidy data set
# with the average of each variable for each activity and each subject.

# Load reshape2 library for using melt and dcast functions
library(reshape2)

# Melt data
groupcols <- c("subjectid", "activityname")
othercols <- setdiff(colnames(subdat), groupcols)
meltdata <- melt(subdat, id = groupcols, measure.vars = othercols)

# Apply mean function to the melted data
tidydata <- dcast(meltdata, subjectid + activityname ~ variable, mean)
# Run the functions nrow(tidydata) and ncol(tidydata)
# They should return 180 (rows) and 81 (columns) respectively

# Check if there is no NA in tidydata
# all(!is.na(tidydata))

# Write table to the file without row names
write.table(tidydata, file = "./tidydata.txt", row.names = FALSE)

# Check if each row in tidy data file has 81 fields
# The following command must return TRUE
# all(count.fields("./tidydata.txt")==81)