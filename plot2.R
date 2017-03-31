#read data
powerdata <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", dec = ".")
#subset data
subset_data <-subset(powerdata, Date %in% c("1/2/2007", "2/2/2007"))
subset_data$Date <- as.Date(subset_data$Date, format = "%d/%m/%Y")
datetime <-paste(as.Date(subset_data$Date), subset_data$Time)
subset_data$Datetime <-as.POSIXct(datetime)
#create plot2
with(subset_data, {
        plot(Global_active_power~ Datetime, type ="l", ylab="Global Active Power(kilowatts)", xlab=" ")
})
#save file
dev.copy(png, file ="plot2.png", height =480, width =480)
dev.off()
