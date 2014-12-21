UCI-HAR-course-project
======================

UCI HAR course project for John Hopkins University's 
"Getting and cleaning data" coursera module


## How to use "run_analysis.r"

1. Set the correct working directory at the top of the file.
2. In R: `source("run_analysis.r")`

*Note*: As the instructions say that *"The code should have a file 
run_analysis.R in the main directory that can be run as long as the 
Samsung data is in your working directory"*, I commented out lines 36-38,
which download and unzip the data from the internet.


## The logic behind "run_analysis.r"

From a high-level perspective, the script does the following:

 1. Empty workspace
 2. Set the working directory
 3. Load packages
 4. Download the data and extract files from ZIP file
    (commented out, see note above)
 5. Read relevant data from text files
 6. Merge the train and test datasets
 7. Extract relevant measurements (i.e., the 33 patterns that have a mean and
    a standard deviation variable; see also "features_info.txt")
 8. Label the activity numbers
 9. Select and name the columns
10. Create the tidy data set
11. Write the tidy data set to the text file


## More information on the original data set

For more details on the original data set, see the
["Human Activity Recognition Using Smartphones Data Set" website][HAR-UCI].


## Further remarks

I tried to use the [`dplyr`][dplyr] and [`tidyr`][tidyr] packages as much as 
possible when writing the code---including the use of the `%>%` forward-pipe 
operator (as implemented in the [`magrittr`][magrittr] package).


[HAR-UCI]: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
[dplyr]: http://cran.r-project.org/web/packages/dplyr/
[tidyr]: http://cran.r-project.org/web/packages/tidyr/
[magrittr]: http://cran.r-project.org/web/packages/magrittr/
[R_notebook]: http://rmarkdown.rstudio.com/r_notebook_format.html