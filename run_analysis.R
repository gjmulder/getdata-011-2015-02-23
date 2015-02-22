
require(dplyr)

# Load activities and data
activityLabels  <- read.table("./activity_labels.txt")
activityFactors <- factor(activityLabels[,2])

num2Fact <- function(num)
  activityFactors[num]

testActivities  <- read.table("./test/y_test.txt")
testData        <- read.table("./test/X_test.txt")
testSubject     <- read.table("./test/subject_test.txt")
testAll         <- cbind(testData, testSubject, lapply(testActivities, num2Fact))
 
trainData       <- read.table("./train/X_train.txt")
trainActivities <- read.table("./train/y_train.txt")
trainSubject    <- read.table("./train/subject_train.txt")
trainAll        <- cbind(trainData, trainSubject, lapply(trainActivities, num2Fact))

allData         <- rbind(trainAll, testAll)
 
# Column feature names, including subject and activity
featureIdNames    <- read.table("./features.txt", stringsAsFactors = F)
featureNames      <- paste0(featureIdNames[,1],
                            "_",
                            gsub('\\(|\\)|\\-|\\,', '', featureIdNames[,2]))
colnames(allData) <- featureNames
colnames(allData)[562:563] = c("subject", "activity")

# Find -mean and -std columns
meanCols <- grep("-mean", featureNames)
stdCols <- grep("-std", featureNames)
meansAndStds <- allData[c(meanCols, stdCols)]

# Group by subject and activity and generate means on all 561 non-grouped variables 
byActSubj        <- group_by(allData, activity, subject)
summaryBySubjAct <- summarise_each(byActSubj, funs(mean), 1:561)
write.table(summaryBySubjAct, "summary.txt", row.name=F)