features <- read.table("UCI HAR Dataset/features.txt")
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
## Read test data
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/Y_test.txt")
##combines test data
test_data <-cbind(subject_test,y_test,x_test)
##reads train data
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/Y_train.txt")
train_data <-cbind(subject_train,y_train,x_train)
combined_data <- rbind(train_data,test_data)
##sets column names
feature_labels<-features[[2]]
feature_labels<-as.vector(feature_labels)
combined_labels<- c("subject","activity",feature_labels)
colnames(combined_data)<-combined_labels
##remove unnecessary variables
mean_index <- grep("-mean()",colnames(combined_data))
mean_freq <- grep("meanFreq",colnames(combined_data))
mean_index <- mean_index[! mean_index %in% mean_freq]
std_index <- grep("-std()",colnames(combined_data))
tidy_index <- c(1,2,mean_index, std_index)
tidy_index <- sort(tidy_index)
tidy_data <- combined_data[tidy_index]
## Creates clean dataset of means
summary_data<-tidy_data[1,]
subjects <- unlist(tidy_data[1])
counter <- 1
for (i in 1:30){
        sub_index <- which(subjects %in% i)
        sub_iso <- tidy_data[sub_index,]
        for(j in 1:6){
                acts <- unlist(sub_iso[2])
                act_index <- which(acts %in% j)
                sub_acts <- sub_iso[act_index,]
                mean_data <- colMeans(sub_acts)
                summary_data <- rbind(summary_data, mean_data)
                counter <- counter +1
                }
}
summary_data <- summary_data[-1,]
##labels activities
activities <- unlist(summary_data[2])
activity_labels_vec <- c(as.character(unlist(activity_labels[2])))
activity_names <- character(0)
for (i in 1:6){
        activity_index <- c(which(activities %in% i))
        activity_names[activity_index] <- activity_labels_vec[i]
}
summary_data <- cbind(summary_data[,1:2,drop=F], activity_names, summary_data[,3:length(summary_data),drop=F])

summary_data