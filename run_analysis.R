cleanToTidy<-function ( dataPath="." )
{
  library(data.table)
 
  # read the activity lebel and uses descriptive activity names to name the activities in the data set
  activities <- read.table(paste(dataPath, "/activity_labels.txt",sep = ""),header=FALSE, colClasses="character")
  
  # read the feature lebel 
  features <- read.table(paste(dataPath, "/features.txt",sep = ""),header=FALSE,colClasses="character")
  
  
  # read the test data from csv files
  test_d <- read.table(paste(dataPath, "/test/X_test.txt",sep = ""),header=FALSE)
  test_d_act <- read.table(paste(dataPath, "/test/y_test.txt",sep = ""),header=FALSE, col.names=c("Activity_id"))
  test_d_sub <- read.table(paste(dataPath, "/test/subject_test.txt",sep = ""),header=FALSE, col.names=c("Subject"))
  
  #generate labelled activity data set 
  Activity <- factor(test_d_act[,1],levels=activities[,1],labels=activities[,2])
  
  #merge the together columnwise
  test_data <- cbind(Activity,cbind(test_d_sub, test_d,deparse.level = 0),deparse.level = 0)
  
  # read the training data from csv files
  train_d <- read.table(paste(dataPath, "/train/X_train.txt",sep = ""),header=FALSE)
  train_d_act <- read.table(paste(dataPath, "/train/y_train.txt",sep = ""),header=FALSE, col.names=c("Activity_id") )
  train_d_sub <- read.table(paste(dataPath, "/train/subject_train.txt",sep = ""),header=FALSE, col.names=c("Subject"))
  
  #generate labelled activity data set 
  Activity <- factor(train_d_act[,1],levels=activities[,1],labels=activities[,2])
  
  #merge the together columnwise
  train_data <- cbind(Activity, cbind(train_d_sub, train_d,deparse.level = 0),deparse.level = 0)
  
  # merge test and training sets into one data set, row append
  full_data<-rbind(test_data,train_data)
  colnames(full_data) <- c( c( "Activity", "Subject"), features[,2])
  
  #calculate mean and SD for each variable
  full_mean<-sapply(full_data,mean,na.rm=TRUE)
  print(full_mean)
  
  full_sd<-sapply(full_data,sd,na.rm=TRUE)
  print(full_sd)
  
  
  # Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  datatable <- data.table(full_data)
  tidy<-datatable[,lapply(.SD,mean),by="Activity,Subject"]
  write.table(tidy,file=paste(dataPath, "/tidy.csv",sep = ""),sep=",",row.names = FALSE)
}

#setwd("E:\\documents\\Coursera\\Data Science\\data_cleaning\\assignments\\CourseProject")
datapath="UCI HAR Dataset"
cleanToTidy(datapath)