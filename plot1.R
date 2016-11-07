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

#plot 1
png(filename = "plot1.png")
hist(hpcsub$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", breaks = 12)
dev.off()
