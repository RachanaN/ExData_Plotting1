##Download the data and save it in your working directory. The data is in a single 
##text file - household_power_consumption.txt

##Let us now read the data and subset it to match our requirements. The requirements 
##for the data only from 2007/2/1 to 2007/2/2
power_consumption <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

##check the names of the data set
names(power_consumption)
##subset the data to match the date requirements
graphs_data <- subset(power_consumption, power_consumption$Date == "1/2/2007" | power_consumption$Date == "2/2/2007")

## construct the plot and save it to a PNG file with a width of 480 pixels and height of 480 pixels
png("plot1.png", width = 480, height = 480)
hist(graphs_data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power(kilowatts)")

## to turn the extension to png off
dev.off()