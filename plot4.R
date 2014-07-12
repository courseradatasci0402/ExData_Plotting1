powerComData <-  read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
powerComData.DateSubset <- powerComData[as.Date(powerComData$Date, "%d/%m/%Y") <= "2007-02-02" & as.Date(powerComData$Date, "%d/%m/%Y") >= "2007-02-01" ,] 
powerComData.DateSubset$RDateTime <- strptime(paste(powerComData.DateSubset$Date, powerComData.DateSubset$Time), "%d/%m/%Y %H:%M:%S")

png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
plot(powerComData.DateSubset$RDateTime, powerComData.DateSubset$Global_active_power, type="l", ylab="Global Active Power", xlab="")

plot(powerComData.DateSubset$RDateTime, powerComData.DateSubset$Voltage, type="l", ylab="Voltage", xlab="datetime")

plot(powerComData.DateSubset$RDateTime, powerComData.DateSubset$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(powerComData.DateSubset$RDateTime, powerComData.DateSubset$Sub_metering_2, type="l", col="red")
lines(powerComData.DateSubset$RDateTime, powerComData.DateSubset$Sub_metering_3, type="l", col="blue")
legend("topright", colnames(powerComData.DateSubset)[c(7:9)], col=c("black", "red", "blue"), lty=1, bty="n", cex=.95)

plot(powerComData.DateSubset$RDateTime, powerComData.DateSubset$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")

dev.off()