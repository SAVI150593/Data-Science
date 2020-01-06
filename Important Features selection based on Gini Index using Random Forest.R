Training <- read.csv("D:/Fall 2019/Data Mining/Assignment 3/IMB 623 VMWare- Digital Buyer Journey/Training.csv")
traindata<-Training[,-1]
traindata$target<-as.factor(traindata$target)
attach(traindata)

#Finding the top 100 important features using gini index score
library(randomForest)
library(ranger)
set.seed(1254)
rf <- ranger(target ~ ., data = traindata, num.trees = 300, write.forest = TRUE, importance = "impurity")

varimpmat <- data.frame(names(traindata[,-1]),rf$variable.importance)
colnames(varimpmat)<-c("Variable","GiniIndex")

finalnumvar <- varimpmat[order(-varimpmat$GiniIndex),][1:100,]

finalnumdata <- traindata[,unlist(finalnumvar$Variable)]