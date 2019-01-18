#BIOL 432 Assignment 1
#Nikita Konstantinov

#load appropriate packages
library(dplyr)

#manually change file "FallopiaData.csv" to "InData.csv"
file.rename("FallopiaData.csv","InData.csv")

#load data into data.frame: MyData
MyData <- read.csv("InData.csv")
MyData

# use filter() to remove all rows with 'Total' <60
MyData1<-filter(MyData,Total>=60)
MyData1

# replace column 'Total' with 'TotalG'
X<-rename(MyData1, TotalG = Total)
names(X)

#convert column 'TotalG' values from mg to g (1mg=0.001)
X$TotalG<-X$TotalG/1000

#Reorder columns in order ‘Total’, ‘Taxon’, ‘Scenario’, ‘Nutrients’, and remove other columns
X<-select(X, TotalG, Taxon, Scenario, Nutrients)
names(X)
#IF there is a Nutrients column, replace each string with the first letter
if ("Nutrients" %in% colnames(X)) {
  X$Nutrients <- gsub("(\\w)\\w+", "\\1", X$Nutrients)
}
X

#Replace all periods with commas in the TotalG column
X$TotalG <- gsub("\\.", ",", X$TotalG)
X

write.csv(X, "InData.csv")
