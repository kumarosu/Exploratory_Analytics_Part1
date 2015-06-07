## Loading the power consumption data constraining only for 1/2/2007 and 2/2/2007

MyConnection <- file("./household_power_consumption.txt")
household_power_consumption<-sqldf("select *,Date||' ' || time as time_stamp  from MyConnection where Date in ('1/2/2007', '2/2/2007')",file.format = list(header=T,sep=";"))
closeAllConnections()

## Saving the Trend line chart as a png file 

dev.copy(png,filename="./Assignments/plot4.png")

## Plot 4 -  Plotting 4 charts one per quadrant 1. Global Active Power against the datetime 2.  Voltage against the datetime 
## 3. Trend Line charts to plot Sub_metering_1, Sub_metering_2 and Sub_metering_3 4. Global Reactive Power against the datetime

mar=c(1,1,1,1)
par(mfrow=c(2,2))

plot(household_power_consumption$Global_active_power~as.POSIXct(strptime(household_power_consumption$time_stamp, "%d/%m/%Y %H:%M:%S")),
     xlab=" ", ylab="Global Active Power",
     main=" ", type = "l", cex.lab=0.7)

plot(household_power_consumption$Voltage~as.POSIXct(strptime(household_power_consumption$time_stamp, "%d/%m/%Y %H:%M:%S")),
     xlab="datetime", ylab="Voltage",
     main=" ", type = "l")

plot(household_power_consumption$Sub_metering_1~as.POSIXct(strptime(household_power_consumption$time_stamp, "%d/%m/%Y %H:%M:%S")),
     xlab=" ", ylab="Energy Submetering",
     main=" ", type = "l")
lines(household_power_consumption$Sub_metering_2~as.POSIXct(strptime(household_power_consumption$time_stamp, "%d/%m/%Y %H:%M:%S")), 
     xlab=" ", ylab="Energy Submetering",
     main=" ", type = "l", col='red', axes=F)
lines(household_power_consumption$Sub_metering_3~as.POSIXct(strptime(household_power_consumption$time_stamp, "%d/%m/%Y %H:%M:%S")), 
      xlab=" ", ylab="Energy sub metering",
      main=" ", type = "l", col='blue', axes=F)
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=1,
       col=c("black", "red", "blue"), cex=0.35)


plot(household_power_consumption$Global_reactive_power~as.POSIXct(strptime(household_power_consumption$time_stamp, "%d/%m/%Y %H:%M:%S")),
     xlab="datetime", ylab="Global_reactive_power",
     main=" ", type = "l")

dev.off()

