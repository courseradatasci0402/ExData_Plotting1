powerComData <-  read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
powerComData.DateSubset <- powerComData[as.Date(powerComData$Date, "%d/%m/%Y") <= "2007-02-02" & as.Date(powerComData$Date, "%d/%m/%Y") >= "2007-02-01" ,] 
powerComData.DateSubset$RDateTime <- strptime(paste(powerComData.DateSubset$Date, powerComData.DateSubset$Time), "%d/%m/%Y %H:%M:%S")

png("plot1.png", width = 480, height = 480)
hist(powerComData.DateSubset$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()