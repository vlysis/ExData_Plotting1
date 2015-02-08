

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
png("plot2.png")
#Setup line graph
plot(fTime,selData$Global_active_power,type="l",ylab="Global active power (kilowatts)",xlab="")
dev.off()