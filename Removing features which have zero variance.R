Training <- read.csv("D:/Fall 2019/Data Mining/Assignment 3/IMB 623 VMWare- Digital Buyer Journey/Training.csv")
traindata<-Training[,-1]
traindata$target<-as.factor(traindata$target)
attach(traindata)

#Removing features that have zero variance (constant values)
zerovariancepredlist = apply(traindata, 2, function(traindata) length(unique(traindata))== 1 )
tdata = traindata[,!zerovariancepredlist]