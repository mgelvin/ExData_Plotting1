temp<-tempfile()
download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip',temp,'curl')
data<-read.csv2(unz(temp,'household_power_consumption.txt'),na.strings='?',stringsAsFactor=F)
unlink(temp,recursive=T)
data<-data[data$Date=='1/2/2007'|data$Date=='2/2/2007',]
data$Date_Time=paste(data$Date,data$Time,sep=' ')
data$Date_Time<-strptime(data$Date_Time,format='%d/%m/%Y %H:%M:%S')


png(filename='plot3.png')
plot(data$Date_Time,data$Sub_metering_1,'l',xlab='',ylab='Energy sub metering')
lines(data$Date_Time,data$Sub_metering_2,'l',col='red')
lines(data$Date_Time,data$Sub_metering_3,'l',col='blue')
legend('topright',col=c('black','red','blue'),legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),lty=c(1,1,1))
dev.off()

