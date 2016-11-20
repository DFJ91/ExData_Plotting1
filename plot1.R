setwd("/Users/DavidFernandez/ExploratoryDataWeek1")

#Leo el archivo y lo guardo en una variable

datos<-read.table("/Users/DavidFernandez/ExploratoryDataWeek1/household_power_consumption.txt",
                  sep = ";",col.names = c("Date","Time","Global_active_Power","Global_reactive_power",
                "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),
                  na.strings = "?",stringsAsFactors = FALSE) 

datos<-datos[-1,]

datos_v2<-subset(datos,Date=="1/2/2007"| Date=="2/2/2007")

graphics.off()

hist(as.numeric(datos_v2$Global_active_Power),xlab = "Global Active Power (kilowatts)",col = "red",main = "Global Active Power")

par(fin=c(480,480))

dev.copy(png,file="plot1.png")

dev.off()

