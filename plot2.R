#only load desired days via sqldf
require(sqldf)
file <- c("household_power_consumption.txt")
selData <- read.csv.sql(file, header = T,  sep=";", sql = "select * from file where (Date == '1/2/2007' OR Date == '2/2/2007')" )
#selData <- subData[1,]
#selData[selData =="?"] <- NA
#selData <- na.omit(selData)

activePower <- selData$Global_active_power

dVec <- selData$Date
tVec <- selData$Time

#conversion to correct date/time format required, set to DD/MM/YY format
dProc <- as.Date(dVec, "%d/%m/20%y")
#combine Date and Time fields
combTime <- paste(dProc,tVec)
fTime <- strptime(combTime,format="%Y-%m-%d %H:%M:%S")

#Define graphics device
png("plot2.png")
#Setup line graph
plot(fTime,activePower,type="l",ylab="Global active power (kilowatts)",xlab="")
dev.off()