#Getting and Cleaning Data Project Codebook

## Raw data
### Data Collection
Raw data is obtained from UCI Machine Learning repository. In particular the Human Activity Recognition Using Smartphones Data Set is used.
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

####For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

#### The raw dataset includes the following relevant files:
 

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the codes/class with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data.

- 'train/subject_train.txt and test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

### Features/Signals

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

* mean(): Mean value
* std(): Standard deviation
* mad(): Median absolute deviation 
* max(): Largest value in array
* min(): Smallest value in array
* sma(): Signal magnitude area
* energy(): Energy measure. Sum of the squares divided by the number of values. 
* iqr(): Interquartile range 
* entropy(): Signal entropy
* arCoeff(): Autorregresion coefficients with Burg order equal to 4
* correlation(): correlation coefficient between two signals
* maxInds(): index of the frequency component with largest magnitude
* meanFreq(): Weighted average of the frequency components to obtain a mean frequency
* skewness(): skewness of the frequency domain signal 
* kurtosis(): kurtosis of the frequency domain signal 
* bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
* angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean

## Transformations of Raw Data

The raw datasets are processed with run_analisys.R script to create a final tidy dataset. Following steps have been taken for transformation of raw data: 

* All the relevant files, from the raw dataset, have been read into tables.

* The variables of these tables have been appropriately named. Variables for features are labelled with the names assigned by features.txt whereas variables for activities and subjects table of train and test datasets have been named as activity and subject. Variables for activity_lables table have been named as activity and activityname. 

* Test and training data (X_train.txt, X_test.txt), subject ids (subject_train.txt, subject_test.txt) and activity codes (y_train.txt, y_test.txt) are merged to obtain one big dataset.

*  The merged dataset is used to extract an intermediate dataset with only the values of mean (variables with labels that contain "mean") and standard deviation (variables with labels that contain "std").

* A new column is added to intermediate dataset with the descriptive activity names. activity column is used to look up descriptions in activity_labels.txt. In other words merge command has been used to merge the extracted (mean and std) dataset and activity_labels.txt by activity column. The extra activity code column named "activity" has been removed.

* Features labels in the intermediate dataset have been renamed to descriptive names by removing abbreviations, parenthesis and hyphens. names and gsub functions have been used for this purpose.

* Finally an independent tidy dataset named tidy_data is created from intermediate data. The tidy_data is created with the average of each measurement variable for each activity and each subject using aggregate() function. tidy_data dataset has been ordered by subject and activitynames. Lastly write.table function has been used to write the independent dataset to tidy_data.txt file. 


## Tidy Data Variables

* **subject**: an identifier of the subject who carried out the experiment. 1,2,3...29,30. 

* **activityname**: The descriptive name/label of the activity monitored.
    - WALKING
    - WALKING_UPSTAIRS
    - WALKING_DOWNSTAIRS
    - SITTING
    - STANDING
    - LAYING

* **Measurements**: All measurement variables given below are either mean or standard deviation values for each subject and activity. All values are floating point numbers. For easy reading variable names presented below have been categorised acoording to value type.
  
      * Time domain body acceleration mean along X, Y, and Z:  
        - "timeBodyAccelerometerMeanX"                 
        - "timeBodyAccelerometerMeanY"                 
        - "timeBodyAccelerometerMeanZ"              
 
      * Time domain body accelerometer standard deviation along X, Y, and Z:     
        - "timeBodyAccelerometerStdX"
        - "timeBodyAccelerometerStdY"
        - "timeBodyAccelerometerStdZ"
        
      * Time domain gravity accelerometer mean along X, Y, and Z:  
        - "timeGravityAccelerometerMeanX"              
        - "timeGravityAccelerometerMeanY"              
        - "timeGravityAccelerometerMeanZ"             
        
      * Time domain gravity accelerometer standard deviation along X, Y, and Z: 
        - "timeGravityAccelerometerStdX"               
        - "timeGravityAccelerometerStdY"               
        - "timeGravityAccelerometerStdZ"               
        
      * Time domain body accelerometer jerk mean along X, Y, and Z: 
        - "timeBodyAccelerometerJerkMeanX"             
        - "timeBodyAccelerometerJerkMeanY"             
        - "timeBodyAccelerometerJerkMeanZ"             
        
      * Time domain body accelerometer jerk standard deviation along X, Y, and Z: 
        - "timeBodyAccelerometerJerkStdX"              
        - "timeBodyAccelerometerJerkStdY"              
        - "timeBodyAccelerometerJerkStdZ"              
        
      * Time domain body gyroscope mean along X, Y, and Z: 
        - "timeBodyGyroscopeMeanX"                     
        - "timeBodyGyroscopeMeanY"                     
        - "timeBodyGyroscopeMeanZ"                     
        
      * Time domain body gyroscope standard deviation along X, Y, and Z: 
        - "timeBodyGyroscopeStdX"                      
        - "timeBodyGyroscopeStdY"                      
        - "timeBodyGyroscopeStdZ"                      
        
      * Time domain body gyroscope jerk mean along X, Y, and Z: 
        - "timeBodyGyroscopeJerkMeanX"                 
        - "timeBodyGyroscopeJerkMeanY"                 
        - "timeBodyGyroscopeJerkMeanZ"                 
        
      * Time domain body gyroscope jerk standard deviation along X, Y, and Z: 
        - "timeBodyGyroscopeJerkStdX"                  
        - "timeBodyGyroscopeJerkStdY"                  
        - "timeBodyGyroscopeJerkStdZ"                  
        
      * Time domain body accelerometer magnitude mean: 
        - "timeBodyAccelerometerMagnitudeMean"       
        
      * Time domain body accelerometer magnitude standard deviation:  
        - "timeBodyAccelerometerMagnitudeStd"          
        
      * Time domain gravity accelerometer magnitude mean: 
        - "timeGravityAccelerometerMagnitudeMean"      
        
      * Time domain gravity accelerometer magnitude standard deviation: 
        - "timeGravityAccelerometerMagnitudeStd"       
        
      * Time domain body accelerometer jerk magnitude mean: 
        - "timeBodyAccelerometerJerkMagnitudeMean"     
        
      * Time domain body accelerometer jerk magnitude standard deviation: 
        - "timeBodyAccelerometerJerkMagnitudeStd"      
        
      * Time domain body gyroscope magnitude mean: 
        - "timeBodyGyroscopeMagnitudeMean"             
        
      * Time domain body gyroscope magnitude standard deviation: 
        - "timeBodyGyroscopeMagnitudeStd"              
       
      * Time domain body gyroscope jerk magnitude mean:
        - "timeBodyGyroscopeJerkMagnitudeMean"         
        
      * Time domain body gyroscope jerk magnitude standard deviation: 
        - "timeBodyGyroscopeJerkMagnitudeStd"          
        
      * Frequency body acceleration mean along X, Y, and Z:   
        - "frequencyBodyAccelerometerMeanX"            
        - "frequencyBodyAccelerometerMeanY"            
        - "frequencyBodyAccelerometerMeanZ"            
        
      * Frequency body acceleration standard deviation along X, Y, and Z:  
        - "frequencyBodyAccelerometerStdX"             
        - "frequencyBodyAccelerometerStdY"             
        - "frequencyBodyAccelerometerStdZ"             
        
      * Frequency body accelerometer jerk mean along X, Y, and Z: 
        - "frequencyBodyAccelerometerJerkMeanX"        
        - "frequencyBodyAccelerometerJerkMeanY"        
        - "frequencyBodyAccelerometerJerkMeanZ"        
        
      * Frequency body accelerometer jerk standard deviation along X, Y, and Z: 
        - "frequencyBodyAccelerometerJerkStdX"         
        - "frequencyBodyAccelerometerJerkStdY"         
        - "frequencyBodyAccelerometerJerkStdZ"         
        
      * Frequency body gyroscope mean along X, Y, and Z: 
        - "frequencyBodyGyroscopeMeanX"                
        - "frequencyBodyGyroscopeMeanY"                
        - "frequencyBodyGyroscopeMeanZ"                
        
      * Frequency body gyroscope standard deviation along X, Y, and Z:   
        - "frequencyBodyGyroscopeStdX"                 
        - "frequencyBodyGyroscopeStdY"                 
        - "frequencyBodyGyroscopeStdZ"                 
        
      * Frequency body accelerometer magnitude mean: 
        - "frequencyBodyAccelerometerMagnitudeMean"    
        
      * Frequency body accelerometer magnitude standard deviation: 
        - "frequencyBodyAccelerometerMagnitudeStd"     
        
      * Frequency body accelerometer jerk magnitude mean:  
        - "frequencyBodyAccelerometerJerkMagnitudeMean"
        
      * Frequency body accelerometer jerk magnitude standard deviation: 
        - "frequencyBodyAccelerometerJerkMagnitudeStd" 
        
      * Frequency body gyroscope magnitude mean: 
        - "frequencyBodyGyroscopeMagnitudeMean"        
        
      * Frequency body gyroscope magnitude standard deviation: 
        - "frequencyBodyGyroscopeMagnitudeStd"         
        
      * Frequency body gyroscope jerk magnitude mean:
        - "frequencyBodyGyroscopeJerkMagnitudeMean"    
        
      * Frequency body gyroscope jerk magnitude standard deviation: 
        - "frequencyBodyGyroscopeJerkMagnitudeStd"    
    
## Note
* The raw data description text above has been derived from Readme.txt, features_info.txt files downloaded with the raw UCI HAR dataset. 
