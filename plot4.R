#read in data
powerdata <- read.table("household_power_consumption.txt", 
                        header = TRUE, sep = ";", na.strings = "?", 
                        stringsAsFactors = FALSE)

#use only the data from February 1 and 2, 2007
hwpowerdata <- powerdata[powerdata$Date == "1/2/2007" | 
                           powerdata$Date == "2/2/2007",]


# add a column to the dataframe numbering the measurements in date/time order
id <- c(1:2880)
hw <- cbind(id,hwpowerdata)


#create and save plot 4: panel of plots

png(filename = "plot4.png", width = 480, height = 480)

par(mar=c(4,4,4,2), oma=c(0,0,0,0), mfrow=c(2,2))

#plot 1: Global active power
with(hw, plot(Global_active_power ~ id, type = "l",
              xaxt = "n", ylab="Global Active Power", 
              xlab=""))
axis(1, at=c(1,1441,2881), labels = c("Thu","Fri","Sat"))

#plot 2: Voltage
with(hw, plot(Voltage ~ id, type = "l",
              xaxt = "n", xlab = "datetime"))
axis(1, at=c(1,1441,2881), labels = c("Thu","Fri","Sat"))

#plot 3: Energy sub metering
with(hw, plot(1,1, type = "n", xlim=c(0,2880), ylim=c(0,40),
              xaxt = "n", yaxt="n", ylab="Energy sub metering", 
              xlab=""))
lines(hw$id, hw$Sub_metering_1)
lines(hw$id, hw$Sub_metering_2, col="red")
lines(hw$id, hw$Sub_metering_3, col="blue")
axis(1, at=c(1,1441,2881), labels = c("Thu","Fri","Sat"))
axis(2, at=c(0,10,20,30))
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"), lty=c(1,1,1), bty = "n")

#plot 4: Global reactive power
with(hw, plot(Global_reactive_power ~ id, type = "l",
              ylim = c(0,0.5),
              xaxt = "n", xlab = "datetime"))
axis(1, at=c(1,1441,2881), labels = c("Thu","Fri","Sat"))


dev.off()