# Code book
Describes the variables, the data, and any transformations, work that we performed to clean up the data.
### Summerize about raw data.
The raw data sets are gotten from Human Activity Recognition project. Please refer to http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones to get more information about human activiry recognition. Here is the link of the raw data set: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Extract the zip file and refer to README.txt file to get more information about variables in these data sets.
Here is the file structure of raw data:
```sh
├── activity_labels.txt 
├── features_info.txt
├── features.txt
├── file.txt
├── README.txt
├── test
│   ├── Inertial Signals
│   │   ├── body_acc_x_test.txt
│   │   ├── body_acc_y_test.txt
│   │   ├── body_acc_z_test.txt
│   │   ├── body_gyro_x_test.txt
│   │   ├── body_gyro_y_test.txt
│   │   ├── body_gyro_z_test.txt
│   │   ├── total_acc_x_test.txt
│   │   ├── total_acc_y_test.txt
│   │   └── total_acc_z_test.txt
│   ├── subject_test.txt
│   ├── X_test.txt
│   └── y_test.txt
└── train
    ├── Inertial Signals
    │   ├── body_acc_x_train.txt
    │   ├── body_acc_y_train.txt
    │   ├── body_acc_z_train.txt
    │   ├── body_gyro_x_train.txt
    │   ├── body_gyro_y_train.txt
    │   ├── body_gyro_z_train.txt
    │   ├── total_acc_x_train.txt
    │   ├── total_acc_y_train.txt
    │   └── total_acc_z_train.txt
    ├── subject_train.txt
    ├── X_train.txt
    └── y_train.txt
```
### Summerize about variables in the final tiny data.
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

## The variables in tiny data.
- Variable have string "mean()" and "std()" are the measurements on the mean and standard deviation for each measurement.
- The variable "subject" is of 30 volunteers within an age bracket of 19-48 years.
- The variable "activity" is describle the activity of each people, it is in six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).

```sh
 [1] "subject"                              "activity"                             "time-BodyAcc-mean()-X"               
 [4] "time-BodyAcc-mean()-Y"                "time-BodyAcc-mean()-Z"                "time-BodyAcc-std()-X"                
 [7] "time-BodyAcc-std()-Y"                 "time-BodyAcc-std()-Z"                 "time-GravityAcc-mean()-X"            
[10] "time-GravityAcc-mean()-Y"             "time-GravityAcc-mean()-Z"             "time-GravityAcc-std()-X"             
[13] "time-GravityAcc-std()-Y"              "time-GravityAcc-std()-Z"              "time-BodyAccJerk-mean()-X"           
[16] "time-BodyAccJerk-mean()-Y"            "time-BodyAccJerk-mean()-Z"            "time-BodyAccJerk-std()-X"            
[19] "time-BodyAccJerk-std()-Y"             "time-BodyAccJerk-std()-Z"             "time-BodyGyro-mean()-X"              
[22] "time-BodyGyro-mean()-Y"               "time-BodyGyro-mean()-Z"               "time-BodyGyro-std()-X"               
[25] "time-BodyGyro-std()-Y"                "time-BodyGyro-std()-Z"                "time-BodyGyroJerk-mean()-X"          
[28] "time-BodyGyroJerk-mean()-Y"           "time-BodyGyroJerk-mean()-Z"           "time-BodyGyroJerk-std()-X"           
[31] "time-BodyGyroJerk-std()-Y"            "time-BodyGyroJerk-std()-Z"            "time-BodyAccMag-mean()"              
[34] "time-BodyAccMag-std()"                "time-GravityAccMag-mean()"            "time-GravityAccMag-std()"            
[37] "time-BodyAccJerkMag-mean()"           "time-BodyAccJerkMag-std()"            "time-BodyGyroMag-mean()"             
[40] "time-BodyGyroMag-std()"               "time-BodyGyroJerkMag-mean()"          "time-BodyGyroJerkMag-std()"          
[43] "frequency-BodyAcc-mean()-X"           "frequency-BodyAcc-mean()-Y"           "frequency-BodyAcc-mean()-Z"          
[46] "frequency-BodyAcc-std()-X"            "frequency-BodyAcc-std()-Y"            "frequency-BodyAcc-std()-Z"           
[49] "frequency-BodyAccJerk-mean()-X"       "frequency-BodyAccJerk-mean()-Y"       "frequency-BodyAccJerk-mean()-Z"      
[52] "frequency-BodyAccJerk-std()-X"        "frequency-BodyAccJerk-std()-Y"        "frequency-BodyAccJerk-std()-Z"       
[55] "frequency-BodyGyro-mean()-X"          "frequency-BodyGyro-mean()-Y"          "frequency-BodyGyro-mean()-Z"         
[58] "frequency-BodyGyro-std()-X"           "frequency-BodyGyro-std()-Y"           "frequency-BodyGyro-std()-Z"          
[61] "frequency-BodyAccMag-mean()"          "frequency-BodyAccMag-std()"           "frequency-BodyBodyAccJerkMag-mean()" 
[64] "frequency-BodyBodyAccJerkMag-std()"   "frequency-BodyBodyGyroMag-mean()"     "frequency-BodyBodyGyroMag-std()"     
[67] "frequency-BodyBodyGyroJerkMag-mean()" "frequency-BodyBodyGyroJerkMag-std()" 
```
The set of variables that were estimated from these signals are: 
```sh
mean(): Mean value
std(): Standard deviation
```