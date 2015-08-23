Welcome to the Readme for run_analyis()
From the top:
We pull the disparate file from my working directory.  (there was no requirement to download)
Then we row combine the training and test data per the instructions.
Then we column combine all the subject to all the accelerometer data.
Now it gets interesting:
 using lapply I pushed in the activity names with a convert function.  It's at the top.
 Now we have pretty row names but the columns are all "V1", "V2", etc.  This won't do for Tidy Data
  Also abiding this "Extracts only the measurements on the mean and standard deviation for each measurement."
    I subset only those measurements that were means and standard deviations.
 I went through and gave them better name from the features.txt data.
 So armed with clean data and names.  I used summarize to take the mean of all the means.
 While I cannot imagine how to use this, I took a strict reading of "...the average of each variable for each activity and each subject"
  and took the mean of all the means and standard deviations I had, by Subject and by Activity.
  Enjoy and please the codebook.md for more information.

  To run just type run_analysis in R.  You will have to change the working directory, it's hard coded.

  Jeff
