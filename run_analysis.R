#===============================================================================
#==================== 1. DOWNLOADING LIBRARIES AND PACKAGES ====================
#===============================================================================
library(dplyr)
library(tidyr)

#===============================================================================
#==================== 2. DOWNLOADING DATASETS ==================================
#===============================================================================

#downloading files and unzipping folder
foldername<-"getdata_projectfiles_UCI HAR Dataset"

if(!file.exists(foldername)){
  fileURL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileURL, foldername, 
                method="curl")
  }
  
if(!file.exists("UCI HAR Dataset")){unzip(foldername)}
  
#reading txt files within the unzip

#featuress.txt: List of all features
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","feature_var"))

#activity_labels.txt: Links the class labels with their activity name
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("class_labels", "activity_name"))

#train/X_train.txt: Training set
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$feature_var)

#train/y_train.txt: Training labels
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "class_labels")

#test/X_test.txt: Test set
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$feature_var)

#test/y_test.txt: Test labels
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "class_labels")

#train/subject_train.txt: Each row identifies the subject who performed the 
#activity for each window sample. Its range is from 1 to 30
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")

#train/subject_test.txt: Each row identifies the subject who performed the
#activity for each window sample. Its range is from 1 to 30
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")


#===============================================================================
#======= 3. Merges the training and the test sets to create one data set =======
#===============================================================================

#Merges the training and the test sets to create one data set.
x_merged=rbind(x_train, x_test)
y_merged=rbind(y_train, y_test)
subject_merged=rbind(subject_train, subject_test)
All_dataset=cbind(x_merged, y_merged, subject_merged)

#===============================================================================
#==== 4.Extract only the mean and standard deviation for each measurement ======
#===============================================================================
colnames(All_dataset)

mean_std_subset <- All_dataset %>% select(contains("mean"), contains("std"), 
                                          subject, class_labels)
names(mean_std_subset)

#===============================================================================
#=== 5.Uses descriptive activity names to name the activities in the data set ==
#===============================================================================

mean_std_subset$class_labels<-activities[mean_std_subset$class_labels, 2]
mean_std_subset$class_labels

#===============================================================================
#===== 6.Appropriately labels the data set with descriptive variable names =====
#===============================================================================

names(mean_std_subset)[88]<-"activity_name"
names(mean_std_subset)<-gsub("angle", "Angle", names(mean_std_subset))
names(mean_std_subset)<-gsub("-std()", "STD", names(mean_std_subset), 
                             ignore.case = T)
names(mean_std_subset)<-gsub("Acc", "Accelerometer", names(mean_std_subset))
names(mean_std_subset)<-gsub("Gyro", "Gyroscope", names(mean_std_subset))
names(mean_std_subset)<-gsub("Mag", "Magnitude", names(mean_std_subset))
names(mean_std_subset)<-gsub("^t", "Time", names(mean_std_subset))
names(mean_std_subset)<-gsub("tBody", "TimeBody", names(mean_std_subset))
names(mean_std_subset)<-gsub("-mean()", "Mean", names(mean_std_subset),
                             ignore.case = T)
names(mean_std_subset)<-gsub("BodyBody", "Body", names(mean_std_subset))
names(mean_std_subset)<-gsub("-freq()", "Frequency", names(mean_std_subset),
                             ignore.case = T)
names(mean_std_subset)<-gsub("^f", "Frequency", names(mean_std_subset))
names(mean_std_subset)<-gsub("gravity", "Gravity", names(mean_std_subset))

#===============================================================================
#====== 7.From the data set in step 4, creates a second, independent tidy ====== 
#=data set with the average of each variable for each activity and each subject=
#===============================================================================
mean_std_subset2<- mean_std_subset %>% group_by(subject, activity_name) %>% summarise_all(funs(mean))
str(mean_std_subset2)

write.table(mean_std_subset2, "SecondTidyDataset.txt", row.name=FALSE)

