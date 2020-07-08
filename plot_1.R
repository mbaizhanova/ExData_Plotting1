## The purpose of this assignment is to examine how household energy usage 
## varies over a 2-day period (the first 2 days) in the month of February, 2007.

## let's set the working directory for the assignment
## setwd("C:/Users/Madina/Desktop/datasciencecoursera/Exploratory Data Analysis/
##      Course Project 1")
## let's see the existing files
## list.files()
## [1] "Course Project 1"                "household_power_consumption.txt"
## reading data into R
rawdata <- read.table("household_power_consumption.txt",header=TRUE,sep = ";")
## subsetting data so that we could analyze the observations from Feb 1 to Feb 2
energy <- rawdata[rawdata$Date %in% c("1/2/2007", "2/2/2007"), ]
## let's look at the summary of the data
summary(energy)
## Date               Time           Global_active_power Global_reactive_power   
## Length:2880        Length:2880        Length:2880         Length:2880                
## Class :character   Class :character   Class :character    Class :character        
## Mode  :character   Mode  :character   Mode  :character    Mode  :character

## From this we see that the observations in the Global_active_power are of 
## character class. So now let's make them numeric.
GlobalActivePower <- as.numeric(energy$Global_active_power)
## let's open a .png file graphic device with height and width of 480
png("plot_1.png", height = 480, width = 480)
## let's create a histogram
hist(GlobalActivePower, main = "Global Active Power", xlab = 
             "Global Active Power (kilowatts)", col = "red")
## closing the png file graphic device
dev.off()