setwd("/Users/DavidFernandez/ExploratoryDataWeek1")

#Leo el archivo y lo guardo en una variable

datos<-read.table("/Users/DavidFernandez/ExploratoryDataWeek1/household_power_consumption.txt",
                  sep = ";",col.names = c("Date","Time","Global_active_Power","Global_reactive_power",
                                          "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),
                  na.strings = "?",stringsAsFactors = FALSE) 

datos<-datos[-1,]

datos_v2<-subset(datos,Date=="1/2/2007"| Date=="2/2/2007")

graphics.off()

plot(datos_v2$Sub_metering_1,ylab = "Energy sub metering",xlab = "Weekday",type="l",xaxt="n")

axis(side = 1, at= c(0,1500,2880), labels = c("Thu","Fri","Sat"))

lines(datos_v2$Sub_metering_2,col="red")

lines(datos_v2$Sub_metering_3,col="blue")

legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty = 1,col = c("black","red","blue"),cex = 0.50)

par(fin=c(480,480))

dev.copy(png,file="plot3.png")

dev.off()
