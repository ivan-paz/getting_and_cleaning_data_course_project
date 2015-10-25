#####################################################################
# This is the script for the getting and cleaning data course proyect
# Ivan Paz
#
#####################################################################

#Read separate data and create a dataframe using cbind
test<- read.table("/Users/tuno/Documents/tuno/data_science_specialization/getting_and_cleanning_data/course_project/UCI_HAR_Dataset/test/X_test.txt")
test.subjects<-read.table("/Users/tuno/Documents/tuno/data_science_specialization/getting_and_cleanning_data/course_project/UCI_HAR_Dataset/test/subject_test.txt")
test.activities<-read.table("/Users/tuno/Documents/tuno/data_science_specialization/getting_and_cleanning_data/course_project/UCI_HAR_Dataset/test/y_test.txt")

testdf <- cbind(test.subjects,test.activities,test)

training <- read.table("/Users/tuno/Documents/tuno/data_science_specialization/getting_and_cleanning_data/course_project/UCI_HAR_Dataset/train/X_train.txt")
training.subjects <- read.table("/Users/tuno/Documents/tuno/data_science_specialization/getting_and_cleanning_data/course_project/UCI_HAR_Dataset/train/subject_train.txt")
training.activities <- read.table("/Users/tuno/Documents/tuno/data_science_specialization/getting_and_cleanning_data/course_project/UCI_HAR_Dataset/train/y_train.txt")
trainingdf<- cbind(training.subjects,training.activities,training)

#merge both data
activity.df <- rbind(trainingdf,testdf)
length(activity.df)

## First, open the variables names data frame.
features <- read.table("/Users/tuno/Documents/tuno/data_science_specialization/getting_and_cleanning_data/course_project/UCI_HAR_Dataset/features.txt") 
## Second, extract the column with the names, including the first two columns, to a vector and then assign it as column names of the data frame 
d <- c("Subject", "Activity")
features.names <- features[, 2]
features.names <- as.character(features.names)
features.names <- c(d, features.names)
colnames(activity.df) <- features.names
#now adtivity.df contains the names of the columns

##Extract only the means and standard deviations for each measurement. 
## Use grepl, that matches patterns in a character vector and merge new data frame with subject and activity columns
activity.msd <- activity.df[, grepl("\\bmean()\\b|\\bstd()\\b",colnames(activity.df))] 
act.2columns <- activity.df[, 1:2]
activity.msd <- cbind(act.2columns, activity.msd)

## Use descriptive activity names to name the activities in the data set
## Read activity_labels.txt, and substitute values of "Activity" column of activity.msd dataframe to character values. 
act.labels <- read.table("/Users/tuno/Documents/tuno/data_science_specialization/getting_and_cleanning_data/course_project/UCI_HAR_Dataset/activity_labels.txt")
activity.msd$Activity <- act.labels$V2[activity.msd$Activity]


#use package dplyr, this package contains useful tools (like filters or groupings) that allow us to manipulate the data.
install.packages('dplyr') #install the package
library("dplyr") #call the library

activity.msd <- tbl_df(activity.msd) # convert my data into a table format. This makes the manipulation easy for dplyr.
#group by Subject , Activity
activity_groups <- group_by(activity.msd, Subject, Activity)

#apply summarise
tidy_data<-summarise_each(activity_groups,funs(mean),c(3:67))


#remane the columns including "mean" in its names
names(tidy_data) <- sprintf('mean_%s', names(tidy_data))
colnames(tidy_data)[colnames(tidy_data)== "mean_Subject" ]<- "Subject"
colnames(tidy_data)[colnames(tidy_data)== "mean_Activity" ]<- "Activity"

#write table of tidy_data using row.names = FALSE
write.table(tidy_data, file = "table.txt", row.names = FALSE)




