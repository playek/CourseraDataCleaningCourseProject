cleanToTidy<-function ( dataPath="." )
{
  library(data.table)
  # read the test data from csv files
  test_d <- read.table(paste(dataPath, "/test/X_test.txt",sep = ""),header=FALSE)
  test_d_act <- read.table(paste(dataPath, "/test/y_test.txt",sep = ""),header=FALSE)
  test_d_sub <- read.table(paste(dataPath, "/test/subject_test.txt",sep = ""),header=FALSE)
  
  # read the training data from csv files
  train_d <- read.table(paste(dataPath, "/train/X_train.txt",sep = ""),header=FALSE)
  train_d_act <- read.table(paste(dataPath, "/train/y_train.txt",sep = ""),header=FALSE)
  train_d_sub <- read.table(paste(dataPath, "/train/subject_train.txt",sep = ""),header=FALSE)
  
  # read the activity lebel and uses descriptive activity names to name the activities in the data set
  activities <- read.table(paste(dataPath, "/activity_labels.txt",sep = ""),header=FALSE,colClasses="character")
  test_d_act$V1 <- factor(test_d_act$V1,levels=activities$V1,labels=activities$V2)
  train_d_act$V1 <- factor(train_d_act$V1,levels=activities$V1,labels=activities$V2)
  
  # read the feature lebel 
  features <- read.table(paste(dataPath, "/features.txt",sep = ""),header=FALSE,colClasses="character")
  
  #  labels  the test data set with descriptive  names
  colnames(test_d)<-features$V2
  colnames(test_d_act)<-c("Activity")
  colnames(test_d_sub)<-c("Subject")
  
  # merge  data , activity and subject sets of test data into one data set ( column wise)
  test_d<-cbind(test_d,test_d_act)
  test_d<-cbind(test_d,test_d_sub)
  
  #Lebel the training data set with descriptive  names
  colnames(train_d)<-features$V2
  colnames(train_d_act)<-c("Activity")
  colnames(train_d_sub)<-c("Subject")
  
  # merge  data , activity and subject sets of training data into one data set ( column wise)
  train_d<-cbind(train_d,train_d_act)
  train_d<-cbind(train_d,train_d_sub)
  
  # merge test and training sets into one data set
  full_d<-rbind(test_d,train_d)
  
  # Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  datatable <- data.table(full_d)
  tidy<-datatable[,lapply(.SD,mean),by="Activity,Subject"]
  write.table(tidy,file=paste(dataPath, "/tidy.csv",sep = ""),sep=",",row.names = FALSE)
}

datapath="UCI HAR Dataset"
cleanToTidy(datapath)