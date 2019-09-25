library(data.table)
library(lubridate)
library(stringr)

#get data
usage<- fread("H:/DATA SCIENCE TRAINING/Exploratory Analysis/household_power_consumption.txt", na.strings="?")

#subset data
FebUsage<- subset(usage,Date=="1/2/2007"|Date=="2/2/2007")

#create date/time variable
FebUsage$DateTime <- with(FebUsage,dmy_hms(paste(Date,Time)))


#open png file
png("plot1.png")

#create histogram
hist(FebUsage$Global_active_power, breaks=12, col="red",xlab = "Global Active Power (kilowats)",main="Global Active Power")

#close png file
dev.off()
