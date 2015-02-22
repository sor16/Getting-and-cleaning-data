# Importing the packages for this project.

library(plyr)
library(dplyr)

# Downloading the file by saving it to a temporary file, unzipping it and then unlinking it.

temp=tempfile()
download.file("http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",temp)
data=unzip(temp);
unlink(temp)

# Fetching the appropriate data and renaming the column names properly.

features = read.table(data[2])

test.subject = read.table(data[14])
names(test.subject) = "subject"

test.x = read.table(data[15])
names(test.x) = as.character(features[ ,2])

test.y = read.table(data[16])
names(test.y) = "activity"

# Binding the test data together

test = cbind(test.subject,test.y,test.x)

train.subject = read.table(data[26])
names(train.subject) = "subject"

train.x = read.table(data[27])
names(train.x) = as.character(features[ ,2])

train.y = read.table(data[28])
names(train.y) = "activity"

# Binding the train data together.

train = cbind(train.subject,train.y,train.x)

# Merging the training and test sets to create one data set.

mergeddata = rbind(test,train)

# Sorting the mergeddata so it is easier to read.

mergeddata = arrange(mergeddata, activity)
mergeddata = arrange(mergeddata, subject)

# Getting the indices where the column names have the words mean or std in it and subsetting the mergeddata with them.

indices_including_mean_or_std = grep("-mean\\(\\)|-std\\(\\)", features[, 2])
mergeddata = mergeddata[,indices_including_mean_or_std]

# Make a tidy data set with the average of each variable for each activity and each subject in only one command.

finalData = ddply(mergeddata, .(subject,activity), sapply,FUN='mean')

# Finishing it off by renaming the activity names from numbers to the name of each of the six activities.

activity_labels = read.table(data[1])

act = rep(activity_labels[,2],30)
finalData$activity = act
 