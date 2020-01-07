Training <- read.csv("D:/Fall 2019/Data Mining/Assignment 3/IMB 623 VMWare- Digital Buyer Journey/Training.csv")
traindata<-Training[,-1]
traindata$target<-as.factor(traindata$target)
attach(traindata)

col_list <- unlist(lapply(traindata, is.numeric))
num_data <- traindata[ , col_list]

#Data Normalization
new_num_data <- data.frame(scale(num_data,center=TRUE,scale=TRUE))
target <- as.factor(Training$target)

#Combining numerical and categorical variables
finaldata <- data.frame(cbind(target,new_num_data))

#Treating the target imbalance by having equal distribution for all classes
library(UBL)
table(finaldata$target)
samp <- SmoteClassif(target~., finaldata, C.perc = "balance", k = 5, repl = FALSE,dist = "HEOM", p = 2)
table(samp$target) 
samp$target <- as.factor(samp$target)