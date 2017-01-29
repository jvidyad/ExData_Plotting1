data_file = "data/household_power_consumption.zip"

target_file = "household_power_consumption.txt"

data <- read.table(unz(data_file, target_file), header=TRUE, sep=";",
 na.strings="?",
  stringsAsFactors=FALSE)

data <- subset(data, Date=="1/2/2007"|Date=="2/2/2007")

temp <- paste(data$Date, data$Time)

data$Date <- as.Date(data$Date, format="%d/%m/%Y")

data$Time <- strptime(temp, "%d/%m/%Y %H:%M:%S")

png("plot1.png")

hist(data$Global_active_power, xlab="Global Active Power (kilowatts)",
  col="red", main="Global Active Power")

dev.off()
