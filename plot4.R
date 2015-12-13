plot4 <- function(directory = "~/coursera/exploratory/ExData_Plotting1") {
  # Download file
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "data.zip", method="curl")
  # Unzip file
  unzip("data.zip") 
  # Read file
  d <- read.csv("household_power_consumption.txt", sep=";", na.strings = "?")
  # Select data
  t <- d[d$Date=="1/2/2007" | d$Date=="2/2/2007",]
  # Convert to DateTime
  t$DateTime <- strptime(paste(t$Date, t$Time), "%d/%m/%Y %H:%M:%S")
  # Plot 4
  png(filename="plot4.png", width=480, height=480)
  # Set two rows two columns
  par(mfrow=c(2,2))
  # plot1
  plot(t$DateTime, t$Global_active_power, type='l', xlab='Date Time', ylab='Global Active Power (kilowatts)')
  # plot2
  plot(t$DateTime, t$Voltage, type='l', xlab='Date Time', ylab='Voltage')
  # plot3
  plot(t$DateTime, t$Sub_metering_1, col = 'black', type='l', xlab='Date Time', ylab='Energy sub metering')
  lines(t$DateTime, t$Sub_metering_2, col = 'red', type='l')
  lines(t$DateTime, t$Sub_metering_3, col = 'blue', type='l')
  legend('topright', legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col=c('black', 'red', 'blue'), lwd=1, box.lty=0)
  # plot4
  plot(t$DateTime, t$Global_reactive_power, type='l', xlab='Date Time', ylab='Global Reactive Power (kilowatts)')
  dev.off()
  # Set back to one row one column
  par(mfrow=c(1,1))
}