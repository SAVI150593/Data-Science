Training <- read.csv("D:/Fall 2019/Data Mining/Assignment 3/IMB 623 VMWare- Digital Buyer Journey/Training.csv")
traindata<-Training[,-1]
traindata$target<-as.factor(traindata$target)
attach(traindata)

#Finding the ranking of the features based on the importance using Boruta
library(Boruta)
set.seed(1254)
Output <- Boruta(target ~ ., data = traindata, doTrace=2, maxRuns=300)
Output