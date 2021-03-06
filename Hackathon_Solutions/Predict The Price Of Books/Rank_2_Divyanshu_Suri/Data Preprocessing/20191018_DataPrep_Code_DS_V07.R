library(Metrics)
library(readr)
library(xgboost)
library(sqldf)
library(openxlsx)

setwd("C:\\Kaggle\\BooksPrice\\CV Scrd Trn Datasets")
file_names <- list.files("C:\\Kaggle\\BooksPrice\\CV Scrd Trn Datasets")
file_names

Files_To_Remove <- c("20191003_Stacking01_DS.csv","20191004_Stack02_DS.csv","20191006_Stack03_DS.csv","20191007_Stack04_DS.csv",
                     "20191007_Stack05_DS.csv","20191008_Stack06_DS.csv","20191008_Stack07_DS.csv","20191009_Stack08_DS.csv",
                     "20191009_Stack09_DS.csv","20191009_Stack10_DS.csv","20191009_Stack11_DS.csv","20191010_Stack12_DS.csv",
                     "20191010_Stack13_DS.csv","20191010_Stack14_DS.csv","20191010_Stack15_DS.csv","20191014_Stack16_DS.csv",
                     "20191017_Stack17_DS.csv","20191018_Stack18_DS.csv","20191022_Stack19_DS.csv","20191023_Stack20_DS.csv",
                     "20191023_Stack21_DS.csv","20191024_Stack22_DS.csv","20191024_Stack23_DS.csv","20191025_Stack24_DS.csv",
                     "20191025_Stack25_DS.csv")
file_names <- file_names[!(file_names %in% Files_To_Remove)]
file_names

training01 <- read.csv("20191004_Stack02_DS.csv", stringsAsFactors = FALSE, check.names = FALSE)
training01$Price_Log_Pred_LGB_ENS <- NULL
training01 <- training01[order(training01$id),]

temp_trn <- read.csv("20191007_Stack04_DS.csv", stringsAsFactors = FALSE, check.names = FALSE)
temp_trn <- temp_trn[order(temp_trn$id),]
temp_trn <- temp_trn[,c("Price_Log_Pred_LGB","Price_Log_Pred_Keras","Price_Log_Pred_RIDGE","Price_Log_Pred_LASSO",
                        "Price_Log_Pred_KNN","Price_Log_Pred_RF","Price_Log_Pred_XGB")]

training01 <- cbind.data.frame(training01,temp_trn)
remove(temp_trn)

temp_trn <- read.csv("20191007_Stack05_DS.csv", stringsAsFactors = FALSE, check.names = FALSE)
temp_trn <- temp_trn[order(temp_trn$id),]
temp_trn <- temp_trn[,c("Price_Log_Pred_LGB","Price_Log_Pred_RIDGE","Price_Log_Pred_LASSO",
                        "Price_Log_Pred_KNN","Price_Log_Pred_RF","Price_Log_Pred_XGB")]

training01 <- cbind.data.frame(training01,temp_trn)
remove(temp_trn)

temp_trn <- read.csv("20191008_Stack06_DS.csv", stringsAsFactors = FALSE, check.names = FALSE)
temp_trn <- temp_trn[order(temp_trn$id),]
temp_trn <- temp_trn[,c("Price_Log_Pred_LGB","Price_Log_Pred_RIDGE","Price_Log_Pred_LASSO",
                        "Price_Log_Pred_KNN","Price_Log_Pred_RF","Price_Log_Pred_XGB")]

training01 <- cbind.data.frame(training01,temp_trn)
remove(temp_trn)

temp_trn <- read.csv("20191009_Stack11_DS.csv", stringsAsFactors = FALSE, check.names = FALSE)
temp_trn <- temp_trn[order(temp_trn$id),]
temp_trn <- temp_trn[,c("Price_Log_Pred_LGB","Price_Log_Pred_Keras","Price_Log_Pred_RIDGE","Price_Log_Pred_LASSO",
                        "Price_Log_Pred_KNN","Price_Log_Pred_RF","Price_Log_Pred_XGB")]

training01 <- cbind.data.frame(training01,temp_trn)
remove(temp_trn)

temp_trn <- read.csv("20191010_Stack12_DS.csv", stringsAsFactors = FALSE, check.names = FALSE)
temp_trn <- temp_trn[order(temp_trn$id),]
temp_trn <- temp_trn[,c("Price_Log_Pred_LGB","Price_Log_Pred_Keras","Price_Log_Pred_RIDGE","Price_Log_Pred_LASSO",
                        "Price_Log_Pred_KNN","Price_Log_Pred_RF","Price_Log_Pred_XGB")]

training01 <- cbind.data.frame(training01,temp_trn)
remove(temp_trn)

temp_trn <- read.csv("20191010_Stack13_DS.csv", stringsAsFactors = FALSE, check.names = FALSE)
temp_trn <- temp_trn[order(temp_trn$id),]
temp_trn <- temp_trn[,c("Price_Log_Pred_LGB","Price_Log_Pred_Keras","Price_Log_Pred_RIDGE","Price_Log_Pred_LASSO",
                        "Price_Log_Pred_KNN","Price_Log_Pred_RF","Price_Log_Pred_XGB")]

training01 <- cbind.data.frame(training01,temp_trn)
remove(temp_trn)

temp_trn <- read.csv("20191010_Stack15_DS.csv", stringsAsFactors = FALSE, check.names = FALSE)
temp_trn <- temp_trn[order(temp_trn$id),]
temp_trn <- temp_trn[,c("Price_Log_Pred_LGB","Price_Log_Pred_RIDGE","Price_Log_Pred_LASSO",
                        "Price_Log_Pred_KNN","Price_Log_Pred_RF","Price_Log_Pred_XGB")]

training01 <- cbind.data.frame(training01,temp_trn)
remove(temp_trn)

temp_trn <- read.csv("20191014_Stack16_DS.csv", stringsAsFactors = FALSE, check.names = FALSE)
temp_trn <- temp_trn[order(temp_trn$id),]
temp_trn <- temp_trn[,c("Price_Log_Pred_LGB","Price_Log_Pred_Keras","Price_Log_Pred_RIDGE",
                        "Price_Log_Pred_LASSO","Price_Log_Pred_RF","Price_Log_Pred_XGB",
                        "Price_Log_Pred_LGB2","Price_Log_Pred_Keras2","Price_Log_Pred_RIDGE2",
                        "Price_Log_Pred_LASSO2","Price_Log_Pred_RF2","Price_Log_Pred_XGB2")]

training01 <- cbind.data.frame(training01,temp_trn)
remove(temp_trn)

temp_trn <- read.csv("20191017_Stack17_DS.csv", stringsAsFactors = FALSE, check.names = FALSE)
temp_trn <- temp_trn[order(temp_trn$id),]
temp_trn <- temp_trn[,c("Price_Log_Pred_LGB","Price_Log_Pred_Keras","Price_Log_Pred_RIDGE","Price_Log_Pred_LASSO",
                        "Price_Log_Pred_KNN","Price_Log_Pred_RF","Price_Log_Pred_XGB")]

training01 <- cbind.data.frame(training01,temp_trn)
remove(temp_trn)

for(i in 1:length(file_names)) {
  temp_trn <- read.csv(file_names[i], stringsAsFactors = FALSE, check.names = FALSE)
  temp_trn <- temp_trn[order(temp_trn$id),]
  training01[,paste("Price_Log_Pred",i,sep="")] <- temp_trn[,ncol(temp_trn)]
  remove(temp_trn)
}

setwd("C:\\Kaggle\\BooksPrice\\CV Scrd Tst Datasets")

testing01 <- read.csv("20191004_Stack02_DS.csv", stringsAsFactors = FALSE, check.names = FALSE)
testing01 <- testing01[,c("id",names(training01)[5:11])]
testing01 <- testing01[order(testing01$id),]

temp_trn <- read.csv("20191007_Stack04_DS.csv", stringsAsFactors = FALSE, check.names = FALSE)
temp_trn <- temp_trn[order(temp_trn$id),]
temp_trn <- temp_trn[,c("Price_Log_Pred_LGB","Price_Log_Pred_Keras","Price_Log_Pred_RIDGE","Price_Log_Pred_LASSO",
                        "Price_Log_Pred_KNN","Price_Log_Pred_RF","Price_Log_Pred_XGB")]

testing01 <- cbind.data.frame(testing01,temp_trn)
remove(temp_trn)

temp_trn <- read.csv("20191007_Stack05_DS.csv", stringsAsFactors = FALSE, check.names = FALSE)
temp_trn <- temp_trn[order(temp_trn$id),]
temp_trn <- temp_trn[,c("Price_Log_Pred_LGB","Price_Log_Pred_RIDGE","Price_Log_Pred_LASSO",
                        "Price_Log_Pred_KNN","Price_Log_Pred_RF","Price_Log_Pred_XGB")]

testing01 <- cbind.data.frame(testing01,temp_trn)
remove(temp_trn)

temp_trn <- read.csv("20191008_Stack06_DS.csv", stringsAsFactors = FALSE, check.names = FALSE)
temp_trn <- temp_trn[order(temp_trn$id),]
temp_trn <- temp_trn[,c("Price_Log_Pred_LGB","Price_Log_Pred_RIDGE","Price_Log_Pred_LASSO",
                        "Price_Log_Pred_KNN","Price_Log_Pred_RF","Price_Log_Pred_XGB")]

testing01 <- cbind.data.frame(testing01,temp_trn)
remove(temp_trn)

temp_trn <- read.csv("20191009_Stack11_DS.csv", stringsAsFactors = FALSE, check.names = FALSE)
temp_trn <- temp_trn[order(temp_trn$id),]
temp_trn <- temp_trn[,c("Price_Log_Pred_LGB","Price_Log_Pred_Keras","Price_Log_Pred_RIDGE","Price_Log_Pred_LASSO",
                        "Price_Log_Pred_KNN","Price_Log_Pred_RF","Price_Log_Pred_XGB")]

testing01 <- cbind.data.frame(testing01,temp_trn)
remove(temp_trn)

temp_trn <- read.csv("20191010_Stack12_DS.csv", stringsAsFactors = FALSE, check.names = FALSE)
temp_trn <- temp_trn[order(temp_trn$id),]
temp_trn <- temp_trn[,c("Price_Log_Pred_LGB","Price_Log_Pred_Keras","Price_Log_Pred_RIDGE","Price_Log_Pred_LASSO",
                        "Price_Log_Pred_KNN","Price_Log_Pred_RF","Price_Log_Pred_XGB")]

testing01 <- cbind.data.frame(testing01,temp_trn)
remove(temp_trn)

temp_trn <- read.csv("20191010_Stack13_DS.csv", stringsAsFactors = FALSE, check.names = FALSE)
temp_trn <- temp_trn[order(temp_trn$id),]
temp_trn <- temp_trn[,c("Price_Log_Pred_LGB","Price_Log_Pred_Keras","Price_Log_Pred_RIDGE","Price_Log_Pred_LASSO",
                        "Price_Log_Pred_KNN","Price_Log_Pred_RF","Price_Log_Pred_XGB")]

testing01 <- cbind.data.frame(testing01,temp_trn)
remove(temp_trn)

temp_trn <- read.csv("20191010_Stack15_DS.csv", stringsAsFactors = FALSE, check.names = FALSE)
temp_trn <- temp_trn[order(temp_trn$id),]
temp_trn <- temp_trn[,c("Price_Log_Pred_LGB","Price_Log_Pred_RIDGE","Price_Log_Pred_LASSO",
                        "Price_Log_Pred_KNN","Price_Log_Pred_RF","Price_Log_Pred_XGB")]

testing01 <- cbind.data.frame(testing01,temp_trn)
remove(temp_trn)

temp_trn <- read.csv("20191014_Stack16_DS.csv", stringsAsFactors = FALSE, check.names = FALSE)
temp_trn <- temp_trn[order(temp_trn$id),]
temp_trn <- temp_trn[,c("Price_Log_Pred_LGB","Price_Log_Pred_Keras","Price_Log_Pred_RIDGE",
                        "Price_Log_Pred_LASSO","Price_Log_Pred_RF","Price_Log_Pred_XGB",
                        "Price_Log_Pred_LGB2","Price_Log_Pred_Keras2","Price_Log_Pred_RIDGE2",
                        "Price_Log_Pred_LASSO2","Price_Log_Pred_RF2","Price_Log_Pred_XGB2")]

testing01 <- cbind.data.frame(testing01,temp_trn)
remove(temp_trn)

temp_trn <- read.csv("20191017_Stack17_DS.csv", stringsAsFactors = FALSE, check.names = FALSE)
temp_trn <- temp_trn[order(temp_trn$id),]
temp_trn <- temp_trn[,c("Price_Log_Pred_LGB","Price_Log_Pred_Keras","Price_Log_Pred_RIDGE","Price_Log_Pred_LASSO",
                        "Price_Log_Pred_KNN","Price_Log_Pred_RF","Price_Log_Pred_XGB")]

testing01 <- cbind.data.frame(testing01,temp_trn)
remove(temp_trn)

for(i in 1:length(file_names)) {
  temp_trn <- read.csv(file_names[i], stringsAsFactors = FALSE, check.names = FALSE)
  temp_trn <- temp_trn[order(temp_trn$id),]
  testing01[,paste("Price_Log_Pred",i,sep="")] <- temp_trn[,ncol(temp_trn)]
  remove(temp_trn)
}

fe_names <- names(testing01)[2:ncol(testing01)]
new_names <- seq.int(length(fe_names))
new_names <- paste("Price_Log_Pred_",new_names,sep="")
new_names

names(training01)[5:ncol(training01)] <- new_names
names(testing01)[2:ncol(testing01)] <- new_names

write.csv(training01,"C:\\Kaggle\\BooksPrice\\Participants_Data\\Data_Train07.csv",row.names = FALSE)
write.csv(testing01,"C:\\Kaggle\\BooksPrice\\Participants_Data\\Data_Test07.csv",row.names = FALSE)