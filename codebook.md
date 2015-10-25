---
title: "Codebook"
author: "Iván Paz"
date: "25 10 2015"
output:
  html_document:
    keep_md: yes
---
# Project description
This project 

## data
the data for the project is abailable at:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
and described in the following link:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
Rougly speaking it contains data collected from the accelerometers from the Samsung Galaxy S smartphones for different users and different activities.


## Processing
The script called run_analysis.R that does the following analysis: 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names (like "SITTING", "STANDING", "SLEEPING", or "WALKING_DOWNSTAIRS") containing in the file activity_labels.txt to name the activities in the data set.
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
This subset is exported int a txt table format.
