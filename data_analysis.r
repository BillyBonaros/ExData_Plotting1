library (tidyverse)

df<- read.table('../household_power_consumption.txt',sep=';',header = TRUE)


head(df)
sapply(df,class)



df<-df%>%mutate(Date=as.Date(Date,format="%d/%m/%Y"))%>%filter(Date=='2007-02-01'|Date=='2007-02-02')



ggplot(df,aes(y='Global_active_power'))+




colnames(df)
