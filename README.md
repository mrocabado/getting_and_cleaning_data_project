getting_and_cleaning_data_project
=================================

The entry point of this project is the function defined in **run_analysis.R** Support function is defined in **assemble_data.R** 

The main tasks executed in **run_analysis.R** function are:

1. Assemble and join both "train" and "test" datasets that includes returns with columns for subject, activity code, activity name and all the variables described in features.txt/feature_info.txt 
2. Remove all features columns except those having "mean()" and "std()" in their names. This data.frames is stored in "complete" variable in code.
3. Finally, aggregates all feature columns (with mean function) grouping by subject and activity name.

The support function **assemble** located in **assemble_data.R** does this:

1. Reads subject, activity and feature measures files given a the data set location("train" or "test")
2. Read activiti_labels.txt, merges this with activity data to have the activity descriptions for every activity code
3. Horizontally joins subject, activity and feature measurement (all these have the number of rows)
4. Use features.txt to properly name every column in resulting data.frame

The code expects **UCI HAR Dataset** folder to be present in the same folder as this file.