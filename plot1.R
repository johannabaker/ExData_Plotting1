

#read in data
powerdata <- read.table("household_power_consumption.txt", 
                        header = TRUE, sep = ";", na.strings = "?", 
                        stringsAsFactors = FALSE)

#use only the data from February 1 and 2, 2007
hwpowerdata <- powerdata[powerdata$Date == "1/2/2007" | 
                           powerdata$Date == "2/2/2007",]


#create plot 1: Global active power

png(filename = "plot1.png", width = 480, height = 480)
hist(hwpowerdata$Global_active_power, main="Global Active Power", col="red",
     xlim=c(0,6), xlab="Global Active Power (kilowatts)", xaxt="n")
axis(1,at=c(0,2,4,6))
dev.off()

