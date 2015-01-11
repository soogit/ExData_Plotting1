
readthefile = read.table("household_power_consumption.txt" ,header=TRUE, sep = ";" , nrows = 72606 , na.strings = c("NA","?"))
readthefile <- subset(readthefile,Date == "1/2/2007" | Date == "2/2/2007")

require(lubridate)
readthefile$Time <- dmy_hms(paste(readthefile$Date, readthefile$Time))
readthefile$Date <- dmy(readthefile$Date)


#class(readthefile$Global_active_power)
png("plot1.png", width=480, height= 480)
hist(readthefile$Global_active_power , col = "red" , xlab = "Global Active Power(Kilowatts)", main = "Global Active Power")
#dev.copy(png, "plot1.png", width=480, height= 480)
dev.off()