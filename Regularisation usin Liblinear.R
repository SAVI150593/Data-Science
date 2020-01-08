Training <- read.csv("D:/Fall 2019/Data Mining/Assignment 3/IMB 623 VMWare- Digital Buyer Journey/Training.csv")
traindata<-Training[,-1]
traindata$target<-as.factor(traindata$target)
attach(traindata)

s = traindata[,-1]
yTrain = traindata$target

# Find the best model
library(LiblineaR)
tryTypes <- c(0,6,7)
bestAcc <- 0
bestType <- NA


acclog <- LiblineaR(data=s, target=yTrain, type=0, cost=1000, verbose=FALSE)
accL1 <- LiblineaR(data=s, target=yTrain, type=7, cost=1000, verbose=FALSE)
accL2 <- LiblineaR(data=s, target=yTrain, type=6, cost=1000, verbose=FALSE)

acclog
accL1
accL2

bestAcc <- accL1
bestType <- 7


cat("Best model type is:",bestType,"\n")
cat("Best accuracy is:",bestAcc,"\n")

# Re-train best model with best cost value.
m <- LiblineaR(data=s,target=yTrain,type=bestType,cost=bestCost)


# Make prediction
p <- predict(m,s2)
p

# Display confusion matrix
res <- table(p$predictions,yTest)
print(res)