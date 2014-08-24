assemble <- function(dataSet="train"){
    #File names
    folder <- paste("UCI HAR Dataset", dataSet, sep="\\")
    subjectFile <- paste("subject_", dataSet,".txt", sep="")
    activityFile <- paste("y_", dataSet,".txt", sep="")
    featureFile <- paste("X_", dataSet,".txt", sep="")
    
    # read fiels
    subjects <- read.table(paste(folder, subjectFile,  sep="\\"), header = FALSE)
    activities <- read.table(paste(folder, activityFile,  sep="\\"), header = FALSE)
    features <- read.table(paste(folder, featureFile,  sep="\\"), header = FALSE)
    
    #Add activi descritions
    activity_labels <- read.table("UCI HAR Dataset\\activity_labels.txt", header = FALSE)
    activities <- merge(activities, activity_labels, by.x="V1", by.y="V1")

    # Join files
    result <- cbind(subjects, activities, features)
    # Change column names
    feature_names <- read.table("UCI HAR Dataset\\features.txt", header = FALSE)
    colnames <- c("subject","activity_code","activity_name", as.character(feature_names$V2) )
    names(result) <- colnames
    
    result
}

