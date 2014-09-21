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


Following are the features/variables (other than 1. subjectid and 2. activityname) in the *tidydata.txt* file:  
(*Kindly note that data on each of the variable below in tidydata.txt file is actually mean of that variable.*)  
3. tbodyaccmeanx - mean of body acceleration along x-axis in time domain  
4. tbodyaccmeany - mean of body acceleration along y-axis in time domain  
5. tbodyaccmeanz - mean of body acceleration along z-axis in time domain  
6. tbodyaccstdx - std of body acceleration along x-axis in time domain  
7. tbodyaccstdy - std of body acceleration along y-axis in time domain  
8. tbodyaccstdz - std of body acceleration along z-axis in time domain  
9. tgravityaccmeanx - mean of gravity acceleration along x-axis in time domain  
10.tgravityaccmeany - mean of gravity acceleration along y-axis in time domain  
11.tgravityaccmeanz - mean of gravity acceleration along z-axis in time domain  
12.tgravityaccstdx - std of gravity acceleration along x-axis in time domain  
13.tgravityaccstdy - std of gravity acceleration along y-axis in time domain  
14.tgravityaccstdz - std of gravity acceleration along z-axis in time domain  
15.tbodyaccjerkmeanx - mean of body acceleration jerk along x-axis in time domain  
16.tbodyaccjerkmeany - mean of body acceleration jerk along y-axis in time domain  
17.tbodyaccjerkmeanz - mean of body acceleration jerk along z-axis in time domain  
18.tbodyaccjerkstdx - std of body acceleration jerk along x-axis in time domain  
19.tbodyaccjerkstdy - std of body acceleration jerk along y-axis in time domain  
20.tbodyaccjerkstdz - std of body acceleration jerk along z-axis in time domain  
21.tbodygyromeanx - mean of body angular velocity along x-axis in time domain  
22.tbodygyromeany - mean of body angular velocity along y-axis in time domain  
23.tbodygyromeanz - mean of body angular velocity along z-axis in time domain  
24.tbodygyrostdx - std of body angular velocity along x-axis in time domain  
25.tbodygyrostdy - std of body angular velocity along y-axis in time domain  
26.tbodygyrostdz - std of body angular velocity along z-axis in time domain  
27.tbodygyrojerkmeanx - mean of body jerk along x-axis in time domain  
28.tbodygyrojerkmeany - mean of body jerk along y-axis in time domain  
29.tbodygyrojerkmeanz - mean of body jerk along z-axis in time domain  
30.tbodygyrojerkstdx - std of body jerk along x-axis in time domain  
31.tbodygyrojerkstdy - std of body jerk along y-axis in time domain  
32.tbodygyrojerkstdz - std of body jerk along z-axis in time domain  
33.tbodyaccmagmean - mean of body acceleration using Euclidean norm in time domain  
34.tbodyaccmagstd - std of body acceleration using Euclidean norm in time domain  
35.tgravityaccmagmean - mean of gravity acceleration using Euclidean norm in time domain  
36.tgravityaccmagstd - std of gravity acceleration using Euclidean norm in time domain  
37.tbodyaccjerkmagmean - mean of body acceleration jerk using Euclidean norm in time domain  
38.tbodyaccjerkmagstd - std of body acceleration jerk using Euclidean norm in time domain  
39.tbodygyromagmean - mean of body angular velocity using Euclidean norm in time domain  
40.tbodygyromagstd - std of body angular velocity using Euclidean norm in time domain  
41.tbodygyrojerkmagmean - mean of body jerk using Euclidean norm in time domain  
42.tbodygyrojerkmagstd - std of body jerk using Euclidean norm in time domain  
43.fbodyaccmeanx - mean of body acceleration along x-axis in frequency domain  
44.fbodyaccmeany - mean of body acceleration along y-axis in frequency domain  
45.fbodyaccmeanz - mean of body acceleration along z-axis in frequency domain  
46.fbodyaccstdx - std of body acceleration along x-axis in frequency domain  
47.fbodyaccstdy - std of body acceleration along y-axis in frequency domain  
48.fbodyaccstdz - std of body acceleration along z-axis in frequency domain  
49.fbodyaccmeanfreqx - mean frequency of body acceleration along x-axis in frequency domain  
50.fbodyaccmeanfreqy - mean frequency of body acceleration along y-axis in frequency domain  
51.fbodyaccmeanfreqz - mean frequency of body acceleration along z-axis in frequency domain  
52.fbodyaccjerkmeanx - mean of body acceleration jerk along x-axis in frequency domain  
53.fbodyaccjerkmeany - mean of body acceleration jerk along y-axis in frequency domain  
54.fbodyaccjerkmeanz - mean of body acceleration jerk along z-axis in frequency domain  
55.fbodyaccjerkstdx - std of body acceleration jerk along x-axis in frequency domain  
56.fbodyaccjerkstdy - std of body acceleration jerk along y-axis in frequency domain  
57.fbodyaccjerkstdz - std of body acceleration jerk along z-axis in frequency domain  
58.fbodyaccjerkmeanfreqx - mean frequency of body acceleration jerk along x-axis in frequency domain  
59.fbodyaccjerkmeanfreqy - mean frequency of body acceleration jerk along y-axis in frequency domain  
60.fbodyaccjerkmeanfreqz - mean frequency of body acceleration jerk along z-axis in frequency domain  
61.fbodygyromeanx - mean of body angular velocity along x-axis in frequency domain  
62.fbodygyromeany - mean of body angular velocity along y-axis in frequency domain  
63.fbodygyromeanz - mean of body angular velocity along z-axis in frequency domain  
64.fbodygyrostdx - std of body angular velocity along x-axis in frequency domain  
65.fbodygyrostdy - std of body angular velocity along y-axis in frequency domain  
66.fbodygyrostdz - std of body angular velocity along z-axis in frequency domain  
67.fbodygyromeanfreqx - mean frequency of body angular velocity along x-axis in frequency domain  
68.fbodygyromeanfreqy - mean frequency of body angular velocity along y-axis in frequency domain  
69.fbodygyromeanfreqz - mean frequency of body angular velocity along z-axis in frequency domain  
70.fbodyaccmagmean - mean of body acceleration using Euclidean norm in frequency domain  
71.fbodyaccmagstd - std of body acceleration using Euclidean norm in frequency domain  
72.fbodyaccmagmeanfreq - mean frequency of body acceleration using Euclidean norm in frequency domain  
73.fbodyaccjerkmagmean - mean of body acceleration jerk using Euclidean norm in frequency domain  
74.fbodyaccjerkmagstd - std of body acceleration jerk using Euclidean norm in frequency domain  
75.fbodyaccjerkmagmeanfreq - mean frequency of body acceleration jerk using Euclidean norm in frequency domain  
76.fbodygyromagmean - mean of body angular velocity using Euclidean norm in frequency domain  
77.fbodygyromagstd - std of body angular velocity using Euclidean norm in frequency domain  
78.fbodygyromagmeanfreq - mean frequency of body angular velocity using Euclidean norm in frequency domain  
79.fbodygyrojerkmagmean - mean of body jerk using Euclidean norm in frequency domain  
80.fbodygyrojerkmagstd - std of body jerk using Euclidean norm in frequency domain  
81.fbodygyrojerkmagmeanfreq - mean frequency of body jerk using Euclidean norm in frequency domain  
