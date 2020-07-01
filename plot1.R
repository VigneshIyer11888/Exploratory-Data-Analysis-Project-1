if(!file.exists("./Exploratory_Data_Analysis_Project-1")){
  dir.create("./Exploratory_Data_Analysis_Project-1")
}


datafile <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

download.file(datafile, 
              destfile = "../exdata_data_household_power_consumption.zip")

unzip(zipfile = "../exdata_data_household_power_consumption.zip", 
      exdir = "../exdata_data_household_power_consumption")

# Reading the text file

powerCondata <- read.csv("../exdata_data_household_power_consumption/household_power_consumption.txt",
                         sep = ";",
                         na.strings = "?" )

nrow(powerCondata)

subsetPowerData <-  subset(powerCondata, powerCondata$Date == "1/2/2007" | powerCondata$Date =="2/2/2007")
powerCondata <- read.csv("../exdata_data_household_power_consumption/household_power_consumption.txt",
                         sep = ";",
                         na.strings = "?" )
nrow(powerCondata)

subsetPowerData <-  subset(powerCondata, powerCondata$Date == "1/2/2007" | powerCondata$Date =="2/2/2007")

png("plot1.png", width = 480, height = 480)

hist(subsetPowerData$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()
