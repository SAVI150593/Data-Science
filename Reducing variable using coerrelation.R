Training <- read.csv("D:/Fall 2019/Data Mining/Assignment 3/IMB 623 VMWare- Digital Buyer Journey/Training.csv")
traindata<-Training[,-1]
library(randomForest)
traindata$target<-as.factor(traindata$target)
attach(traindata)

#Separating numerical features
col_list <- unlist(lapply(traindata, is.numeric))
num_data <- traindata[ , col_list]

library(caret)
#Checking pair-wise correlation and keeping only one out of highly correlated pairs with 90% cutoff.
correlationmat = cor(num_data[,1:ncol(num_data)])
highlycorrelatedmat = unlist(findCorrelation(correlationmat,cutoff = 0.9))
vecind = c()
for (i in 1:length(highlycorrelatedmat)){
  vecind = c(vecind,i)
}
num_data_new = num_data[,-vecind]

