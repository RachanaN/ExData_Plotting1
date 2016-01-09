##Let us now read the data and subset it to match our requirements. The requirements 
##for the data only from 2007/2/1 to 2007/2/2
power_consumption <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

##check the names of the data set
names(power_consumption)
##subset the data to match the date requirements
graphs_data <- subset(power_consumption, power_consumption$Date == "1/2/2007" | power_consumption$Date == "2/2/2007")
## let us combine date and time 
graphs_data$DateTime <- strptime(paste(graphs_data$Date, graphs_data$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")

 ## create a png file
png("plot4.png", height = 480, width = 480)

## for the plots
par(mfrow = c(2, 2))

#first plot
plot(graphs_data$DateTime, graphs_data$Global_active_power, type = "l", xlab = " ", ylab = "Global Active Power (kilowatts)")

##second plot
plot(graphs_data$DateTime, graphs_data$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")

##third plot
plot(graphs_data$DateTime, graphs_data$Sub_metering_1, col = "black", type = "l", xlab = " ", ylab = "Energy Sub Metering ")
lines(graphs_data$DateTime, graphs_data$Sub_metering_2, col = "red", type = "l")
lines(graphs_data$DateTime, graphs_data$Sub_metering_3, col = "blue", type = "l")
legend("topright", col = c("black", "red", "blue"), c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty = 1)


## fourth plot
plot(graphs_data$DateTime, graphs_data$Global_reactive_power, xlab = "datetime", ylab = "Global_Reactive_Power", type = "l")


#turn of png device
dev.off()
