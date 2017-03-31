#read data 
powerdata <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", dec = ".")
#subset data
subset_data <-subset(powerdata, Date %in% c("1/2/2007", "2/2/2007"))
subset_data$Date <- as.Date(subset_data$Date, format = "%d/%m/%Y")
datetime <-paste(as.Date(subset_data$Date), subset_data$Time)
subset_data$Datetime <-as.POSIXct(datetime)
#create plot3
with (subset_data, {
        plot(Sub_metering_1 ~ Datetime, type="l", ylab="Energy sub metering", xlab ="")
        lines(Sub_metering_2 ~ Datetime, type="l", col = "red")
        lines(Sub_metering_3 ~ Datetime, type="l", col = "blue")
})
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))
#save file
dev.copy(png, file ="plot3.png", height =480, width =480)
dev.off()
