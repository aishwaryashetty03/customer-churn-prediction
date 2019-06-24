customer_churn=read.csv("D://Machine Learning//customer_churn.csv")

customer_churn[customer_churn==""]<-NA
anyNA(customer_churn)

str(customer_churn)

customer_churn$Age<-as.factor(customer_churn$Age)
customer_churn$Account_Manager<-as.factor(customer_churn$Account_Manager)

cm<-customer_churn

library(caTools)
set.seed(101)
split<- sample.split(cm,SplitRatio = 0.7)
train_set<- subset(cm,split==TRUE)
valid_set<- subset(cm,split==FALSE)


model<-glm(Churn~. -Names -Total_Purchase-Age-Onboard_date-Location-Company,data=train_set,family = binomial)
summary(model)

predict<- predict(model,new_data=valid_set,type='response')
table(valid_set$Churn, predict > 0.5)
View(predict)

#library(InformationValue)
#optCutOff <- optimalCutoff(train_set$Churn, predict)[1]
#optCutOff
rm(crunch_test)
crunch_test<-read.csv("D://Machine Learning//customer_churn_test.csv")

str(crunch_test)

View(crunch_test)

crunch_test$Age<-as.factor(crunch_test$Age)
crunch_test$Account_Manager<-as.factor(crunch_test$Account_Manager)
View(crunch_test)
crunch_test$X<-NULL
crunch_test$Names<-NULL
crunch_test$Total_Purchase<-NULL
crunch_test$Age<-NULL
crunch_test$Onboard_date<-NULL
crunch_test$Location<-NULL
crunch_test$Company<-NULL


summary(model)

predict1 = predict(model,crunch_test[1:6,],type='response')
View(predict1)


