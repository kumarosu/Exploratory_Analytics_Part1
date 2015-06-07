
## Loading the power consumption data constraining only for 1/2/2007 and 2/2/2007
library(sqldf)
MyConnection <- file("./household_power_consumption.txt")
household_power_consumption<-sqldf("select *,Date||' ' || time as time_stamp  from MyConnection where Date in ('1/2/2007', '2/2/2007')",file.format = list(header=T,sep=";"))
closeAllConnections()

## Saving the Trend line chart as a png file 

dev.copy(png,filename="./Assignments/plot3.png", width=480,height=480)

## Plot 3 -  Trend Line charts to plot Sub_metering_1, Sub_metering_2 and Sub_metering_3 against the time stamp and giving a legend 
mar=c(1,1,1,1)
plot(household_power_consumption$Sub_metering_1~as.POSIXct(strptime(household_power_consumption$time_stamp, "%d/%m/%Y %H:%M:%S")),
     xlab=" ", ylab="Energy Submetering",
     main=" ", type = "l")
par(new=T)
lines(household_power_consumption$Sub_metering_2~as.POSIXct(strptime(household_power_consumption$time_stamp, "%d/%m/%Y %H:%M:%S")), 
      xlab=" ", ylab="Energy sub metering",
      main=" ", type = "l", col='red', axes=F)
par(new=T)
lines(household_power_consumption$Sub_metering_3~as.POSIXct(strptime(household_power_consumption$time_stamp, "%d/%m/%Y %H:%M:%S")), 
      xlab=" ", ylab="Energy Submetering",
      main=" ", type = "l", col='blue', axes=F)
legend("topright", col=c("black", "red", "blue"), legend=c("sub_metering_1", "sub_metering_2", "sub_metering_3"), lwd=2,
        cex=0.8)

dev.off()