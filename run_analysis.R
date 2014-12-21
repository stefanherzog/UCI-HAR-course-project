#' # Setting things up


#' ## Empty workspace
rm(list=ls())


#' ## Set the working directory
setwd("/Users/herzog/GitHub/UCI-HAR-course-project")


#' ## Load packages
#' Install if not yet installed.

if (!"dplyr" %in% installed.packages()) install.packages("dplyr")
library(dplyr)

if (!"tidyr" %in% installed.packages()) install.packages("tidyr")
library(tidyr)

if (!"stringr" %in% installed.packages()) install.packages("stringr")
library(stringr)


#' # Download the data and extract files from ZIP file

#' Per instruction the data is downloaded into the working directory
#' (and not into a "data" subdirectory):
#' "The code should have a file run_analysis.R in the main directory that can 
#' be run as long as the Samsung data is in your working directory."

#' Since the instructions assume that "the Samsung data is in your 
#' working directory", I commented out the following three lines, which
#' download and unzip the data.

# urlZIP <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
# download.file(urlZIP, destfile = "./UCI HAR Dataset.zip", method = "curl")
# unzip(zipfile = "./UCI HAR Dataset.zip")


#' # Read relevant data from text files


#' ## Meta-data
setwd("./UCI HAR Dataset")

#' Read in activity labels:
activity_labels <- 
        read.table("activity_labels.txt", stringsAsFactors = FALSE) %>%
        rename(., activity = V1, activity_label = V2)

#' Read in feature names:
features <-
        read.table("features.txt", stringsAsFactors = FALSE) %>%
        rename(., column = V1, feature_name = V2) %>%
        tbl_df


#' ## Training data

setwd("./train")

#' Per the README.txt and features.txt we know that there are 561 numerical
#' variables in the two feature matrices X_train and X_test.
#' Using this knowledge roughly halves the time to import the matrices
#' (as indicated by my explorations with `system.time()`)

subject_train <- read.table("subject_train.txt")
X_train <- read.table("X_train.txt", colClasses = rep("numeric", 561))
y_train <- read.table("y_train.txt")


#' ## Test data

setwd("../test")

subject_test <- read.table("subject_test.txt")
X_test <- read.table("X_test.txt", colClasses = rep("numeric", 561))
y_test <- read.table("y_test.txt")


#' # Merge the train and test datasets

#' "1) Merges the training and the test sets to create one data set."
X <- tbl_df(rbind(X_train, X_test))
y <- c(y_train[,1], y_test[,1])
subject <- c(subject_train[,1], subject_test[,1])


#' # Extract relevant measurements

#' "2) Extracts only the measurements on the mean and 
#' standard deviation for each measurement." 

#' Find the names and the positions of the relevant measurements in X
#' using features.txt

vars.mean.name <- features$feature_name %>%
        grep(pattern = "mean()", ., value=TRUE, fixed=TRUE) #%>%
        #make.names(.)

vars.mean.position <- 
        grep(pattern = "mean()", features$feature_name,
             value=FALSE, fixed=TRUE)

vars.std.name <- features$feature_name %>%
        grep(pattern = "std()", ., value=TRUE, fixed=TRUE) #%>%
        #make.names(.)

vars.std.position <- 
        grep(pattern = "std()", features$feature_name,
             value=FALSE, fixed=TRUE)


#' "3) Uses descriptive activity names to name the activities in the data set"
activity <- factor(x = y, 
       levels = activity_labels$activity, 
       labels = activity_labels$activity_label)


#' "4) Appropriately labels the data set with descriptive variable names."
#' Select and name the columns

X.mean <- X[,vars.mean.position]
colnames(X.mean) <- vars.mean.name

X.std <- X[,vars.std.position]
colnames(X.std) <- vars.std.name


#' "5) From the data set in step 4, creates a second, independent tidy data 
#' set with the average of each variable for each activity and each subject."

dat <- cbind(subject = subject, activity, X.mean, X.std) %>%
        tbl_df %>%
        gather(variable, value, -subject, -activity)

tidy_df <- group_by(dat, subject, activity, variable) %>%
        summarize(., average = mean(value)) %>%
        arrange(., subject, activity, variable)


setwd("../../")

write.table(tidy_df, file = "tidy.txt", row.names = FALSE)