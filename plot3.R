powerComData <-  read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
powerComData.DateSubset <- powerComData[as.Date(powerComData$Date, "%d/%m/%Y") <= "2007-02-02" & as.Date(powerComData$Date, "%d/%m/%Y") >= "2007-02-01" ,] 
powerComData.DateSubset$RDateTime <- strptime(paste(powerComData.DateSubset$Date, powerComData.DateSubset$Time), "%d/%m/%Y %H:%M:%S")

png("plot3.png", width = 480, height = 480)
plot(powerComData.DateSubset$RDateTime, powerComData.DateSubset$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(powerComData.DateSubset$RDateTime, powerComData.DateSubset$Sub_metering_2, type="l", col="red")
lines(powerComData.DateSubset$RDateTime, powerComData.DateSubset$Sub_metering_3, type="l", col="blue")
legend("topright", colnames(powerComData.DateSubset)[c(7:9)], col=c("black", "red", "blue"), lty=1, cex=.75)

dev.off()