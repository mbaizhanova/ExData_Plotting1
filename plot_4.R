## reading data into R
rawdata <- read.table("household_power_consumption.txt",header=TRUE,sep = ";")
## subsetting the needed data
energy <- rawdata[rawdata$Date %in% c("1/2/2007", "2/2/2007"), ]
## making the data to be of numeric class
GAP <- as.numeric(energy$Global_active_power)
## converting the Date and Time variables
DT <- strptime(paste(energy$Date, energy$Time), "%d/%m/%Y %H:%M:%S")
## making the data to be of numeric class
SubMetering1 <- as.numeric(energy$Sub_metering_1)
SubMetering2 <- as.numeric(energy$Sub_metering_2)
SubMetering3 <- as.numeric(energy$Sub_metering_3)
Voltage <- as.numeric(energy$Voltage)
GRP <- as.numeric(energy$Global_reactive_power)
## creating a png file graphic device of height and width of 480
png("plot_4.png", height = 480, width = 480)
## specifying that we need 4 plots on one canvas (2 rows and 2 columns)
par(mfrow = c(2, 2))
## plotting the topleft plot
plot(DT, GAP, xlab = "", ylab = "Global Active Power", col = "blue", type = "l")
## plotting the topright plot
plot(DT, Voltage, xlab = "datetime", ylab = "Voltage", col = "black",type = "l")
## plotting the bottomleft plot
plot(DT, SubMetering1,xlab="",ylab="Energy Sub Metering",col="blue",type="l")
lines(DT, SubMetering2, type = "l", col = "red")
lines(DT, SubMetering3, type = "l", col = "green")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty = 1,lwd=2,col=c("blue","red","green"))
## plotting the bottomright plot
plot(DT,GRP,xlab="datetime",ylab="Global Reactive Power",col="black",type="l")
## closing the file graphic device
dev.off()