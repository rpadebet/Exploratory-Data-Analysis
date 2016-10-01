
# Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

# Load the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Creating the relevant index for Coal sources
coalIdx <- grep(pattern = "Coal",SCC$EI.Sector,value = FALSE,fixed = TRUE)
SCC_coal <- as.character(SCC[coalIdx,1 ])

# subsetting NEI data based on Coal sources
pm_coal <- NEI[NEI$SCC %in% SCC_coal,]

# aggregating the data based on year
pm_coal_year <- aggregate(Emissions ~ year,pm_coal,sum)

# Opening PNG File
png(filename = "plot4.png", width = 480, height = 480)

# plotting
plot(pm_coal_year$year,pm_coal_year$Emissions, type = 'l',lwd=2, xlab = "Year", ylab = "Total Emissions", col= "green")
points(pm_coal_year$year,pm_coal_year$Emissions,pch=24,col="red")
title("Trend of Emissions from coal related sources")

dev.off()

