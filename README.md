getting_and_cleaning_data_project
=================================

The entry point is the project is @ run_analysis.R, the function defined there uses the function defined @ assemble_data.R. 

The main tasks executed in run_analysis.R are:

1. Assemble and join both "train" and "test" datasets that includes returns with columns for subject, activity code, activity name and all the variables described in features.txt/feature_info.txt 
2. Remove all features columns except those having "mean()" and "std()" in their names. This data.frames is stored in "complete" variable in code.
3. Finally, aggregates all feature columns (with mean function) grouping by subject and activity name.

The support function assemble located @ assemble_data.R does this:

1. Reads subject, activity and feature measures given as in input the data set ("train" or "test")
2. Read activiti_labels.txt and merges this with activities data to have the activity descriptions for every activity code
3. Horizontally join subject, activity and feature measurement
4. Use features.txt to properly name every column in resulting data.frame

This expects the **"UCI HAR Dataset"** folder to be present in the same folder as this file.