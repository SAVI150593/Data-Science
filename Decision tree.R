German.Credit <- read.csv("C:/Users/91965/Desktop/German Credit.csv")
attach(German.Credit)
str(German.Credit)
German.Credit$RESPONSE <- as.factor(German.Credit$RESPONSE)
summary(German.Credit)

Data<- German.Credit
set.seed(1254)
aa <- sample(2, nrow(Data),replace = T, prob=c(0.7,0.3))
traindata <- Data[aa==1,]
testdata <- Data[aa==2,]
library(rpart)
rtree <- rpart(RESPONSE~.,traindata,parms=list(split='gini'))

plot(rtree)
text(rtree,use.n=T,xpd=T, pretty=T)
train70 <- predict(rtree,traindata,type="class")
test30 <- predict(rtree,testdata,type="class")
printcp(rtree)

confustionmatrix = table(test30,testdata$RESPONSE)
confustionmatrix
accuracy <- sum(diag(confustionmatrix))/sum(confustionmatrix)
accuracy
Recall <- confustionmatrix[1,1] / (confustionmatrix[1,1] + confustionmatrix[2,1])
Recall

opt = which.min(rtree$cptable[,"xerror"])
cp = rtree$cptable[opt, "CP"]
tree_prune = prune(rtree, cp = cp)
install.packages("rpart.plot")
library(rpart.plot)
rpart.plot(tree_prune)

train70_best <- predict(tree_prune,traindata,type="class")
test30_best <- predict(tree_prune,testdata,type="class")