setwd("/Users/DavidFernandez/ExploratoryDataWeek1")

#Leo el archivo y lo guardo en una variable

datos<-read.table("/Users/DavidFernandez/ExploratoryDataWeek1/household_power_consumption.txt",
                  sep = ";",col.names = c("Date","Time","Global_active_Power","Global_reactive_power",
                                          "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),
                  na.strings = "?",stringsAsFactors = FALSE) 

datos<-datos[-1,]

datos_v2<-subset(datos,Date=="1/2/2007"| Date=="2/2/2007")

for (i in 1:nrow(datos_v2)){datos_v2[i,1]<-wday(dmy(datos_v2[i,1]))}

for (i in 1:nrow(datos_v2)){
        if (datos_v2[i,1] =="5") datos_v2[i,1]<-"Thurs"
            if (datos_v2[i,1]=="6") datos_v2[i,1]<-"Fri"
               if (i==nrow(datos_v2)) datos_v2[i,1]<-"Sat"
        }

graphics.off()

plot(datos_v2$Global_active_Power,ylab = "Global Active Power (kilowatts)",xlab = "Weekday",type="l",xaxt="n")

axis(side = 1, at= c(0,1500,2880), labels = c("Thu","Fri","Sat"))

par(fin=c(480,480))

dev.copy(png,file="plot2.png")

dev.off()
