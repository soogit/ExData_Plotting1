readthefile = read.table("household_power_consumption.txt" ,header=TRUE, sep = ";" , nrows = 72606 , na.strings = c("NA","?"))
readthefile <- subset(readthefile,Date == "1/2/2007" | Date == "2/2/2007")

require(lubridate)
readthefile$Time <- dmy_hms(paste(readthefile$Date, readthefile$Time))
readthefile$Date <- dmy(readthefile$Date)


png("plot2.png", width=480, height= 480)
plot(readthefile$Time,readthefile$Global_active_power , type = "l" , xlab="",ylab= "Global Active Power(Kilowatts)", main="plot2.png")
#dev.copy(png, "plot2.png", width=480, height= 480)
dev.off()