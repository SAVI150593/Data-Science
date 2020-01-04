Training <- read.csv("D:/Fall 2019/Data Mining/Assignment 3/IMB 623 VMWare- Digital Buyer Journey/Training.csv")
traindata<-Training[,-1]
traindata$target<-as.factor(traindata$target)
attach(traindata)

#Finding % of 9999 values in each variable
#Missing values are represented as 9999 in the data
data9999 <- cbind(names(traindata),
                  sapply(traindata,function (x)
                  { row1 = which(x==9999)
                  length(row1)/nrow(Training)
                  } ))
#Removing features with 70% or more 9999 values
col9999 <- which(data9999[,2]>0.7)
y<- traindata[,-col9999]

#Finding % of Unknown values in each variable
dataUnknown <- cbind(names(y),
                     sapply(y,function (x)
                     { row1 = which(x=='Unknown')
                     length(row1)/nrow(Training)
                     } ))
#Removing features with 70% or more Unknown values
colUnknown <- which(dataUnknown[,2]>0.7)
y<- y[,-colUnknown]

#Removing features with 70% or more NA values
x <- y[ lapply( y, function(x) sum(is.na(x)) / length(x) ) < 0.3 ]