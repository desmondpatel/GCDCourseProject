Getting and Cleaning Data
=========================

*CodeBook.md* file is part of the course project for **Getting and Cleaning Data** course at Coursera.


### Tidy Data Description 

The *tidydata.txt* is output after running the *run_analysis.R* script from the working directory as described in *README.md* file.

It consists of 81 variables:
1.subjectid
2.activityname
3.features (79 in total)


### subjectid
Levels: *1, 2, ..., 30*

These are volunteers within an age bracket of 19-48 years.

Training data consists data for 21 volunteers.
Test data consists data for 9 volunteers.


### activityname
Levels: *WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING,  STANDING, LAYING*

The following activities were performed by subjects wearing a smartphone (Samsung Galaxy S II) on the waist:
1. WALKING
2. WALKING_UPSTAIRS
3. WALKING_DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING

The above activity labels were extracted from *activity_labels.txt* file using *read.table* command. The activity column (V1.1) was then transformed from integers (1, 2, ..., 6) to factors (labels) using R *factor* command.

Each subject had performed these activities at different interval of times.


### features

The raw data had measurements taken on 561 features as described in the *features_info.txt* file contained in the **UCI HAR Dataset.zip** file.

In short, Acc stands for accelerometer and Gyro stands for gyroscope, t stands for time domain signals and f for frequency domain signals. X, Y, Z denote the 3 spatial directions. Acceleration signal was then separated into body and gravity acceleration signals. Jerk signals were obtained from body linear acceleration and angular velocity.

Various statistical measures were estimated from these signals, e.g. mean, std, min, max, iqr, meanFreq, skewness, kurtosis, angle, etc. 

The complete list of 561 variables is given in the *features.txt* file contained in the **UCI HAR Dataset.zip** file.

The measurements were normalized in the range [-1,1].

Each row contains measurements on 561 variables for a particular subject and a particular activity.

From this data set of 561 variables, only variables having measurements on mean or std (standard deviation) were extracted. 
For example, tBodyAcc-mean()-X and tBodyAcc-std()-Z were retained but tBodyAcc-mad()-X and tBodyAcc-energy()-X were excluded. However, fBodyAcc-meanFreq()-X, for example, was retained because it contained the word mean (and the course project description is a bit ambiguous for this part). Also, fBodyBodyAccJerkMag-mean(), for example, was changed to fBodyAccJerkMag-mean() because it contained BodyBody (word "Body"" is repeated).
Finally, parentheses, hyphens were dropped and each variable name converted to lowercase.
This resulted in the set of 79 variables whose names follow the naming convention of R [Source: *Names of variables, Slide 16 of 16, editingTextVariables.pdf, Week 4 Lecture Notes*].

Finally the mean of the measurements for each subjectid, activityname combination was computed and was saved in *tidydata.txt* file.


Following are the features/variables (other than subjectid and activityname) in the *tidydata.txt* file:
(*Kindly note that data on each of the variable below in tidydata.txt file is actually mean of that variable.*)
tbodyaccmeanx - mean of body acceleration along x-axis in time domain
tbodyaccmeany - mean of body acceleration along y-axis in time domain
tbodyaccmeanz - mean of body acceleration along z-axis in time domain
tbodyaccstdx - std of body acceleration along x-axis in time domain
tbodyaccstdy - std of body acceleration along y-axis in time domain
tbodyaccstdz - std of body acceleration along z-axis in time domain
tgravityaccmeanx - mean of gravity acceleration along x-axis in time domain
tgravityaccmeany - mean of gravity acceleration along y-axis in time domain
tgravityaccmeanz - mean of gravity acceleration along z-axis in time domain
tgravityaccstdx - std of gravity acceleration along x-axis in time domain
tgravityaccstdy - std of gravity acceleration along y-axis in time domain
tgravityaccstdz - std of gravity acceleration along z-axis in time domain
tbodyaccjerkmeanx - mean of body acceleration jerk along x-axis in time domain
tbodyaccjerkmeany - mean of body acceleration jerk along y-axis in time domain
tbodyaccjerkmeanz - mean of body acceleration jerk along z-axis in time domain
tbodyaccjerkstdx - std of body acceleration jerk along x-axis in time domain
tbodyaccjerkstdy - std of body acceleration jerk along y-axis in time domain
tbodyaccjerkstdz - std of body acceleration jerk along z-axis in time domain
tbodygyromeanx - mean of body angular velocity along x-axis in time domain
tbodygyromeany - mean of body angular velocity along y-axis in time domain
tbodygyromeanz - mean of body angular velocity along z-axis in time domain
tbodygyrostdx - std of body angular velocity along x-axis in time domain
tbodygyrostdy - std of body angular velocity along y-axis in time domain
tbodygyrostdz - std of body angular velocity along z-axis in time domain
tbodygyrojerkmeanx - mean of body jerk along x-axis in time domain
tbodygyrojerkmeany - mean of body jerk along y-axis in time domain
tbodygyrojerkmeanz - mean of body jerk along z-axis in time domain
tbodygyrojerkstdx - std of body jerk along x-axis in time domain
tbodygyrojerkstdy - std of body jerk along y-axis in time domain
tbodygyrojerkstdz - std of body jerk along z-axis in time domain
tbodyaccmagmean - mean of body acceleration using Euclidean norm in time domain
tbodyaccmagstd - std of body acceleration using Euclidean norm in time domain
tgravityaccmagmean - mean of gravity acceleration using Euclidean norm in time domain
tgravityaccmagstd - std of gravity acceleration using Euclidean norm in time domain
tbodyaccjerkmagmean - mean of body acceleration jerk using Euclidean norm in time domain
tbodyaccjerkmagstd - std of body acceleration jerk using Euclidean norm in time domain
tbodygyromagmean - mean of body angular velocity using Euclidean norm in time domain
tbodygyromagstd - std of body angular velocity using Euclidean norm in time domain
tbodygyrojerkmagmean - mean of body jerk using Euclidean norm in time domain
tbodygyrojerkmagstd - std of body jerk using Euclidean norm in time domain
fbodyaccmeanx - mean of body acceleration along x-axis in frequency domain
fbodyaccmeany - mean of body acceleration along y-axis in frequency domain
fbodyaccmeanz - mean of body acceleration along z-axis in frequency domain
fbodyaccstdx - std of body acceleration along x-axis in frequency domain
fbodyaccstdy - std of body acceleration along y-axis in frequency domain
fbodyaccstdz - std of body acceleration along z-axis in frequency domain
fbodyaccmeanfreqx - mean frequency of body acceleration along x-axis in frequency domain
fbodyaccmeanfreqy - mean frequency of body acceleration along y-axis in frequency domain
fbodyaccmeanfreqz - mean frequency of body acceleration along z-axis in frequency domain
fbodyaccjerkmeanx - mean of body acceleration jerk along x-axis in frequency domain
fbodyaccjerkmeany - mean of body acceleration jerk along y-axis in frequency domain
fbodyaccjerkmeanz - mean of body acceleration jerk along z-axis in frequency domain
fbodyaccjerkstdx - std of body acceleration jerk along x-axis in frequency domain
fbodyaccjerkstdy - std of body acceleration jerk along y-axis in frequency domain
fbodyaccjerkstdz - std of body acceleration jerk along z-axis in frequency domain
fbodyaccjerkmeanfreqx - mean frequency of body acceleration jerk along x-axis in frequency domain
fbodyaccjerkmeanfreqy - mean frequency of body acceleration jerk along y-axis in frequency domain
fbodyaccjerkmeanfreqz - mean frequency of body acceleration jerk along z-axis in frequency domain
fbodygyromeanx - mean of body angular velocity along x-axis in frequency domain
fbodygyromeany - mean of body angular velocity along y-axis in frequency domain
fbodygyromeanz - mean of body angular velocity along z-axis in frequency domain
fbodygyrostdx - std of body angular velocity along x-axis in frequency domain
fbodygyrostdy - std of body angular velocity along y-axis in frequency domain
fbodygyrostdz - std of body angular velocity along z-axis in frequency domain
fbodygyromeanfreqx - mean frequency of body angular velocity along x-axis in frequency domain
fbodygyromeanfreqy - mean frequency of body angular velocity along y-axis in frequency domain
fbodygyromeanfreqz - mean frequency of body angular velocity along z-axis in frequency domain
fbodyaccmagmean - mean of body acceleration using Euclidean norm in frequency domain
fbodyaccmagstd - std of body acceleration using Euclidean norm in frequency domain
fbodyaccmagmeanfreq - mean frequency of body acceleration using Euclidean norm in frequency domain
fbodyaccjerkmagmean - mean of body acceleration jerk using Euclidean norm in frequency domain
fbodyaccjerkmagstd - std of body acceleration jerk using Euclidean norm in frequency domain
fbodyaccjerkmagmeanfreq - mean frequency of body acceleration jerk using Euclidean norm in frequency domain
fbodygyromagmean - mean of body angular velocity using Euclidean norm in frequency domain
fbodygyromagstd - std of body angular velocity using Euclidean norm in frequency domain
fbodygyromagmeanfreq - mean frequency of body angular velocity using Euclidean norm in frequency domain
fbodygyrojerkmagmean - mean of body jerk using Euclidean norm in frequency domain
fbodygyrojerkmagstd - std of body jerk using Euclidean norm in frequency domain
fbodygyrojerkmagmeanfreq - mean frequency of body jerk using Euclidean norm in frequency domain
