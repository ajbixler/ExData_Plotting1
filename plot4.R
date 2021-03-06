#set WD and create data directory.
library(lubridate)
#download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "./data/EDA_W1.zip", method = "curl")
#unzip("./data/eda_W1.zip")
hpc <- read.table("./data/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
hpc$Date<-dmy(hpc$Date)
hpc$Time<-hms(hpc$Time)
hpcsub<-subset(hpc, year(Date)==2007)
rm(hpc)
hpcsub<-subset(hpcsub, month(Date) == 2)
hpcsub<-subset(hpcsub, day(Date) == 1:2) 
hpcsub$Global_active_power <- as.numeric(hpcsub$Global_active_power)
#1440 rows, 9 variables, dates and times formatted with lubridate

#setup for plot 4 
png(filename = "plot4.png")
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
#plot 1
plot(datetime, hpcsub$Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = "", type = "l")

#plot 2
plot(datetime, hpcsub$Voltage, ylab = "Voltage", type = "l")

#plot 3
plot(datetime, hpcsub$Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "l")
points(datetime, hpcsub$Sub_metering_2, type = "l", col = "red")
points(datetime, hpcsub$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1, col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#plot 4
plot(datetime, hpcsub$Global_reactive_power, ylab = "Global_Reactive_Power (kilowatts)", type = "l")

dev.off()
