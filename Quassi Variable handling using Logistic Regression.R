library(readxl)
Training_Data <- read_excel("Data.xlsx", sheet = "Training Data for Multi-Class M")

Test_Data <- read_excel("Data.xlsx",  sheet = "Test Data for Multi-Class Model")

for (i in 13:47)
{
  Training_Data[,i]<-factor(gsub("\\s*", "",unlist(Training_Data[,i])), levels=1:4, ordered=TRUE)
}

for (i in 13:47)
{
  Test_Data[,i]<-factor(gsub("\\s*", "",unlist(Test_Data[,i])), levels=1:4, ordered=TRUE)
}


Training_data_quasi <- subset(Training_Data, select = -c(SN,HospitalNo2,MaritalStatus,BedCategory, State,Country,CE_NPS,AdmissionDate, DischargeDate))

Test_data_quasi <- subset(Test_Data, select = -c(SN,HospitalNo2,MaritalStatus,BedCategory, State,Country,CE_NPS,AdmissionDate, DischargeDate))




library(dplyr)
Training_data_binary <- mutate(Training_data_quasi, NPS_Status = ifelse(NPS_Status == "Passive", "Detractor",NPS_Status))

Test_data_binary <-  mutate(Test_data_quasi, NPS_Status = ifelse(NPS_Status == "Passive", "Detractor",NPS_Status ))

