
    x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
    subject_train  <- read.table("./UCI HAR Dataset/train/subject_train.txt")
    y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
    
    train <- x_train
    train <- cbind(train, subject_train)
    train <- cbind(train, y_train)
    
    x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
    subject_test  <- read.table("./UCI HAR Dataset/test/subject_test.txt")
    y_test <- read.table("./UCI HAR Dataset/test/y_test.txt") 
    
    test <- x_test
    test <- cbind(test, subject_test)
    test <- cbind(test, y_test)
    
    data <- train
    data <- rbind(data, test)
    
    features <- read.table("./UCI HAR Dataset/features.txt")
    ListOfNames <- as.character(features[,2]) 
    
    names(data)<-c(ListOfNames,"Subjectname","yname")
    
    Namen <- grep("Mean, std", features, ignore.case = T)