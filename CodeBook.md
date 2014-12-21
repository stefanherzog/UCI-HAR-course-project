# Code book for "tidy.txt"

For more details on the original data set, see the
[Human Activity Recognition Using Smartphones Data Set][HAR-UCI] website and
"README.txt" and "features_info.txt" contained in the ZIP-file.

The following subsections describe the four columns in the "tidy.txt" data set, 
which has been cast in a long format.


## subject
number uniquely identifying each subject (ranges from 1 to 30)

## activity
name of the activity (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, 
SITTING, STANDING, LAYING)

## variable
pattern-variable combination (e.g., "tBodyAcc-mean()-X");
see "features_info.txt" for more details

## average
arithmetic mean of all observation values for a particular combination
of subject, activity and pattern-variable (original features 
averaged here have been normalized and bounded within [-1,1])


[HAR-UCI]: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones