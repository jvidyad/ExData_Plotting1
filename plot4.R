data_file = "data/household_power_consumption.zip"

target_file = "household_power_consumption.txt"

data <- read.table(unz(data_file, target_file), header=TRUE, sep=";",
 na.strings="?",
  stringsAsFactors=FALSE)

data <- subset(data, Date=="1/2/2007"|Date=="2/2/2007")

temp <- paste(data$Date, data$Time)

data$Date <- as.Date(data$Date, format="%d/%m/%Y")

data$Time <- strptime(temp, "%d/%m/%Y %H:%M:%S")

png("plot4.png")

par(mfrow=c(2,2))

plot(data$Time, data$Global_active_power, type="n", xlab="",
   ylab="Global Active Power")

lines(data$Time, data$Global_active_power)

plot(data$Time, data$Voltage, type="n", xlab="datetime", ylab="Voltage")

lines(data$Time, data$Voltage)

dat1 <- data$Sub_metering_1
dat2 <- data$Sub_metering_2
dat3 <- data$Sub_metering_3

plot(data$Time, dat1, type="n", xlab="", ylab="Energy sub metering")

lines(data$Time, dat1)

lines(data$Time, dat2, col="red")

lines(data$Time, dat3, col="blue")

legend("topright", lty=par("lty"), col=c(par("col"), "red", "blue"),
     legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(data$Time, data$Global_reactive_power, type="n", xlab="datetime",
  ylab="Global_reactive_power")

lines(data$Time, data$Global_reactive_power)

dev.off()
