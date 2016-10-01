
# How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

mvRIdx <- grep(pattern = "Road",SCC$EI.Sector,value = FALSE,fixed = TRUE)
mvMIdx <- grep(pattern = "Mobile",SCC$EI.Sector,value = FALSE,fixed = TRUE)
mvIdx <-intersect(mvRIdx,mvMIdx)
View(SCC[mvIdx,])
SCC_mv <- as.character(SCC[mvIdx,1])

# Subsetting the data
pm_balt_mv <- NEI[NEI$fips == "24510" & NEI$SCC %in% SCC_mv,]

# aggregating the data based on year
pm_balt_mv_year <- aggregate(Emissions ~ year,pm_balt_mv,sum)

# Opening PNG File
png(filename = "plot5.png", width = 720, height = 480)

# plotting
plot(pm_balt_mv_year$year,pm_balt_mv_year$Emissions, type = 'l',lwd=2, xlab = "Year", ylab = "Total Emissions", col= "green")
points(pm_balt_mv_year$year,pm_balt_mv_year$Emissions,pch=24,col="red")
title("Trend of Emissions from motor vehicle sources in Baltimore City ")

dev.off()