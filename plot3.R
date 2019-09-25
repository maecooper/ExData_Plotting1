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
png("plot3.png")

#create line graphs
with(FebUsage, plot(DateTime, Sub_metering_1, type="n",ylab="Energy sub metering",xlab=""))
with(FebUsage,lines(DateTime,Sub_metering_1))
with(FebUsage,lines(DateTime,Sub_metering_2,col="red"))
with(FebUsage,lines(DateTime,Sub_metering_3,col="blue"))

#add legend
legend("topright",legend=names(FebUsage[,7:9]),lty=1,col = c("black","red","blue"))

#close png file
dev.off()
