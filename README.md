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


## More information on the original data set

For more details on the original data set, see the
["Human Activity Recognition Using Smartphones Data Set" website][HAR-UCI].


## Further remarks

I tried to use the [`dplyr`][dplyr] and [`tidyr`][tidyr] packages as much as 
possible when writing the code---including the use of the `%>%` forward-pipe 
operator (as implemented in the [`magrittr`][magrittr] package).

The comments in "run_analysis.r" are formatted as roxygen2 style comments, so 
that the code can be turned into an [R notebook][R_notebook] (e.g., in RStudio).


[HAR-UCI]: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
[dplyr]: http://cran.r-project.org/web/packages/dplyr/
[tidyr]: http://cran.r-project.org/web/packages/tidyr/
[magrittr]: http://cran.r-project.org/web/packages/magrittr/
[R_notebook]: http://rmarkdown.rstudio.com/r_notebook_format.html