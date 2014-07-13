#Load Data(as.is=TRUE:prevent read into factors)
data<-read.table("household_power_consumption.txt",sep=";", header=TRUE,na.strings="?",as.is=TRUE)


#Only extract the data we wanted
mydata<-subset(data,Date=="1/2/2007"|Date=="2/2/2007")

#Convert the Date and Time variables in R
mydata$Time<-paste(mydata$Date, mydata$Time)
mydata$Time<-strptime(mydata$Time,"%d/%m/%Y %H:%M:%S")

#Plots 
png(file="plot4.png",width=480,height=480)
library(datasets)
par(mfrow = c(2, 2))
with(mydata, {
  plot(mydata$Time, mydata$Global_active_power,type="l",ylab="Global Active Power", xlab="")
  plot(mydata$Time, mydata$Voltage,type="l",ylab="Voltage", xlab="datetime")
  plot(mydata$Time, mydata$Sub_metering_1,type="l",col="black",ylab="Energy sub metering", xlab="")
  lines(mydata$Time, mydata$Sub_metering_2,type="l",col="red")
  lines(mydata$Time, mydata$Sub_metering_3,type="l",col="blue")
  legend("topright",bty="n",lty=1, lwd=1,seg.len=2,col=c("black","blue", "red"), legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
  plot(mydata$Time, mydata$Global_reactive_power,type="l",ylab="Global_reactive_power", xlab="datetime")
})

dev.off()
