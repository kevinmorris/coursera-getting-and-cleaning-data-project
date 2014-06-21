Getting and Cleaning Data Course Project
========================================

This repository is the submission for the course project for Coursera's "Getting and Cleaning Data" by Johns Hopkins University.

The relevant source code is in run_analysis.R.  The data that this script uses is also included in this repository.  You may run the data analysis by loading the run_analysis.R source file and
running the function
```
run_analysis()
```

The function will write two text files to disk in the directory where the script is run.  The first, analysis.txt, contains the output of steps 1 through 4 of the project requirements.  The second, analysis_average_subject_activity.txt, contains the average of the values per subject/activity as described in step 5.

The function also returns a list containing two values.  The first, $data, contains parts 1 through 4 of the project which is the cleaning of the original UCI HAR Dataset.  The second item in the list, $summary contains part 5 of the project: the second independent dataset with the averages of the subject/activity group.

the function takes an optional parameter, ```dir```, that specifies the root of the UCI HAR Dataset.  The parameter defaults to the current directory and assumes that the script resides in the same directory as the data.