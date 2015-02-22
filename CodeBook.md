---
title: "CodeBook"
author: "Solvi Rognvaldsson"
date: "22 Feb 2015"
output: html_document
---
Here is the source for the data in the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

For further description about the data set see:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The R-script made for this project performs the following steps to return a clean data set:

**Step 1** Imports the data set into R and fetches the appropriate data:
        
        1.test.subject - Nr. of the participant the measurements are from 
                
        2.test.y - Nr. of activity that the subject is performing 
        
        3.test.x - Measurements from the Samsung on the subject
        
        4.train.subject - Nr. of the participant the measurements are from
        
        5.train.y - Nr. of activity that the subject is performing
        
        6.train.x - Measurements from the Samsung on the subject
                
        7.features - includes the column names of test.x and train.x, that is the variable names

**Step 2** Renames the the column names appropriately, test .subject and train. subject given the name                 subject and test.y and train.y given the name activity. The variable names from feature was passed to test.x and train.x. They include these names and more that are similar:

        * tbodyacc-mean-x 

        * tbodyacc-mean-y 

        * tbodyacc-mean-z 

        * tbodyacc-std-x 

        * tbodyacc-std-y 

        * tbodyacc-std-z 

        * tgravityacc-mean-x 

        * tgravityacc-mean-y

**Step 3** Merges test.subject,test.y.test.x together and train data similarily. Finally the test data and train data are merged forming a 10299x563 data frame. This data frame is called mergeddata.

**Step 4** Filters out only the columns that have to do with mean or standard deviation, and returning 10299x66 data frame,  still called mergeddata.

**Step 5** Sorts the data frame by the activities and the subject to make the data more readable.

**Step 6** Performs calculations on the mean of each activity for each subject, using the ddply from the dplyr package. This returns a data frame called finalData with dimensions 180x66.

**Step 7** Fetches the activity_table from the original dataset and the numbers from 1 through 6 in the activity column was given the names from the activity_table data:

        1 - WALKING
        2 - WALKING_UPSTAIRS
        3 - WALKING_DOWNSTAIRS
        4 - SITTING
        5 - STANDING
        6 - LAYING

**Step 8** Now the data is tidy and easy to read.

