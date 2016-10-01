
# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (𝚏𝚒𝚙𝚜 == "𝟸𝟺𝟻𝟷𝟶") from 1999
# to 2008? Use the base plotting system to make a plot answering this question.

# Loading libra
NEI <- readRDS("summarySCC_PM25.rds")

# Subset the data to get Baltimore City data
pm_balt <- NEI[NEI$fips == "24510",]

# Aggregate total emissions across each year and name the columns
pm_balt_tot <- aggregate(pm_balt$Emissions, by = list(Year = pm_balt$year), FUN = sum )
names(pm_balt_tot)<- c("Year","Total.Emissions")

# Opening PNG File
png(filename = "plot2.png", width = 480, height = 480)

# plotting
plot(pm_balt_tot$Year,pm_balt_tot$Total.Emissions, type = 'l',lwd=2, xlab = "Year", ylab = "Total Emissions", col= "green")
points(pm_balt_tot$Year,pm_balt_tot$Total.Emissions,pch=24,col="red")
title("Trend of Total Emissions Baltimore City")

dev.off()