#Load Data(as.is=TRUE:prevent read into factors)
data<-read.table("household_power_consumption.txt",sep=";", header=TRUE,na.strings="?",as.is=TRUE)


#Only extract the data we wanted
mydata<-subset(data,Date=="1/2/2007"|Date=="2/2/2007")

#Convert the Date and Time variables in R
mydata$Time<-paste(mydata$Date, mydata$Time)
mydata$Time<-strptime(mydata$Time,"%d/%m/%Y %H:%M:%S")

#Plot time vs. sub metering
png(file="plot3.png",width=480,height=480)
with(mydata, plot(mydata$Time, mydata$Sub_metering_1,type="l",col="black",ylab="Energy sub metering", xlab=""))
with(mydata, lines(mydata$Time, mydata$Sub_metering_2, col="red"))
with(mydata, lines(mydata$Time, mydata$Sub_metering_3,col="blue"))
legend("topright",lty=1,seg.len=2,col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

dev.off()
