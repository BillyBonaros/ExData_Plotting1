library (tidyverse)
df<- read.table('../household_power_consumption.txt',sep=';',header = TRUE,na.strings="?")


df<-df%>%filter(as.character(Date)=='1/2/2007'|as.character(Date)=='2/2/2007')%>%
  mutate(Date=paste(as.character(Date),as.character(Time),sep=':'))%>%
  mutate(Date=as.POSIXct(strptime(Date,format="%d/%m/%Y:%H:%M:%S")))%>%mutate(weekday=format(Date, format = "%a"))



par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(df, {
  plot(Global_active_power~Date, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~Date, type="l", 
       ylab="Voltage (volt)", xlab="", cex=0.8)
  plot(Sub_metering_1~Date, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Date,col='Red')
  lines(Sub_metering_3~Date,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Date, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
})


dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()

