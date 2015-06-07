

## Loading the power consumption data constraining only for 1/2/2007 and 2/2/2007
library(sqldf)
MyConnection <- file("./household_power_consumption.txt")
household_power_consumption<-sqldf("select *,Date||' ' || time as time_stamp  from MyConnection where Date in ('1/2/2007', '2/2/2007')",file.format = list(header=T,sep=";"))
closeAllConnections()

## Saving the Histogram as a png file 

dev.copy(png,filename="./Assignments/plot1.png", width=480,height=480)

## Plot 1 - Historgram to show the frequency of Global Active Power during the two days 

hist(household_power_consumption$Global_active_power, col="red", main="Global Active Power",xlab="Global Active Power (Kilowatts)")

## Giving a title to the Histogram 

title("Global Active Power")


dev.off()
