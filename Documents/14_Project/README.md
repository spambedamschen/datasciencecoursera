## Step 1
Merging Data with cbind for x_train, subject_train and y_train and the equivalent of the test data.
After that I rowbinded the two data frames - the one for train and the other one for test

## Step 2
By extracting the second column of the feature file I got the names
with the names(data) comand I added the names to the variable

## Step 3
The third step for me was the subsetting of the columns including std and mean.
I used the grep comand to create a stddata variable as well as a meandata variable.
After that I cbinded the stddata and the meandata together to create one data set.

## Step 4 - names for activity sets
Add names for activity instead of numbers from 1 to 6 using mutate function from the dplyr library

## Step 5
Group data with group_by function by Subjectname and Activity

## Step 6
Rename variabelnames. Capital letters and deleting brackets.
Saving names in separate textfile and then adding to the data. 
Variabelnames are named in CodeBook
Attention: to fulfill this step on your machine you need to download the labelnames.txt file from my repo



