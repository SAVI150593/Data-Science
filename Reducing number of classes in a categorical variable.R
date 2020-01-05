Training <- read.csv("D:/Fall 2019/Data Mining/Assignment 3/IMB 623 VMWare- Digital Buyer Journey/Training.csv")
traindata<-Training[,-1]
library(randomForest)
traindata$target<-as.factor(traindata$target)
attach(traindata)

#Separating categorical features
col_list1 <- unlist(lapply(traindata, is.factor))
cat_data <- tdata[ , col_list1]

cat_data1 <- matrix(0, nrow = nrow(cat_data), ncol = ncol(cat_data))

for(j in 1:(ncol(cat_data)-1))
{
  value <- data.frame(sort(table(cat_data[,j]),decreasing=TRUE))$Var1[1:30]
  for( i in 1:nrow(cat_data))
  {
    cat_data1[i,j] <- if(is.na(match(cat_data[i,j],value))){'Other'} else {as.character(cat_data[i,j])}
  }
}
colnames(cat_data1) <- colnames(cat_data)

cat_data1 <- data.frame(cat_data1[,1:6])

