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
png("plot2.png")

#create histogram
with(FebUsage, plot(DateTime, Global_active_power, type="n",ylab="Global Active Power (kilowats)",xlab=""))
with(FebUsage,lines(DateTime,Global_active_power))

#close png file
dev.off()
