##################################################################
# Download the project file into folder named project_data
##################################################################

# if folder project_data does not exist creat it.
if(!file.exists("./project_data")){
	dir.create("./project_data")
}

# Download the project file getdata-projectfile_UCI HAR Dataset.zip
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
destfile <- "./project_data/getdata-projectfile_UCI_HAR_Dataset.zip"
download.file(fileUrl, destfile, method = "curl")
dateDownloaded <- date()
dateDownloaded

##################################################################
# Unzip the file downloaded file and place all its content in UCI HAR Dataset directory
##################################################################
unzip(destfile, exdir="./project_data")

path_rf <- "./project_data/UCI HAR Dataset"
files<-list.files(path_rf, recursive=TRUE)
files

##################################################################
#### To complete the project we just need the the following files from the data (files in the "Inertial Signals" directory are not needed)

    #UCI HAR Dataset/test/subject_test.txt
    #UCI HAR Dataset/test/X_test.txt
    #UCI HAR Dataset/test/y_test.txt
    #UCI HAR Dataset/train/subject_train.txt
    #UCI HAR Dataset/train/X_train.txt
    #UCI HAR Dataset/train/y_train.txt
	#UCI HAR Dataset/features.txt
	#UCI HAR Dataset/activity_labels.txt
##################################################################

##################################################################
# Load data
##################################################################

# read test dataset's activity, features and subjects
test_data_activity <- read.table("./project_data/UCI HAR Dataset/test/y_test.txt")
test_data_features <- read.table("./project_data/UCI HAR Dataset/test/X_test.txt")
test_data_subject <- read.table("./project_data/UCI HAR Dataset/test/subject_test.txt")

# read train dataset's activity, features and subjects
train_data_activity <- read.table("./project_data/UCI HAR Dataset/train/y_train.txt")
train_data_features <- read.table("./project_data/UCI HAR Dataset/train/X_train.txt")
train_data_subject <- read.table("./project_data/UCI HAR Dataset/train/subject_train.txt")

# read activity lables and feature names
activity_labels <- read.table("./project_data/UCI HAR Dataset/activity_labels.txt")
feature_names <- read.table("./project_data/UCI HAR Dataset/features.txt")

##################################################################
# Merges the training and the test sets to create one data set.
##################################################################

# set names to variables 
names(test_data_activity) <- c("activity")
names(test_data_features) <- feature_names$V2
names(test_data_subject) <- c("subject")
names(train_data_activity) <- c("activity")
names(train_data_features) <- feature_names$V2
names(train_data_subject) <- c("subject")

# Merge the data to create one data set

test_data <- cbind(cbind(test_data_features, test_data_subject), test_data_activity)
train_data <- cbind(cbind(train_data_features, train_data_subject), train_data_activity)
big_data <- rbind(test_data, train_data)
