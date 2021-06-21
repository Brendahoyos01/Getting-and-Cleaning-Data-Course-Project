The analysis of the dataset corresponds to the final project of Getting and Cleaning Data course in Coursera, which aims to 
create a tidy dataset from a raw dataset. 
The original dataset was Human Activity Recognition Using Smartphones Dataset Version 1.0, please visit  
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones to get more information of the raw data.

The files containing the training and test data were merged to create one dataset from the Human Activity Recognition dataset. Then, the values for 
the mean and standard deviation for each measurement was extracted. More descriptive activity names were used to rename the activities in the resulting 
dataframe, according to the information of the activity_labels file. Next, the variable names were modified for more illustrative ones. Finally, a summary based on
extracting the mean for each variable was extracted and this resulting dataframe was recorded as 'SecondTidyDataset.txt' file. Likewise, the R script for this purpose
can be found in GitHub in a file called run_analysis.R . 
 

How the experiments were carried out:
======================================
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, 
WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer
and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded 
to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the
training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec 
and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth
low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz
cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 
See 'features_info.txt' for more details. 

Taken from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
 
For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

Taken from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


The dataset includes the following files:
=========================================

- 'README.txt'
- 'Codebook.txt'
- 'SecondTidyDataset.txt': A merged datased with the training ('train/X_train.txt', 'train/y_train.txt'), test ('test/X_test.txt', 'test/y_test.txt')
   and subject (subject_train, subject_train) values.
 
