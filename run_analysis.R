run_analysis <- function(dir=".") {
  
  #Rename function in accordance with requirement 4
  rename_names <- function(d) {
    names(d)[names(d) == "V1"] <- "Mean Body Acc Time X"
    names(d)[names(d) == "V2"] <- "Mean Body Acc Time Y"
    names(d)[names(d) == "V3"] <- "Mean Body Acc Time Z"
    names(d)[names(d) == "V4"] <- "Std Body Acc Time X"
    names(d)[names(d) == "V5"] <- "Std Body Acc Time Y"
    names(d)[names(d) == "V6"] <- "Std Body Acc Time Z"
    names(d)[names(d) == "V41"] <- "Mean Gravity Acc Time X"
    names(d)[names(d) == "V42"] <- "Mean Gravity Acc Time Y"
    names(d)[names(d) == "V43"] <- "Mean Gravity Acc Time Z"
    names(d)[names(d) == "V44"] <- "Std Gravity Acc Time X"
    names(d)[names(d) == "V45"] <- "Std Gravity Acc Time Y"
    names(d)[names(d) == "V46"] <- "Std Gravity Acc Time Z"
    names(d)[names(d) == "V81"] <- "Mean Body Acc Jerk Time X"
    names(d)[names(d) == "V82"] <- "Mean Body Acc Jerk Time Y"
    names(d)[names(d) == "V83"] <- "Mean Body Acc Jerk Time Z"
    names(d)[names(d) == "V84"] <- "Std Body Acc Jerk Time X"
    names(d)[names(d) == "V85"] <- "Std Body Acc Jerk Time Y"
    names(d)[names(d) == "V86"] <- "Std Body Acc Jerk Time Z"
    names(d)[names(d) == "V121"] <- "Mean Body Gyro Time X"
    names(d)[names(d) == "V122"] <- "Mean Body Gyro Time Y"
    names(d)[names(d) == "V123"] <- "Mean Body Gyro Time Z"
    names(d)[names(d) == "V124"] <- "Std Body Gyro Time X"
    names(d)[names(d) == "V125"] <- "Std Body Gyro Time Y"
    names(d)[names(d) == "V126"] <- "Std Body Gyro Time Z"
    names(d)[names(d) == "V161"] <- "Mean Body Gyro Jerk Time X"
    names(d)[names(d) == "V162"] <- "Mean Body Gyro Jerk Time Y"
    names(d)[names(d) == "V163"] <- "Mean Body Gyro Jerk Time Z"
    names(d)[names(d) == "V164"] <- "Std Body Gyro Jerk Time X"
    names(d)[names(d) == "V165"] <- "Std Body Gyro Jerk Time Y"
    names(d)[names(d) == "V166"] <- "Std Body Gyro Jerk Time Z"
    names(d)[names(d) == "V201"] <- "Mean Body Acc Magnitude Time"
    names(d)[names(d) == "V202"] <- "Std Body Acc Magnitude Time"
    names(d)[names(d) == "V214"] <- "Mean Gravity Acc Magnitude Time"
    names(d)[names(d) == "V215"] <- "Std Gravity Acc Magnitude Time"
    names(d)[names(d) == "V227"] <- "Mean Body Acc Jerk Magnitude Time"
    names(d)[names(d) == "V228"] <- "Std Body Acc Jerk Magnitude Time"
    names(d)[names(d) == "V240"] <- "Mean Body Gyro Magnitude Time"
    names(d)[names(d) == "V241"] <- "Std Body Gyro Magnitude Time"
    names(d)[names(d) == "V253"] <- "Mean Body Gyro Jerk Magnitude Time"
    names(d)[names(d) == "V254"] <- "Std Body Gyro Jerk Magnitude Time"
    names(d)[names(d) == "V266"] <- "Mean Body Acc FFT X"
    names(d)[names(d) == "V267"] <- "Mean Body Acc FFT Y"
    names(d)[names(d) == "V268"] <- "Mean Body Acc FFT Z"
    names(d)[names(d) == "V269"] <- "Std Body Acc FFT X"
    names(d)[names(d) == "V270"] <- "Std Body Acc FFT Y"
    names(d)[names(d) == "V271"] <- "Std Body Acc FFT Z"
    names(d)[names(d) == "V345"] <- "Mean Body Acc Jerk FFT X"
    names(d)[names(d) == "V346"] <- "Mean Body Acc Jerk FFT Y"
    names(d)[names(d) == "V347"] <- "Mean Body Acc Jerk FFT Z"
    names(d)[names(d) == "V348"] <- "Std Body Acc Jerk FFT X"
    names(d)[names(d) == "V349"] <- "Std Body Acc Jerk FFT Y"
    names(d)[names(d) == "V350"] <- "Std Body Acc Jerk FFT Z"
    names(d)[names(d) == "V424"] <- "Mean Body Gyro FFT X"
    names(d)[names(d) == "V425"] <- "Mean Body Gyro FFT Y"
    names(d)[names(d) == "V426"] <- "Mean Body Gyro FFT Z"
    names(d)[names(d) == "V427"] <- "Std Body Gyro FFT X"
    names(d)[names(d) == "V428"] <- "Std Body Gyro FFT Y"
    names(d)[names(d) == "V429"] <- "Std Body Gyro FFT Z"
    names(d)[names(d) == "V503"] <- "Mean Body Acc Magnitude FFT"
    names(d)[names(d) == "V504"] <- "Std Body Acc Magnitude FFT"
    names(d)[names(d) == "V516"] <- "Mean Body Acc Jerk Magnitude FFT"
    names(d)[names(d) == "V517"] <- "Std Body Acc Jerk Magnitude FFT"
    names(d)[names(d) == "V529"] <- "Mean Body Gyro Magnitude FFT"
    names(d)[names(d) == "V530"] <- "Std Body Gyro Magnitude FFT"
    names(d)[names(d) == "V542"] <- "Mean Body Body Gyro Magnitude FFT"
    names(d)[names(d) == "V543"] <- "Std Body Body Gyro Magnitude FFT"
    
    d
  }
  
  #Create a summary tidy data set with the average 
  create_summary_statistics <- function(split_data) {
    
    summary <- list()
    for(name in names(split_data)) {
      s <- split_data[[name]]
      summary[[name]] <- sapply(s[names(s) != c("Subject", "Activity")], mean, na.rm=T)
    }
    
    summary
  }
  
  #Names we want to select in accordance with requirement 2
  mean_std_features <- c("V1", "V2", "V3", "V4", "V5", "V6", "V41", "V42", "V43", "V44", "V45", "V46", "V81", "V82", "V83", "V84", "V85", "V86", "V121", "V122", "V123", "V124", "V125", "V126", "V161", "V162", "V163", "V164", "V165", "V166", "V201", "V202", "V214", "V215", "V227", "V228", "V240", "V241", "V253", "V254", "V266", "V267", "V268", "V269", "V270", "V271", "V345", "V346", "V347", "V348", "V349", "V350", "V424", "V425", "V426", "V427", "V428", "V429", "V503", "V504", "V516", "V517", "V529", "V530", "V542", "V543")
  
  #Names we want to assign to activities in accordance with requirement 3
  activity_labels <- c("Walking", "Walking Upstairs", "Walking Downstairs", "Sitting", "Standing", "Laying")
  
  
  #--- Test Data ---
  subject_test <- read.table(paste(dir, "/test/subject_test.txt", sep=""))
  x_test <- read.table(paste(dir, "/test/X_test.txt", sep=""))
  
  #2. Extracts only the measurements on the mean and standard deviation for each measurement.  
  x_test_filtered <- x_test[mean_std_features]
  y_test <- read.table(paste(dir, "/test/y_test.txt", sep=""))
  
  
  #--- Training Data ---
  subject_train <- read.table(paste(dir, "/train/subject_train.txt", sep=""))
  x_train <- read.table(paste(dir, "/train/X_train.txt", sep=""))
  
  #2. Extracts only the measurements on the mean and standard deviation for each measurement. 
  x_train_filtered <- x_train[mean_std_features]
  y_train <- read.table(paste(dir, "/train/y_train.txt", sep=""))
  
  
  
  #3. Uses descriptive activity names to name the activities in the data set
  data_test <- x_test_filtered
  data_test$Subject <- subject_test[["V1"]]
  data_test$Activity <- cut(y_test[["V1"]], 6, labels=activity_labels)
  
  data_train <- x_train_filtered
  data_train$Subject <- subject_train[["V1"]]
  data_train$Activity <- cut(y_train[["V1"]], 6, labels=activity_labels)
  
  #1. Merges the training and the test sets to create one data set.
  data <- rbind(data_test, data_train)
  
  #4. Appropriately labels the data set with descriptive variable names. 
  data <- rename_names(data)
  
  #5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  summary <- create_summary_statistics(split(data, data[c("Subject", "Activity")]))
  
  #--- Write the data to text files in the current directory ---
  write.table(data, "analysis.txt")
  write.table(summary, "analysis_average_subject_activity.txt")
  
  #--- Return a list containing both the raw dataset for requirements 1 through 4 and a summary set for requirement 5 ---
  list(data=data, summary=summary)
}