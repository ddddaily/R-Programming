#Load Data(as.is=TRUE:prevent read into factors)
data<-read.table("household_power_consumption.txt",sep=";", header=TRUE,na.strings="?",as.is=TRUE)

#Convert the Date and Time variables in R
data$Date<-as.Date(data$Date,format='%d/%m/%Y')

#Only extract the data we wanted
mydata<-subset(data, Date=="2007/02/01" | Date=="2007/02/02")

#Plot a histogram of global active power
library(datasets)
hist(mydata$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png", width=480, height=480)
dev.off()
