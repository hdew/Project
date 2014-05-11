#path<-'/Volumes/Coursera/Exploratory Data Analysis 05052014/Projects/Project1'
#setwd(path)
proj.data<-read.table(file='household_power_consumption.txt',
                      header=T,sep=';',na.strings='?')
proj.data$Date<-as.Date(proj.data$Date,format='%d/%m/%Y')
data<-proj.data[proj.data$Date=='2007-02-01' | proj.data$Date=='2007-02-02',]
data$datetime<-strptime(paste(data$Date,data$Time),
                        format='%Y-%m-%d %H:%M:%S')

png(filename='plot4.png',width=480,height=480)
par(mfrow=c(2,2))

plot(x=data$datetime,y=data$Global_active_power,type='l',
     xlab='',ylab='Global Active Power (kilowatts)')

plot(x=data$datetime,y=data$Voltage,type='l',
     xlab='datetime',ylab='Voltage')


plot(x=data$datetime,y=data$Sub_metering_1,type='l',
     xlab='',ylab='Energy sub metering')
lines(x=data$datetime,y=data$Sub_metering_2,col='red')
lines(x=data$datetime,y=data$Sub_metering_3,col='blue')
legend('topright',lty=1,col=c('black','red','blue'),
       legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))


plot(x=data$datetime,y=data$Global_reactive_power,type='l',
     xlab='datetime',ylab='Global_rective_power')
dev.off()






