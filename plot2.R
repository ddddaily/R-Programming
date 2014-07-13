#Load Data(as.is=TRUE:prevent read into factors)
data<-read.table("household_power_consumption.txt",sep=";", header=TRUE,na.strings="?",as.is=TRUE)


#Only extract the data we wanted
mydata<-subset(data,Date=="1/2/2007"|Date=="2/2/2007")

#Convert the Date and Time variables in R
mydata$Time<-paste(mydata$Date, mydata$Time)
mydata$Time<-strptime(mydata$Time,"%d/%m/%Y %H:%M:%S")

#Plot date vs. global active power
library(datasets)
with(mydata, plot(mydata$Time, mydata$Global_active_power,type="l",ylab="Global Active Power (kilowatts)", xlab=""))
dev.copy(png, file = "plot2.png", width=480, height=480)
dev.off()
