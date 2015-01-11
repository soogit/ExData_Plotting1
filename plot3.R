readthefile = read.table("household_power_consumption.txt" ,header=TRUE, sep = ";" , nrows = 72606 , na.strings = c("NA","?"))
readthefile <- subset(readthefile,Date == "1/2/2007" | Date == "2/2/2007")

require(lubridate)
readthefile$Time <- dmy_hms(paste(readthefile$Date, readthefile$Time))
readthefile$Date <- dmy(readthefile$Date)

png("plot3.png", width=480, height= 480)
plot(readthefile$Time,readthefile$Sub_metering_1, type="l", xlab="", ylab=" Energy Sub Metering", main= "plot3.png")
points(readthefile$Time,readthefile$Sub_metering_2, type="l", col="red")
points(readthefile$Time,readthefile$Sub_metering_3, type="l", col="blue")
legend("topright", pch= NA,cex = .75, lty = 1,lwd= 1, col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#dev.copy(png, "plot3.png", width=480, height= 480)
dev.off()