#bPath <- "H:\\Documents\\Coursera\\DataScienceSpecialization\\rCode\\"
#hData <- read.csv(bPath+"household_power_consumption.txt", colClasses = "character")

#only load desired days via sqldf
require(sqldf)
file <- c("household_power_consumption.txt")
selData <- read.csv.sql(file, header = T,  sep=";", sql = "select * from file where (Date == '1/2/2007' OR Date == '2/2/2007')" )

activePower <- selData$Global_active_power
#Define graphics device
png("plot1.png")
hist(activePower,main = "Global active power",col="red",xlab="Global active power (kilowatts)")
dev.off()