# Getting/Cleaning_data_Course_Project
This repo contains the script for the getting and cleaning data course project
This is how the script works. Each step is also commented throughout the script.
1. Read separate data using read.table() for files contained in test and train, and create a dataframe for each case using cbind()
2. Merge both dataframes into a single dataframe called "activity.df" using rbind
3. Set the column names for the dataframe. First, open the variables names data frame contained into a separate file.
  Second, extract the column with the names, including the first two columns, to a vector and then assign it as        column names of the data frame.
4. Extract only the means and standard deviations for each measurement. Use grepl, that matches patterns in a character vector and merge new data frame with subject and activity columns.
5. Use descriptive activity names to name the activities in the data set. Read activity_labels.txt, and substitute values of "Activity" column of activity.msd dataframe to character values. 
6. use package dplyr, this package contains useful tools (like filters or groupings) that allow us to manipulate the data.
7. group the data by Subject , Activity
8. Calculate the mean of each column
9. remane the columns including "mean" in its names
10. write a table of the final tidy_data using row.names = FALSE

