# Reading the text file
powerCondata <- read.csv("../exdata_data_household_power_consumption/household_power_consumption.txt",
                         sep = ";",
                         na.strings = "?" )
nrow(powerCondata)

# subsetting the Power Data
subsetPowerData <-  subset(powerCondata, powerCondata$Date == "1/2/2007" | powerCondata$Date =="2/2/2007")

str(subsetPowerData) 

global_ActivePower <- as.numeric(subsetPowerData$Global_active_power)
global_ReactivePower <- as.numeric(subsetPowerData$Global_reactive_power)
voltage <- as.numeric(subsetPowerData$Voltage)
subMetering1 <- as.numeric(subsetPowerData$Sub_metering_1)
subMetering2 <- as.numeric(subsetPowerData$Sub_metering_2)
subMetering3 <- as.numeric(subsetPowerData$Sub_metering_3)


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(strptime(
  paste(
    subsetPowerData$Date, subsetPowerData$Time, sep=" "),
  "%d/%m/%Y %H:%M:%S"),
  global_ActivePower,
  type="l", 
  xlab="", 
  ylab="Global Active Power", cex=0.2)

plot(strptime(
  paste(
    subsetPowerData$Date, subsetPowerData$Time, sep=" "),
  "%d/%m/%Y %H:%M:%S"), 
  voltage, 
  type="l", 
  xlab="datetime", 
  ylab="Voltage")

plot(strptime(
  paste(
    subsetPowerData$Date, subsetPowerData$Time, sep=" "),
  "%d/%m/%Y %H:%M:%S"),
  subMetering1,
  type="l",
  ylab="Energy Submetering",
  xlab="")
lines(strptime(
  paste(
    subsetPowerData$Date, subsetPowerData$Time, sep=" "),
  "%d/%m/%Y %H:%M:%S"),
  subMetering2,
  type="l",
  col="red")
lines(strptime(
  paste(
    subsetPowerData$Date, subsetPowerData$Time, sep=" "),
  "%d/%m/%Y %H:%M:%S"),
  subMetering3,
  type="l",
  col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(strptime(
  paste(
    subsetPowerData$Date, subsetPowerData$Time, sep=" "),
  "%d/%m/%Y %H:%M:%S"),
  global_ReactivePower,
  type="l",
  xlab="datetime",
  ylab="Global_reactive_power")

dev.off()
