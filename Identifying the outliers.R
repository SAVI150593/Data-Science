German.Credit <- read.csv("C:/Users/91965/Desktop/German Credit.csv")
attach(German.Credit)
str(German.Credit)
German.Credit$RESPONSE <- as.factor(German.Credit$RESPONSE)
summary(German.Credit)

#Designing box plots to see outliers for Numeric Variables

boxplot(German.Credit$AGE)
summary(German.Credit$AGE)

boxplot(German.Credit$DURATION)
summary(German.Credit$DURATION)

boxplot(German.Credit$NUM_CREDITS)
summary(German.Credit$NUM_CREDITS)

boxplot(German.Credit$AMOUNT)
summary(German.Credit$AMOUNT)

boxplot(German.Credit$INSTALL_RATE)
summary(German.Credit$INSTALL_RATE)

boxplot(German.Credit$NUM_DEPENDENTS)
summary(German.Credit$NUM_DEPENDENTS)