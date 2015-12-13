plot2 <- function(directory = "~/coursera/exploratory/ExData_Plotting1") {
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
  # Plot 2
  png(filename="plot2.png", width=480, height=480)
  plot(t$DateTime, t$Global_active_power, type='l', xlab='Date Time', ylab='Global Active Power (kilowatts)')
  dev.off()
}