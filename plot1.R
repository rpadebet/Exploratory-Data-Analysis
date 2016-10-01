
# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission 
# from all sources for each of the years 1999, 2002, 2005, and 2008.


# Load the data
NEI <- readRDS("summarySCC_PM25.rds")

# Aggregate total emissions across each year and name the columns
pm_tot <- aggregate(NEI$Emissions, by = list(Year = NEI$year), FUN = sum )
names(pm_tot)<- c("Year","Total.Emissions")

# Opening PNG File
png(filename = "plot1.png", width = 480, height = 480)

# Generating the plot
plot(pm_tot$Year,pm_tot$Total.Emissions, type = 'l',lwd=2, xlab = "Year", ylab = "Total Emissions", col= "green")
points(pm_tot$Year,pm_tot$Total.Emissions,pch=24,col="red")
title("Trend of Total Emissions")

dev.off()
