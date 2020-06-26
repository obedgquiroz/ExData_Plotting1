## READING DATA
Sys.setlocale(locale = "USA")
data <- read.table("C:/Users/OBED GARCIA/Documents/household_power_consumption.txt", header = TRUE, sep = ";", colClasses = "character")
library(lubridate)
data$Date_Time <- paste(data$Date, data$Time)
data$Date_Time  <- dmy_hms(data$Date_Time)
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$Time <- strptime(data$Time, format = "%H:%M:%S")
for (i in 3:9) {
  data[,i] <- as.numeric(data[,i])
}
dataf <- rbind(data[which(data[, "Date"] %in% as.Date("2007-02-01")),], data[which(data[, "Date"] %in% as.Date("2007-02-02")),])

## PLOT4
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
## P1
plot(dataf$Date_Time, dataf$Global_active_power, type = "l",xlab = "", ylab = "Global Active Power (kilowatts)")
## P2
plot(dataf$Date_Time, dataf$Voltage, type = "l",xlab = "datetime", ylab = "Voltage")
## P3
plot(dataf$Date_Time, dataf$Sub_metering_1, type = "l", col = "black", xlab = "" ,ylab = "", ylim = c(0, 40))
par(new = TRUE)
plot(dataf$Date_Time, dataf$Sub_metering_2, type = "l", col = "red", xlab = "" ,ylab = "", ylim = c(0,40))
par(new = TRUE)
plot(dataf$Date_Time, dataf$Sub_metering_3, type = "l", col = "blue", xlab = "" ,ylab = "Energy sub metering", ylim = c(0,40))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), lty = c(1,1,1), col = c("black", "red","blue" ))
## P4
plot(dataf$Date_Time, dataf$Global_reactive_power, type = "l",xlab = "datetime")
dev.off()