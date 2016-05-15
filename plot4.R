plot4 <- function(){
  dt <- read.table("household_power_consumption.txt",sep = ";",na.strings=c("?"),colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),header=TRUE)
  dt$Date <- as.Date(dt$Date,format = "%d/%m/%Y")
  dt$Time <- strptime(paste(dt$Date,dt$Time),format = "%Y-%m-%d %H:%M:%S")
  dt<-dt[dt$Date >= "2007-02-01" & dt$Date <= "2007-02-02",] 
  
  png("plot4.png")
   par(mfcol= c(2,2))
  #first
   plot(dt$Time,dt$Global_active_power,type = "l",ylab="Global Active Power",xlab = "")
  #second
   plot(dt$Time,dt$Voltage,type = "l",ylab="Volatage",xlab = "")
  #third
   plot(dt$Time,dt$Sub_metering_1,type = "l",ylab="Energy sub metering",xlab = "",col=1)
   lines(dt$Time,dt$Sub_metering_2,type="l",col = 2)
   lines(dt$Time,dt$Sub_metering_3,type="l",col = 3)
   legend("topright",legend=c("Sub Metering 1","Sub Metering 2","Sub Metering 3"),lwd = 1,col = c(1,2,3))
  #fourth todo
   plot(dt$Time,dt$Global_reactive_power,type = "l",ylab="Global Reactive Power",xlab = "")
  dev.off()
}