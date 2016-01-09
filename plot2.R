##Download the data and save it in your working directory. The data is in a single 
##text file - household_power_consumption.txt

##Let us now read the data and subset it to match our requirements. The requirements 
##for the data only from 2007/2/1 to 2007/2/2
power_consumption <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

##check the names of the data set
names(power_consumption)
##subset the data to match the date requirements
graphs_data <- subset(power_consumption, power_consumption$Date == "1/2/2007" | power_consumption$Date == "2/2/2007")
## let us combine date and time 
graphs_data$DateTime <- strptime(paste(graphs_data$Date, graphs_data$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")
## to plot into a PNG file
## first open the png 
png("plot2.png", height = 480, width = 480)
## plot the graph
plot(graphs_data$DateTime, graphs_data$Global_active_power, xlab = " ", ylab = "Global Active Power (kilowatts)", type = "l")


## to turn png off
dev.off()