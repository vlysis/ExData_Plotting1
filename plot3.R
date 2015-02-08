#only load desired days via sqldf
require(sqldf)
file <- c("household_power_consumption.txt")
selData <- read.csv.sql(file, header = T,  sep=";", sql = "select * from file where (Date == '1/2/2007' OR Date == '2/2/2007')" )

activePower <- selData$Global_active_power

dVec <- selData$Date
tVec <- selData$Time

#conversion to correct date/time format required, set to DD/MM/YY format (required by region)
dProc <- as.Date(dVec, "%d/%m/20%y")
#combine Date and Time fields
combTime <- paste(dProc,tVec)
fTime <- strptime(combTime,format="%Y-%m-%d %H:%M:%S")

#Define graphics device
png("plot3.png")
#Setup line graph
plot(fTime,selData$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(fTime,selData$Sub_metering_2,col="red")
lines(fTime,selData$Sub_metering_3,col="blue")
legend('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_3") ,lty=1, col=c('black', 'red', 'blue'))
dev.off()