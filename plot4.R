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
png("plot4.png")

#create line graphs
par(mfrow=c(2,2))
with(FebUsage, plot(DateTime, Global_active_power, type="n",ylab="Global Active Power",xlab=""))
with(FebUsage,lines(DateTime,Global_active_power))

with(FebUsage, plot(DateTime, Voltage, type="n",ylab="Voltage",xlab="datetime"))
with(FebUsage,lines(DateTime,Voltage))

with(FebUsage, plot(DateTime, Sub_metering_1, type="n",ylab="Energy sub metering",xlab=""))
with(FebUsage,lines(DateTime,Sub_metering_1))
with(FebUsage,lines(DateTime,Sub_metering_2,col="red"))
with(FebUsage,lines(DateTime,Sub_metering_3,col="blue"))
legend("topright",legend=names(FebUsage[,7:9]),lty=1,col = c("black","red","blue"),bty="n",cex=.9)

with(FebUsage, plot(DateTime, Global_reactive_power, type="n",xlab="datetime"))
with(FebUsage,lines(DateTime,Global_reactive_power))

#close png file
dev.off()
