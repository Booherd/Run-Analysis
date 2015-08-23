# Run-Analysis
Code for analyzing Samsung Data - Getting and Cleaning Data Course Project

The Script run_analysis.R loads data from collected from Samsung Galaxy smartphones.
The data can be downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
The data must be unzipped, and the "UCI HAR Dataset" folder MUST be placed in the working directory.

The script runs multiple steps in order to produce a clean set of data showing the avergaes of 66 variables by subject (30 total) and activity (6)
The first step is to load some universal data from the "UCI HAR Dataset" folder in the working directory to create the variable names.
Next 3 files of "test" data are loaded and combined
Then 3 files of "train" data are similarly combined
Finally a complete set of test and train data is assembled with all 30 participants

The code applies the variable names from the "features" file to their matching columns
Since only the means and std's are necessary for our data set, all other columns are removed.
  -For this example, only the variables labeled as "mean() or std() were used.  Variables labeled as meanFreq() were not included, since that represents a different type of data
  
Next the mean value of each variable was calculated for each activity for each participant, creating 180 rows of means accross all 66 variables. 

Finally, the activity names were inserted into the table for their correpsonding activity numbers.
