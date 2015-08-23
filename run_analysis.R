convert <- function(number){
    if(number == 1 ){return("WALKING")}
    if(number == 2 ){return("WALKING_UPSTAIRS")}
    if(number == 3 ){return("wALKING_DOWNSTAIRS")}
    if(number == 4 ){return("SITTING")}
    if(number == 5 ){return("STANDING")}
    if(number == 6 ){return("LAYING")}
}

run_analysis <- function() {
## Created Date:  8/17/2015
## Created by:    Jeff Lennerth
## Purpose:       1. Combine test and Train data.
library(plyr)


## I just pulled the data and put in in my working directory.  I suppose I could have done a 
## download and then unzip.  But the instructions don't call for it, so I start by loading locally
## and first create x and y training
ytr <- read.table("C:\\Users\\Jeff\\Documents\\UCI HAR Dataset\\train\\y_train.txt")
ytr <- rename(ytr,c("V1"= "ActivityNum"))
xtr <- read.table("C:\\Users\\Jeff\\Documents\\UCI HAR Dataset\\train\\X_train.txt")

## and then create the subject col training
subtr <- read.table("C:\\Users\\Jeff\\Documents\\UCI HAR Dataset\\train\\subject_train.txt")
subtr <- rename(subtr,c("V1"= "SubjectNum"))

## Read in test x and y.
yte <- read.table("C:\\Users\\Jeff\\Documents\\UCI HAR Dataset\\test\\y_test.txt")
yte <- rename(yte,c("V1"= "ActivityNum"))
xte <- read.table("C:\\Users\\Jeff\\Documents\\UCI HAR Dataset\\test\\X_test.txt")

##Get the test data subjects
subte <- read.table("C:\\Users\\Jeff\\Documents\\UCI HAR Dataset\\test\\subject_test.txt")
subte <- rename(subte,c("V1"= "SubjectNum"))

## now combine all the data into one data frame.
## keep subjects separate for now
## A good coder would read in the features.txt file
dataset <- rbind(xtr,xte)
datasub <- rbind(subtr,subte)
dataact <- rbind(ytr,yte)

##This will combine subjects back in
test <- cbind(datasub,dataset)

##Add the nicely formatted Activities from values in V1
##lastly we have nice values for the Activities.  Let's use those.
dataact$Activity <- do.call(rbind, lapply(dataact$ActivityNum, convert))

##Column bind dataact with test
test <- cbind(dataact,test)

## now just pull the variables we want
myVars <- c("Activity", "SubjectNum","V1","V2","V3","V4","V5","V6","V41","V42","V43","V44","V45","V46","V81","V82","V83","V84","V85","V86",
              "V121","V122","V123","V124","V125","V126","V161","V162","V163","V164","V165","V166","V201","V202",
              "V214","V215","V227","V228","V240","V241","V253","V254","V266","V267","V268","V269","V270","V271","V294","V295","V296","V345",
              "V346","V347","V348","V349","V350","V373","V374","V375","V424","V425","V426","V427","V428","V429","V452","V453","V454",
              "V503","V504","V513","V516","V517","V526","V529","V530","V539","V542","V543","V552","V555","V556","V557","V558","V559","V560","V561")    
newdata <- test[myVars]



##now cleanup  names.  PUlling names from the features.txt and changing t to time and f t
newdata <- rename(newdata,c("V1"= "timeBodyAccmeanX"))
newdata <- rename(newdata,c("V2"= "timeBodyAccmeanY"))
newdata <- rename(newdata,c("V3"= "timeBodyAccmeanZ"))
newdata <- rename(newdata,c("V4"= "timeBodyAccstdX"))
newdata <- rename(newdata,c("V5"= "timeBodyAccstdY"))
newdata <- rename(newdata,c("V6"= "timeBodyAccstdZ"))
newdata <- rename(newdata,c("V41"= "timeGravityAccmeanX"))
newdata <- rename(newdata,c("V42"= "timeGravityAccmeanY"))
newdata <- rename(newdata,c("V43"= "timeGravityAccmeanZ"))
newdata <- rename(newdata,c("V44"= "timeGravityAccstdX"))
newdata <- rename(newdata,c("V45"= "timeGravityAccstdY"))
newdata <- rename(newdata,c("V46"= "timeGravityAccstdZ"))
newdata <- rename(newdata,c("V81"= "timeBodyAccJerkmeanX"))
newdata <- rename(newdata,c("V82"= "timeBodyAccJerkmeanY"))
newdata <- rename(newdata,c("V83"= "timeBodyAccJerkmeanZ"))
newdata <- rename(newdata,c("V84"= "timeBodyAccJerkstdX"))
newdata <- rename(newdata,c("V85"= "timeBodyAccJerkstdY"))
newdata <- rename(newdata,c("V86"= "timeBodyAccJerkstdZ"))
newdata <- rename(newdata,c("V121"= "timeBodyGyromeanX"))
newdata <- rename(newdata,c("V122"= "timeBodyGyromeanY"))
newdata <- rename(newdata,c("V123"= "timeBodyGyromeanZ"))
newdata <- rename(newdata,c("V124"= "timeBodyGyrostdX"))
newdata <- rename(newdata,c("V125"= "timeBodyGyrostdY"))
newdata <- rename(newdata,c("V126"= "timeBodyGyrostdZ"))
newdata <- rename(newdata,c("V161"= "timeBodyGyroJerkmeanX"))
newdata <- rename(newdata,c("V162"= "timeBodyGyroJerkmeanY"))
newdata <- rename(newdata,c("V163"= "timeBodyGyroJerkmeanZ"))
newdata <- rename(newdata,c("V164"= "timeBodyGyroJerkstdX"))
newdata <- rename(newdata,c("V165"= "timeBodyGyroJerkstdY"))
newdata <- rename(newdata,c("V166"= "timeBodyGyroJerkstdZ"))
newdata <- rename(newdata,c("V201"= "timeBodyAccMagmean"))
newdata <- rename(newdata,c("V202"= "timeBodyAccMagstd"))
newdata <- rename(newdata,c("V214"= "timeGravityAccMagmean"))
newdata <- rename(newdata,c("V215"= "timeGravityAccMagstd"))
newdata <- rename(newdata,c("V227"= "timeBodyAccJerkMagmean"))
newdata <- rename(newdata,c("V228"= "timeBodyAccJerkMagstd"))
newdata <- rename(newdata,c("V240"= "timeBodyGyroMagmean"))
newdata <- rename(newdata,c("V241"= "timeBodyGyroMagstd"))
newdata <- rename(newdata,c("V253"= "timeBodyGyroJerkMagmean"))
newdata <- rename(newdata,c("V254"= "timeBodyGyroJerkMagstd"))
newdata <- rename(newdata,c("V266"= "frequencyBodyAccmeanX"))
newdata <- rename(newdata,c("V267"= "frequencyBodyAccmeanY"))
newdata <- rename(newdata,c("V268"= "frequencyBodyAccmeanZ"))
newdata <- rename(newdata,c("V269"= "frequencyBodyAccstdX"))
newdata <- rename(newdata,c("V270"= "frequencyBodyAccstdY"))
newdata <- rename(newdata,c("V271"= "frequencyBodyAccstdZ"))
newdata <- rename(newdata,c("V294"= "frequencyBodyAccmeanFreqX"))
newdata <- rename(newdata,c("V295"= "frequencyBodyAccmeanFreqY"))
newdata <- rename(newdata,c("V296"= "frequencyBodyAccmeanFreqZ"))
newdata <- rename(newdata,c("V345"= "frequencyBodyAccJerkmeanX"))
newdata <- rename(newdata,c("V346"= "frequencyBodyAccJerkmeanY"))
newdata <- rename(newdata,c("V347"= "frequencyBodyAccJerkmeanZ"))
newdata <- rename(newdata,c("V348"= "frequencyBodyAccJerkstdX"))
newdata <- rename(newdata,c("V349"= "frequencyBodyAccJerkstdY"))
newdata <- rename(newdata,c("V350"= "frequencyBodyAccJerkstdZ"))
newdata <- rename(newdata,c("V373"= "frequencyBodyAccJerkmeanFreqX"))
newdata <- rename(newdata,c("V374"= "frequencyBodyAccJerkmeanFreqY"))
newdata <- rename(newdata,c("V375"= "frequencyBodyAccJerkmeanFreqZ"))
newdata <- rename(newdata,c("V424"= "frequencyBodyGyromeanX"))
newdata <- rename(newdata,c("V425"= "frequencyBodyGyromeanY"))
newdata <- rename(newdata,c("V426"= "frequencyBodyGyromeanZ"))
newdata <- rename(newdata,c("V427"= "frequencyBodyGyrostdX"))
newdata <- rename(newdata,c("V428"= "frequencyBodyGyrostdY"))
newdata <- rename(newdata,c("V429"= "frequencyBodyGyrostdZ"))
newdata <- rename(newdata,c("V452"= "frequencyBodyGyromeanFreqX"))
newdata <- rename(newdata,c("V453"= "frequencyBodyGyromeanFreqY"))
newdata <- rename(newdata,c("V454"= "frequencyBodyGyromeanFreqZ"))
newdata <- rename(newdata,c("V503"= "frequencyBodyAccMagmean"))
newdata <- rename(newdata,c("V504"= "frequencyBodyAccMagstd"))
newdata <- rename(newdata,c("V513"= "frequencyBodyAccMagmeanFreq"))
newdata <- rename(newdata,c("V516"= "frequencyBodyBodyAccJerkMagmean"))   
newdata <- rename(newdata,c("V517"= "frequencyBodyBodyAccJerkMagstd"))
newdata <- rename(newdata,c("V526"= "frequencyBodyBodyAccJerkMagmeanFreq"))
newdata <- rename(newdata,c("V529"= "frequencyBodyBodyGyroMagmean"))
newdata <- rename(newdata,c("V530"= "frequencyBodyBodyGyroMagstd"))
newdata <- rename(newdata,c("V539"= "frequencyBodyBodyGyroMagmeanFreq"))
newdata <- rename(newdata,c("V542"= "frequencyBodyBodyGyroJerkMagmean"))
newdata <- rename(newdata,c("V543"= "frequencyBodyBodyGyroJerkMagstd"))
newdata <- rename(newdata,c("V552"= "frequencyBodyBodyGyroJerkMagmeanFreq"))
newdata <- rename(newdata,c("V555"= "AngletimeBodyAccMeangravity"))
newdata <- rename(newdata,c("V556"= "AngletimeBodyAccJerkMeangravityMean"))
newdata <- rename(newdata,c("V557"= "AngletimeBodyGyroMeangravityMean"))
newdata <- rename(newdata,c("V558"= "angletimeBodyGyroJerkMeangravityMean"))
newdata <- rename(newdata,c("V559"= "angleXgravityMean"))
newdata <- rename(newdata,c("V560"= "angleYgravityMean"))
newdata <- rename(newdata,c("V561"= "angleZgravityMean"))

##so now we want the average of the variables (columns) for each subject for each activity
## that is our data.  Grab some summary data to add to the code book.
##newdata(rowmeans(newdata))
##DT[, Mean:=mean(X), by=list(Y, Z)]


library(plyr)

newdata.mean <- ddply(newdata, c("SubjectNum","Activity"), summarize, 
                     meantimeBodyAccmeanX = mean(timeBodyAccmeanX),
                     meantimeBodyAccmeanY = mean(timeBodyAccmeanY),
                     meantimeBodyAccmeanZ = mean(timeBodyAccmeanZ),
                     meantimeBodyAccstdX = mean(timeBodyAccstdX),
                     meantimeBodyAccstdY = mean(timeBodyAccstdY),
                     meantimeBodyAccstdZ = mean(timeBodyAccstdZ),
                     meantimeGravityAccmeanX = mean(timeGravityAccmeanX),
                     meantimeGravityAccmeanY = mean(timeGravityAccmeanY),
                     meantimeGravityAccmeanZ = mean(timeGravityAccmeanZ),
                     meantimeGravityAccstdX = mean(timeGravityAccstdX),
                     meantimeGravityAccstdY = mean(timeGravityAccstdY),
                     meantimeGravityAccstdZ = mean(timeGravityAccstdZ),
                     meantimeBodyAccJerkmeanX = mean(timeBodyAccJerkmeanX),
                     meantimeBodyAccJerkmeanY = mean(timeBodyAccJerkmeanY),
                     meantimeBodyAccJerkmeanZ = mean(timeBodyAccJerkmeanZ),
                     meantimeBodyAccJerkstdX = mean(timeBodyAccJerkstdX),
                     meantimeBodyAccJerkstdY = mean(timeBodyAccJerkstdY),
                     meantimeBodyAccJerkstdZ = mean(timeBodyAccJerkstdZ),
                     meantimeBodyGyromeanX = mean(timeBodyGyromeanX),
                     meantimeBodyGyromeanY = mean(timeBodyGyromeanY),
                     meantimeBodyGyromeanZ = mean(timeBodyGyromeanZ),
                     meantimeBodyGyrostdX = mean(timeBodyGyrostdX),
                     meantimeBodyGyrostdY = mean(timeBodyGyrostdY),
                     meantimeBodyGyrostdZ = mean(timeBodyGyrostdZ),
                     meantimeBodyGyroJerkmeanX = mean(timeBodyGyroJerkmeanX),
                     meantimeBodyGyroJerkmeanY = mean(timeBodyGyroJerkmeanY),
                     meantimeBodyGyroJerkmeanZ = mean(timeBodyGyroJerkmeanZ),
                     meantimeBodyGyroJerkstdX = mean(timeBodyGyroJerkstdX),
                     meantimeBodyGyroJerkstdY = mean(timeBodyGyroJerkstdY),
                     meantimeBodyGyroJerkstdZ = mean(timeBodyGyroJerkstdZ),
                     meantimeBodyAccMagmean = mean(timeBodyAccMagmean),
                     meantimeBodyAccMagstd = mean(timeBodyAccMagstd),
                     meantimeGravityAccMagmean = mean(timeGravityAccMagmean),
                     meantimeGravityAccMagstd = mean(timeGravityAccMagstd),
                     meantimeBodyAccJerkMagmean = mean(timeBodyAccJerkMagmean),
                     meantimeBodyAccJerkMagstd = mean(timeBodyAccJerkMagstd),
                     meantimeBodyGyroMagmean = mean(timeBodyGyroMagmean),
                     meantimeBodyGyroMagstd = mean(timeBodyGyroMagstd),
                     meantimeBodyGyroJerkMagmean = mean(timeBodyGyroJerkMagmean),
                     meantimeBodyGyroJerkMagstd = mean(timeBodyGyroJerkMagstd),
                     meanfrequencyBodyAccmeanX = mean(frequencyBodyAccmeanX),
                     meanfrequencyBodyAccmeanY = mean(frequencyBodyAccmeanY),
                     meanfrequencyBodyAccmeanZ = mean(frequencyBodyAccmeanZ),
                     meanfrequencyBodyAccstdX = mean(frequencyBodyAccstdX),
                     meanfrequencyBodyAccstdY = mean(frequencyBodyAccstdY),
                     meanfrequencyBodyAccstdZ = mean(frequencyBodyAccstdZ),
                     meanfrequencyBodyAccJerkmeanX = mean(frequencyBodyAccJerkstdX),
                     meanfrequencyBodyAccJerkmeanY = mean(frequencyBodyAccJerkstdY),
                     meanfrequencyBodyAccJerkmeanZ = mean(frequencyBodyAccJerkstdZ),
                     meanfrequencyBodyAccJerkstdX = mean(frequencyBodyAccJerkstdX),
                     meanfrequencyBodyAccJerkstdY = mean(frequencyBodyAccJerkstdY),
                     meanfrequencyBodyAccJerkstdZ = mean(frequencyBodyAccJerkstdZ),
                     meanfrequencyBodyAccJerkmeanFreqX = mean(frequencyBodyAccJerkmeanFreqX),
                     meanfrequencyBodyAccJerkmeanFreqY = mean(frequencyBodyAccJerkmeanFreqY),
                     meanfrequencyBodyAccJerkmeanFreqZ = mean(frequencyBodyAccJerkmeanFreqZ),
                     meanfrequencyBodyGyromeanX = mean(frequencyBodyGyromeanX),
                     meanfrequencyBodyGyromeanY = mean(frequencyBodyGyromeanY),
                     meanfrequencyBodyGyromeanZ = mean(frequencyBodyGyromeanZ),
                     meanfrequencyBodyGyrostdX = mean(frequencyBodyGyrostdX),
                     meanfrequencyBodyGyrostdY = mean(frequencyBodyGyrostdY),
                     meanfrequencyBodyGyrostdZ = mean(frequencyBodyGyrostdZ),
                     meanfrequencyBodyAccMagmean = mean(frequencyBodyAccMagmean),
                     meanfrequencyBodyAccMagstd = mean(frequencyBodyAccMagstd),
                     meanfrequencyBodyGyrostdZ = mean(frequencyBodyGyrostdZ),
                     meanfrequencyBodyGyrostdZ = mean(frequencyBodyGyrostdZ),
                     meanfrequencyBodyAccMagmeanFreq = mean(frequencyBodyAccMagmeanFreq),
                     meanfrequencyBodyBodyAccJerkMagmean = mean(frequencyBodyBodyAccJerkMagmean),
                     meanfrequencyBodyBodyAccJerkMagstd = mean(frequencyBodyBodyAccJerkMagstd),
                     meanfrequencyBodyBodyAccJerkMagmeanFreq = mean(frequencyBodyBodyAccJerkMagmeanFreq),
                     meanfrequencyBodyBodyGyroMagmean = mean(frequencyBodyBodyGyroMagmean),
                     meanfrequencyBodyBodyGyroMagstd = mean(frequencyBodyBodyGyroMagstd),
                     meanfrequencyBodyBodyGyroMagmeanFreq = mean(frequencyBodyBodyGyroMagmeanFreq),
                     meanfrequencyBodyBodyGyroJerkMagmean = mean(frequencyBodyBodyGyroJerkMagmean),
                     meanfrequencyBodyBodyGyroJerkMagstd = mean(frequencyBodyBodyGyroJerkMagstd),
                     meanfrequencyBodyBodyGyroJerkMagmeanFreq = mean(frequencyBodyBodyGyroJerkMagmeanFreq),
                     meanAngletimeBodyAccMeangravity = mean(AngletimeBodyAccMeangravity),
                     meanAngletimeBodyAccJerkMeangravityMean = mean(AngletimeBodyAccJerkMeangravityMean),
                     meanAngletimeBodyGyroMeangravityMean = mean(AngletimeBodyGyroMeangravityMean),
                     meanangletimeBodyGyroJerkMeangravityMean = mean(angletimeBodyGyroJerkMeangravityMean),
                     meanangleXgravityMean = mean(angleXgravityMean),
                     meanangleYgravityMean = mean(angleYgravityMean),
                     meanangleZgravityMean = mean(frequencyBodyGyrostdZ),
                     meanfrequencyBodyGyrostdZ = mean(angleZgravityMean)
)

##library(data.table)

##DT <- data.table(newdata)

##finDT <- DT[, MeantimeBodyAccmeanX:=mean(timeBodyAccmeanX), 
##              MeantimeBodyAccmeanY:=mean(timeBodAccmeanY),                
##                    by=list(SubjectNum, Activity)]

##write.table(lastdata,file = "C:\\Users\\Jeff\\Documents\\getandcleanproject.txt",row.nameS = FALSE)


write.table(newdata.mean,file = "C:\\Users\\Jeff\\Documents\\getandcleanproject.txt",row.names = FALSE)

head(newdata.mean)

}




