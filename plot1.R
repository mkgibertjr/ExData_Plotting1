if(!file.exists("exdata_data_household_power_consumption.zip")){
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "exdata_data_household_power_consumption.zip", quiet = TRUE)}

if(!dir.exists("household_power_consumption.txt")){
  unzip("exdata_data_household_power_consumption.zip")
}

data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                 nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data2 <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
data2$Date <- as.Date(data2$Date, format="%d/%m/%Y")
hist(data2$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

