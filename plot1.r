library (tidyverse)
df<- read.table('../household_power_consumption.txt',sep=';',header = TRUE,na.strings="?")
head(df)
sapply(df,class)

#plot1
df<-df%>%mutate(Date=as.character(Date))%>%filter(Date=='1/2/2007'|Date=='2/2/2007')

hist(x=df$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()



