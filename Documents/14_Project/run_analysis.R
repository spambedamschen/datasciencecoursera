    library(plyr)
    library(dplyr)
    library(reshape2)
    
    
    train <- data.frame()
    x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
    subject_train  <- read.table("./UCI HAR Dataset/train/subject_train.txt")
    y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
    
    train <- subject_train
    train <- cbind(train, y_train)
    train <- cbind(train, x_train)
    
    x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
    subject_test  <- read.table("./UCI HAR Dataset/test/subject_test.txt")
    y_test <- read.table("./UCI HAR Dataset/test/y_test.txt") 
    
    test <- subject_test
    test <- cbind(test, y_test)
    test <- cbind(test, x_test)
    
    data <- test
    data <- rbind(data, train)
    
    features <- read.table("./UCI HAR Dataset/features.txt")
    ListOfNames <- as.character(features[,2]) 
    
    names(data)<-c("Subjectname","yname", ListOfNames)
    
    stddata<-data[,grep('std',names(data))]
    meandata<-data[,grep('mean',names(data))]
    combineddata <- cbind(data$Subjectname, data$yname, stddata, meandata)
    
    cdata <- tbl_df(combineddata)
    
    activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
    vnames <- read.table("./UCI HAR Dataset/labelnames.txt", stringsAsFactors = F)
    variabelnames <- data.frame()
    
    id = 1:82
    for (i in id) {
      variabelnames <- rbind(variabelnames, as.character(vnames[,i]))
    }
    
    comdata <- merge(cdata, activity_labels, by.x = "data$yname", by.y = "V1")
    
    for (i in id) {
      colnames(comdata)[i] <- as.character(variabelnames[i,])
    }
    
    melted <- melt(comdata, id.vars=c("Subject_Name", "Activityname"))
    k <- arrange(melted, Subject_Name, Activityname)
    final <- ddply(k, c("Subject_Name", "Activityname", "variable"), summarise, mean(value))