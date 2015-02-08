

fileName <- c("household_power_consumption.txt")
#Read data and omit NA's 
inData <- read.table(fileName, header = TRUE, sep = ";", na.strings = "?")
inData <-na.omit(inData)
#select desired days
selData <- inData[inData$Date %in% c("1/2/2007", "2/2/2007"),]

dVec <- selData$Date
tVec <- selData$Time

#Convert to date object
dProc <- as.Date(dVec, "%d/%m/20%y")
#combine Date and Time fields
combTime <- paste(dProc,tVec)
fTime <- strptime(combTime,format="%Y-%m-%d %H:%M:%S")

#Define graphics device
png("plot4.png")
#setting 2 by 2 plotting frame
par(mfcol = c(2,2))

#1st plot
plot(fTime,selData$Global_active_power,type="l",ylab="Global active power (kilowatts)",xlab="")

#2nd plot
plot(fTime,selData$Sub_metering_1,type="l",ylab="Energy sub metering")
lines(fTime,selData$Sub_metering_2,col="red")
lines(fTime,selData$Sub_metering_3,col="blue")
legend('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_3") ,lty=1, col=c('black', 'red', 'blue'))

#3rd plot
plot(fTime,selData$Voltage,type="l",ylab="Voltage",xlab="datetime")

#4th plot
plot(fTime,selData$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")

dev.off()
