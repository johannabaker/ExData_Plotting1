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


#create and save plot 3: Energy sub metering, line graph

png(filename = "plot3.png", width = 480, height = 480)

par(mar=c(2,4,2,2), oma=c(1,1,1,1))
with(hw, plot(1,1, type = "n", xlim=c(0,2880), ylim=c(0,40),
              xaxt = "n", yaxt="n", ylab="Energy sub metering", 
              cex.lab = .9, xlab=""))
lines(hw$id, hw$Sub_metering_1)
lines(hw$id, hw$Sub_metering_2, col="red")
lines(hw$id, hw$Sub_metering_3, col="blue")
axis(1, at=c(1,1441,2881), labels = c("Thu","Fri","Sat"), cex.axis = .75)
axis(2, at=c(0,10,20,30))
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"), cex=.9, lty=c(1,1,1))

dev.off()