
## Loading the power consumption data constraining only for 1/2/2007 and 2/2/2007
library(sqldf)
MyConnection <- file("./household_power_consumption.txt")
household_power_consumption<-sqldf("select *,Date||' ' || time as time_stamp  from MyConnection where Date in ('1/2/2007', '2/2/2007')",file.format = list(header=T,sep=";"))
closeAllConnections()

## Saving the Trend line chart as a png file 

dev.copy(png,filename="./Assignments/plot2.png", width=480,height=480)



## Plot 2 - Trend Line chart to plot the Global Active Power against the datetime during the two days and giving a name to the x-axis label 

plot(household_power_consumption$Global_active_power~as.POSIXct(strptime(household_power_consumption$time_stamp, "%d/%m/%Y %H:%M:%S")),
     xlab=" ", ylab="Global Active Power (Kilowatts)",
     main=" ", type = "l")

dev.off()