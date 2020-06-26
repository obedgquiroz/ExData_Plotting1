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

## PLOT1
png(filename = "plot1.png", width = 480, height = 480)
hist(dataf$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()