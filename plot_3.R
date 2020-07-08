## reading data into R
rawdata <- read.table("household_power_consumption.txt",header=TRUE,sep = ";")
## subsetting data so that we could analyze the observations from Feb 1 to Feb 2
energy <- rawdata[rawdata$Date %in% c("1/2/2007", "2/2/2007"), ]
## converting Date and Time variables
DT <- strptime(paste(energy$Date, energy$Time), "%d/%m/%Y %H:%M:%S")
## making the Sub Metering data numeric instead of character class
SubMetering1 <- as.numeric(energy$Sub_metering_1)
SubMetering2 <- as.numeric(energy$Sub_metering_2)
SubMetering3 <- as.numeric(energy$Sub_metering_3)
## let's open a .png file graphic device with height and width of 480
png("plot_3.png", height = 480, width = 480)
## let's create a plot
plot(DT,SubMetering1,xlab="",ylab ="Energy Sub Metering",type="l",col="blue")
lines(DT, SubMetering2, type = "l", col = "red")
lines(DT, SubMetering3, type = "l", col = "green")
## adding legend
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty = 1,lwd=2,col=c("blue","red","green"))
## closing the png file graphic device
dev.off()