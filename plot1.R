#Generate Plot1
powerdata <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", dec = ".")
#subset data
subset_data <-subset(powerdata, Date %in% c("1/2/2007", "2/2/2007"))
subset_data$Date <- as.Date(subset_data$Date, format = "%d/%m/%Y")
#create histogram
hist(subset_data$Global_active_power, main=" Global Active Power", col="red", xlab="Global Active Power(kilowatts)")
#save file
dev.copy(png, file ="plot1.png", height =480, width =480)
dev.off()

