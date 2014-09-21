##Course Project : Data Science specialization >Getting and Cleaning Data

### Introduction

This is github  repository for  my work on   the course project for the Coursera course : Data Science specialization -> Getting and Cleaning data. 

It consists of following files

* Readme.md : Markdown file that describes the content of the repository.
* Codebook.md : Markdown file that explains variables, data and the transformations performed.
* run_analysis.R : Analys scripts(R) that is used  to generate tidy data by performing activities like  collect, process and clean 
* tidy.txt : Output of run_analysis.R when run on provided input dataset.

### The Raw Data
The data used for this course is taken from weblink 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.
The data collected from the  accelerometers from the Samsung Galaxy S smartphone. The input data  is devied into to sets - test and training.
The features (561) are unlabeled and are  in the x_test.txt. The activity labels are in the y_test.txt file. The subjects are in the subject_test.txt file.
The same structure holds for the training set also.

### The Script

The developed R scriptnamed as  run_analysis.R does the following. 

* Merges the training and the test sets to create one data set.

* Extracts only the measurements on the mean and standard deviation for each measurement. 

* Uses descriptive activity names to name the activities in the data set

* Appropriately labels the data set with descriptive variable names. 

* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.This tidy dataset is written to a tab-delimited file called tidy.txt, which can also be found in this repository.

It takes an an argument that gives the path of the folder holding the extracted data. It assumes the folder structues and filenames unchanged.

### Code Book

The CodeBook.md file explains the  data, variables and transformations performed to build the tidy data set.