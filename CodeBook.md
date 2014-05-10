CodeBook
========================================================

The variables used in "run_analysis.R" in be separated into three categories as follows :-

- Path variables
  * wPath <- This contains the path to the folder "UCI HAR Dataset"
  * lPath <- This contains the path to the file "activity_labels.txt"
  * fPath <- This contains the path to the file "features.txt"
  * xPath <- This contains the path to the file "X_test.txt" or "X_train.txt" depending upon the the value passed to it when the function is called.
  * yPath <- This contains the path to the file "Y_test.txt" or "Y_train.txt" depending upon the the value passed to it when the function is called.
  * sPath <- This contains the path to the file "subject_test.txt" or "subject_train.txt" depending upon the the value passed to it when the function is called.

- Data containing variables
  * lData <- This contains the data from the file "activity_labels.txt"
  * fData <- This contains the data from the file "features.txt"
  * xData <- This contains the data from the file "X_test.txt" or "X_train.txt" depending upon the the value passed to it when the function is called.
  * yData <- This contains the data from the file "Y_test.txt" or "Y_train.txt" depending upon the the value passed to it when the function is called.
  * sData <- This contains the data from the file "subject_test.txt" or "subject_train.txt" depending upon the the value passed to it when the function is called.
  * Data <- This is the data created in the matrix, with proper activity and volunteer ID labelling.
  * teData <- This contains the test data with proper activity and volunteer ID labelling.
  * trData <- This contains the training data with proper activity and volunteer ID labelling.
  * tData <- This contains the total data, i.e. combined data from training and test.
  * eData <- This contains only the mean and standard deviation values from the features.
  * sepData <- This contains the data which is split on the basis of activity and the volunteer ID.
  * rData <- This is the final dataset which is then written out as a text file (.txt).
   
- Other variables.
   * delimiter <- This contains "\\" which is how the folders in path are separated in Windows system.
   * sCols <- This contains the column nos which have "mean" or "std" in their names.
                   

The process followed to clean up the data is :-
-  Read the activity_labels.txt file to get the activity labels and save in lData.
-  Read the features.txt file to get the values which are calculated and save in fData.
-  Read the X_ , Y_ , subject_ files of test and training into teData and trData resp.
-  Combine test and training observations into one data frame, called tData.
-  Name the columns of tData using fData.
-  Select those columns which give details of mean and std of the data from tData and create a new data frame called eData.
-  Split eData on the basis of activity and volunteer ID, creating sepData
-  Rejoin sepData using lapply such that the first 3 columns, containing volunteer ID and activity, are kept as they are, to create the required data, i.e. rData
-  Order the rData according to the activity and the volunteer ID.
- Write the rData into a .txt file.
