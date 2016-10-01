
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
png(filename = "plot1.png", width = 480, height = 480)

### Plot 1
hist(h_pow_sub$Global_active_power,
     col = "red",
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")


dev.off()




