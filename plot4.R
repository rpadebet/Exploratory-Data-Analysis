# Loading and Preparing Data
h_pow_df<-read.table("household_power_consumption.txt",
                     sep = ";",
                     stringsAsFactors = FALSE,
                     na.strings = "?",
                     header = TRUE)

# Subset for the 2 days we are interested in
h_pow_sub <- subset(h_pow_df,
                    as.Date(h_pow_df$Date,"%d/%m/%Y") >= as.Date("2007-02-01","%Y-%m-%d") 
                    &
                    as.Date(h_pow_df$Date,"%d/%m/%Y") <= as.Date("2007-02-02","%Y-%m-%d") )
# Create a new datetime column to plot against
h_pow_sub$DateTime <- paste(h_pow_sub$Date ,h_pow_sub$Time)
# Convert the date time column to POSIXlt class
h_pow_sub$DateTime<-strptime(h_pow_sub$DateTime,"%d/%m/%Y %H:%M:%S")

# Opening PNG File
png(filename = "plot4.png", width = 480, height = 480)

# Generate Plot 4
par(mfrow = c(2,2))
#plot 4_1
plot(x = h_pow_sub$DateTime,
     y = h_pow_sub$Global_active_power,
     type = "l",
     ylab = "Global Active Power",
     xlab = "")
#plot 4_2
plot(x = h_pow_sub$DateTime,
     y = h_pow_sub$Voltage,
     type = "l",
     ylab = "Voltage",
     xlab = "datetime")
#plot 4_3
plot(x = h_pow_sub$DateTime,
     y = h_pow_sub$Sub_metering_1,
     type = "l",
     ylab = "Energy sub metering",
     xlab = "",
     ylim = c(0,40),
     col = "black")
par(new = T)
plot(x = h_pow_sub$DateTime,
     y = h_pow_sub$Sub_metering_2,
     type = "l",
     ylab = "",
     xlab = "",
     ylim = c(0,40),
     col = "red",
     axes = F)
par(new = T)
plot(x = h_pow_sub$DateTime,
     y = h_pow_sub$Sub_metering_3,
     type = "l",
     ylab = "",
     xlab = "",
     ylim = c(0,40),
     col = "blue",
     axes = F)
par(new = T)
legend(x="topright",
       legend = c("sub_metering_1","sub_metering_2","sub_metering_3"),
       col = c("black","red","blue"),lty = "solid",bty = 'n')
par(new = F)
#plot 4_4
plot(x = h_pow_sub$DateTime,
     y = h_pow_sub$Global_reactive_power,
     type = "l",
     ylab = "Global_reactive_power",
     xlab = "datetime")


dev.off()
