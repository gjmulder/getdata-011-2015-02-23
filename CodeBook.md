1. Data was obtained from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2. A description of this data is at: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
3. The "subject" and "activity" data was merged with the corresponding measurements for both the test and training data.
4. The test and training data was merged into one set.
5. Variable names were taken from the features.txt file provided in the above Zip file.
6. The Variable names were tidied by removing all of the special characters "()-,"
7. As some variable names are non-unique, the variable id was pre-pended to the variable name.
8. The data is then grouped by activity and subject and means are created across each sub-group.
9. The resulting tidied data is written to "summary.txt"
