run_analysis <- function(output_filename="wearable_computing_tidy.txt"){
    #Assemble and merge train and test datasets
    source('assemble_data.R');
    train <- assemble("train")
    test <- assemble("test")
    complete <- rbind(train, test)
    
    #Extracts only the measurements on the mean and standard deviation for each measurement
    #keep the columns for subject and activity_name
    selectedColumns <- (grepl(pattern = "mean\\(\\)", names(complete)) | grepl(pattern = "std\\(\\)", names(complete)))
    complete <- cbind(complete[, c(1,3)], complete[,selectedColumns])
    
    #Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
    aggregationColumns <- names( complete)[3:length(names(complete)) ]
    tidy <- aggregate(complete[aggregationColumns], by=list(complete$subject,complete$activity_name ), FUN=mean)
    names(tidy) <- names(complete)
    
    write.table(tidy,file=output_filename,row.names=TRUE, sep = ";")
    print(paste(output_filename, " has been generated")) 
}