

fileName <- c("household_power_consumption.txt")
#Read data and omit NA's 
inData <- read.table(fileName, header = TRUE, sep = ";", na.strings = "?")
inData <-na.omit(inData)
#select desired days
selData <- inData[inData$Date %in% c("1/2/2007", "2/2/2007"),]

#Define graphics device
png("plot1.png")
hist(selData$Global_active_power,main = "Global active power",col="red",xlab="Global active power (kilowatts)")
dev.off()