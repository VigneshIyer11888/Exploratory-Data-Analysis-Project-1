# Reading the text file
powerCondata <- read.csv("../exdata_data_household_power_consumption/household_power_consumption.txt",
                         sep = ";",
                         na.strings = "?" )
nrow(powerCondata)

# subsetting the Power Data
subsetPowerData <-  subset(powerCondata, powerCondata$Date == "1/2/2007" | powerCondata$Date =="2/2/2007")

str(subsetPowerData) 

png("plot3.png", width=480, height=480)
plot(strptime(paste(subsetPowerData$Date, subsetPowerData$Time, sep=" "), "%d/%m/%Y %H:%M:%S"), as.numeric(subsetPowerData$Sub_metering_1), type="l", ylab="Energy Submetering", xlab="")
lines(strptime(paste(subsetPowerData$Date, subsetPowerData$Time, sep=" "), "%d/%m/%Y %H:%M:%S"), as.numeric(subsetPowerData$Sub_metering_2), type="l", col="red")
lines(strptime(paste(subsetPowerData$Date, subsetPowerData$Time, sep=" "), "%d/%m/%Y %H:%M:%S"), as.numeric(subsetPowerData$Sub_metering_3), type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()


