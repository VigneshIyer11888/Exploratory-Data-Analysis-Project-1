# Reading the text file

powerCondata <- read.csv("../exdata_data_household_power_consumption/household_power_consumption.txt",
                         sep = ";",
                         na.strings = "?" )
nrow(powerCondata)

# subsetting the Power Data
subsetPowerData <-  subset(powerCondata, powerCondata$Date == "1/2/2007" | powerCondata$Date =="2/2/2007")

str(subsetPowerData) 

png("plot2.png", width=480, height=480)

plot(strptime(paste(subsetPowerData $Date, subsetPowerData $Time, sep=" "), "%d/%m/%Y %H:%M:%S"), as.numeric(subsetPowerData $Global_active_power), type="l", xlab="", 
     ylab="Global Active Power (kilowatts)")

dev.off()
