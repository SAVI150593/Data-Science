Training <- read.csv("D:/Fall 2019/Data Mining/Assignment 3/IMB 623 VMWare- Digital Buyer Journey/Training.csv")
traindata<-Training[,-1]
traindata$target<-as.factor(traindata$target)
attach(traindata)

library(randomForest)
rf_model <- randomForest(target~.,traindata,mtry=sqrt(ncol(samp)-1),ntree=100, 
                         replace= T, importance = T,na.action = na.omit)
