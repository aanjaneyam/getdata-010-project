# getdata-010-project
Coursera getting and cleaning data course project.

The Purpose of this project is to download a file containing datasets from URL [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and process the data contained therein according to given requirements to create a final tidy dataset. In order to process and clean the downloaded datasets the project script performs following tasks:

1. Merges the training and the test sets to create one dataset.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the dataset with descriptive variable names. 
5. From the dataset in step 4, creates a second, independent tidy dataset with the average of each variable for each activity and each subject.

## Project Content

The project contains three files :

* **run_analysis.R** - this is the main script which does all the work involved in creating the final tidy dataset. It downloads and processes the given datasets to create the final tidy dataset named tidy_data.txt. run_analysis.R file is well commented at every stage.

* **Codebook.md** - This file contains details of all the variables in the tidy dataset and any transformations or work that was performed to clean up the data.

* **Readme.md** - This file gives a short overview of the project and explains the working of the run_analysis.R script.


## run_analysis.R 

The script in run_analysis.R does all the processing to clean the given datasets and create a final tidy dataset. before running run_analysis.R please make sure it is in the current working directory of R. run_analysis performs following steps to fulfill the required tasks:

1. Downloads the project file containing required datasets from [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). The downloaded file is named as getdata-projectfile_UCI_HAR_Dataset.zip and placed into project_data directory in the current working directory. The script also creates dateDownloaded object.

2. The downloaded file is then unzipped and its extracted content are placed in UCI HAR Dataset directory inside project_data directory. To complete the project we just need the the following files from the data (files in the "Inertial Signals" directory are not needed as they do not have mean and std measurements)

    * UCI HAR Dataset/test/subject_test.txt
    * UCI HAR Dataset/test/X_test.txt
    * UCI HAR Dataset/test/y_test.txt
    * UCI HAR Dataset/train/subject_train.txt
    * UCI HAR Dataset/train/X_train.txt
    * UCI HAR Dataset/train/y_train.txt
    * UCI HAR Dataset/features.txt
    * UCI HAR Dataset/activity_labels.txt
   
3. run_analysis.R reads (using read.table function) all the above mentioned datasets, in step 2, and stores them in seperate table objects thereby loading them into R enviornment.

4. The script then merges the training and test sets to create one big data set. In order to do so it first sets column names of variables/objects created in step 3 and then uses cbind and rbind functions to appropriately merge the table objects.

5. run_analysis then extracts only the measurements on the mean and standard deviation for each measurement in the big dataset created in step 4 and stores it.

6. The script sets descriptive activity names for the activities in the big dataset by merging it with activity_labels table and removing the unneeded variable for activity codes.

7. Labels of the dataset are then reset with descriptive names using names() and gsub() functions.

8. run_analysis.R finally creates an independent tidy dataset with the average of each variable for each activity and each subject using aggregate() function. It also orders the dataset by subject and activitynames. Lastly it uses write.table function to write the independent dataset to tidy_data.txt file.