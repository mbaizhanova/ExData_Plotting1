## reading data into R
rawdata <- read.table("household_power_consumption.txt",header=TRUE,sep = ";")
## subsetting data so that we could analyze the observations from Feb 1 to Feb 2
energy <- rawdata[rawdata$Date %in% c("1/2/2007", "2/2/2007"), ]
## let's look at the summary of the data
## summary(energy)
## Date               Time           Global_active_power Global_reactive_power   
## Length:2880        Length:2880        Length:2880         Length:2880                
## Class :character   Class :character   Class :character    Class :character        
## Mode  :character   Mode  :character   Mode  :character    Mode  :character

## From this we see that the observations in the Global_active_power are of 
## character class. So now let's make them numeric.
GAP <- as.numeric(energy$Global_active_power)
## converting Date and Time variables
DT <- strptime(paste(energy$Date, energy$Time), "%d/%m/%Y %H:%M:%S")
## let's open a .png file graphic device with height and width of 480
png("plot_2.png", height = 480, width = 480)
## let's create a plot
plot(DT,GAP,type='l',xlab='',col='blue',ylab='Global Active Power (kilowatts)')
## closing the png file graphic device
dev.off()