plot1 <- function(){
  dt <- read.table("household_power_consumption.txt",sep = ";",na.strings=c("?"),colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),header=TRUE)
  dt$Date <- as.Date(dt$Date,format = "%d/%m/%Y")
  dt$Time <- strptime(paste(dt$Date,dt$Time),format = "%Y-%m-%d %H:%M:%S")
  dt<-dt[dt$Date >= "2007-02-01" & dt$Date <= "2007-02-02",] 
  
  png("plot1.png")
  hist(dt$Global_active_power,xlab="Global Active Power (kilowatts)",main = "Global Active Power")
  dev.off()
}