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



#create and save plot 2: Global active power, line graph

png(filename = "plot2.png", width = 480, height = 480)

par(mar=c(2,4,2,2), oma=c(1,1,0,1))
with(hw, plot(Global_active_power ~ series, type = "l",
              xaxt = "n", ylab="Global Active Power (kilowatts)", 
              cex.lab = .9, xlab=""))
axis(1, at=c(1,1441,2881), labels = c("Thu","Fri","Sat"), cex.axis = .75)

dev.off()