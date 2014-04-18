CodeBook
========================================================

The variables used in "run_analysis.R" in be separated into three categories as follows :-

1) Path variables
   i]   wPath <- This contains the path to the folder "UCI HAR Dataset"
   ii]  lPath <- This contains the path to the file "activity_labels.txt"
   iii] fPath <- This contains the path to the file "features.txt"
   iv]  xPath <- This contains the path to the file "X_test.txt" or "X_train.txt" depending
                 upon the the value passed to it when the function is called.
   v]   yPath <- This contains the path to the file "Y_test.txt" or "Y_train.txt" depending
                 upon the the value passed to it when the function is called.
   vi]  sPath <- This contains the path to the file "subject_test.txt" or "subject_train.txt"
                 depending upon the the value passed to it when the function is called.

2) Data containing variables
   i]    lData <- This contains the data from the file "activity_labels.txt"
   ii]   fData <- This contains the data from the file "features.txt"
   iii]  xData <- This contains the data from the file "X_test.txt" or "X_train.txt" depending
                  upon the the value passed to it when the function is called.
   iv]   yData <- This contains the data from the file "Y_test.txt" or "Y_train.txt" depending
                  upon the the value passed to it when the function is called.
   v]    sData <- This contains the data from the file "subject_test.txt" or 
                  "subject_train.txt" depending upon the the value passed to it when the
                  function is called.
   vi]   Data <- This is the data created in the matrix, with proper activity and volunteer ID
                 labelling.
   vii]  teData <- This contains the test data with proper activity and volunteer ID
                   labelling.
   viii] trData <- This contains the training data with proper activity and volunteer ID
                   labelling.
   ix]   tData <- This contains the total data, i.e. combined data from training and test.
   x]    eData <- This contains only the mean and standard deviation values from the features.
   xi]   sepData <- This contains the data which is split on the basis of activity and the 
                    volunteer ID.
   xii]  rData <- This is the final dataset which is then written out as a text file (.txt).
   
3) Other variables.
   i]  delimiter <- This contains "\\" which is how the folders in path are separated in
                   Windows system
   ii] sCols <- This contains the column nos which have "mean" or "std" in their names.
                   

The process followed to clean up the data is :-
1)  Read the activity_labels.txt file to get the activity labels and save in lData.
2)  Read the features.txt file to get the values which are calculated and save in fData.
3)  Read the X_ , Y_ , subject_ files of test and training into teData and trData resp.
4)  Combine test and training observations into one data frame, called tData.
5)  Name the columns of tData using fData.
6)  Select those columns which give details of mean and std of the data from tData and create a
    new data frame called eData.
7)  Split eData on the basis of activity and volunteer ID, creating sepData
8)  Rejoin sepData using lapply such that the first 3 columns, containing volunteer ID and
    activity, are kept as they are, to create the required data, i.e. rData
9)  Order the rData according to the activity and the volunteer ID.
10) Write the rData into a .txt file.
