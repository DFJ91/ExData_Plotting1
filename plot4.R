setwd("/Users/DavidFernandez/ExploratoryDataWeek1")

#Leo el archivo y lo guardo en una variable

datos<-read.table("/Users/DavidFernandez/ExploratoryDataWeek1/household_power_consumption.txt",
                  sep = ";",col.names = c("Date","Time","Global_active_Power","Global_reactive_power",
                                          "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),
                  na.strings = "?",stringsAsFactors = FALSE) 

datos<-datos[-1,]

datos_v2<-subset(datos,Date=="1/2/2007"| Date=="2/2/2007")

graphics.off()

par(mfcol=c(2,2))

with(datos_v2,{

        plot(Global_active_Power,ylab = "Global Active Power (kilowatts)",xlab = "datetime",type="l",xaxt="n")
        
        axis(side = 1, at= c(0,1500,2880), labels = c("Thu","Fri","Sat"))
        
        plot(Sub_metering_1,ylab = "Energy sub metering",xlab = "datetime",type="l",xaxt="n")
        
        lines(datos_v2$Sub_metering_2,col="red")
        
        lines(datos_v2$Sub_metering_3,col="blue")
        
        legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
               lty = 1,col = c("black","red","blue"),cex = 0.4,bty = "n",y.intersp = 0.1,yjust = 0.8 )
        
        axis(side = 1, at= c(0,1500,2880), labels = c("Thu","Fri","Sat"))
        
        plot(Voltage,ylab = "Voltage",xlab = "datetime",type="l",xaxt="n")
        
        axis(side = 1, at= c(0,1500,2880), labels = c("Thu","Fri","Sat"))
        
        plot(Global_reactive_power,ylab = "Global_reactive_power",xlab = "datetime",type="l",xaxt="n")
        
        axis(side = 1, at= c(0,1500,2880), labels = c("Thu","Fri","Sat"))
}
)




par(fin=c(480,480))

dev.copy(png,file="plot4.png")

dev.off()