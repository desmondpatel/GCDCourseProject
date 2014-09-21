Getting and Cleaning Data
=========================

This repo is created as part of the course project for **Getting and Cleaning Data** course at Coursera.

It contains 4 files:
1. **README.md** describing the repo and how the script works.
2. **CodeBook.md** describing the variables used/transformed.
3. **run_analysis.R** which is the R script to get/clean raw dataset and create a tidy dataset.
4. **tidydata.txt** which contains the tidy data.

## Getting Data

The dataset required for this project was downloaded from the following website:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and then unzipped in the working directory.

Alternatively, you can download it from the following website:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
Click on the *Data Folder* link at the top of the website and download **UCI HAR Dataset.zip** file.

After downloading the zip file, it can be unzipped to your working directory.

### Data Description
The experiments were carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (*WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING*) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, the experimenters captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments were also video-recorded to label the data manually. The obtained dataset was then randomly partitioned into two sets, where 70% of the volunteers were selected for generating the training data and 30% the test data.
[Source: *Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012*]

The full dataset consists of 10299 rows (instances/records) and 561 columns (attributes/fields).

For more details, please check out *README.txt* and *features_info.txt* files contained in the **UCI HAR Dataset.zip** file.

## Cleaning Data
The following steps were conducted to clean the raw data into tidy data which can then be analysed:
1. Merge the training and the test sets to create one data set.
2. Extract only the measurements on the mean and standard deviation for each measurement.
3. Use descriptive activity names to name the activities in the data set.
4. Appropriately label the data set with descriptive variable names.
5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.

Please refer to **run_analysis.R** file for the R script and **CodeBook.md** file for the full description of variables used/transformed.

### Step 1
In this step, the datasets were loaded into the data frames and then checked for correctness.

Firstly, the zip file was unzipped into the current working directory (which is *Documents/GCD/Course Project* folder in my Windows PC). The whole dataset was in the folder *UCI HAR Dataset* in the current working directory. Hence the working directory was reset to *UCI HAR Dataset* folder. Kindly note that all the rest of the R commands (in the **run_analysis.R** file) were issued with this folder as the current working direcory.

*UCI HAR Dataset* folder contains the following items:
1. Four files *README.txt*, *activity_labels.txt*", *features.txt* and *features_info.txt*.
2. Two folders *train* and *test*.

![Slide2.png by David Hood](Slide2.png)
Source:
https://class.coursera.org/getdata-007/forum/thread?thread_id=49

The two files *subject_train.txt* and *subject_test.txt* were checked for missing values using R function *all* on R commands *count.fields* and *!is.na*.

The training data which is in the *train* folder was then read from the three text files (*y_train.txt, subject_train.txt, X_train.txt*) to three data frames using *read.table* commands. They were then checked for rows and columns using R functions, *nrow* and *ncol*.
e.g. *traindat* data frame was found to contain 7352 rows and 561 columns.

The same procedure was repeated for test data which is in the *test* folder. Here, *testdat* data frame was found to contain 2947 rows and 561 columns.

Each of the two data sets (training and test) were first merged separately into two data frames (*fulltraind* and *fulltestd*) using R command *data.frame*, and then checked for number of rows and columns. These two were then merged into complete data set, *fulldat* using R function *rbind*. The full data set was found to contain 10299 rows and 563 columns without any missing values.

### Step 2
In this step, only the columns containing mean or standard deviation measurements on variables in the study were extracted from the full data set.

To achieve this, first of all column names were read from *features.txt* file. Then R function *grepl* was used to subset the full dataset. It was found that the subset contained 81 columns which includes two columns for subjectid and activity at the start and 79 columns for mean and std.

### Step 3
In this step, descriptive activity names were to be given to the activities in the dataset.

First, activity names were read from *activity_labels.txt* file using *read.table* command.

Then descriptive activity names were given to the activities in the sub dataset using *factor* command. Earlier they had coded values of 1, 2, ..., 6.

### Step 4
In this step, the variables in the sub dataset were given descriptive names.

To achieve this, R functions *tolower*, *gsub* and *sub* were used with regular expressions.

### Step 5
In this last step, an independent tidy dataset with the average of each variable for each activity and each subject was created from the sub dataset in step 4.

To achieve this, R functions *melt* and *dcast* from *reshape2* package were used on sub dataset from step 4. The tidy dataset was found to contain 180 rows and 81 columns without any missing values.

Finally, R command *write.table* was called on *tidydata* object to create *tidydata.txt* file.
