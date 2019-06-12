library (tidyverse)
df<- read.table('../household_power_consumption.txt',sep=';',header = TRUE,na.strings="?")


df<-df%>%filter(as.character(Date)=='1/2/2007'|as.character(Date)=='2/2/2007')%>%
  mutate(Date=paste(as.character(Date),as.character(Time),sep=':'))%>%
  mutate(Date=as.POSIXct(strptime(Date,format="%d/%m/%Y:%H:%M:%S")))%>%mutate(weekday=format(Date, format = "%a"))





plot(x = df$Date, y = df$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(x = df$Date, y = df$Sub_metering_2,col="red")
lines(x = df$Date, y = df$Sub_metering_3,col="blue")





dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()


