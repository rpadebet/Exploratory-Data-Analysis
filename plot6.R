
# Compare emissions from motor vehicle sources in Baltimore City 
# with emissions from motor vehicle sources in Los Angeles County, California (𝚏𝚒𝚙𝚜 == "𝟶𝟼𝟶𝟹𝟽"). Which
# city has seen greater changes over time in motor vehicle emissions?

# Loading libraries
library(ggplot2)

# Load the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Creating index of relevant sources from SCC
mvRIdx <- grep(pattern = "Road",SCC$EI.Sector,value = FALSE,fixed = TRUE)
mvMIdx <- grep(pattern = "Mobile",SCC$EI.Sector,value = FALSE,fixed = TRUE)
mvIdx <-intersect(mvRIdx,mvMIdx)

SCC_mv <- as.character(SCC[mvIdx,1])

# Subsetting the data
pm_bc_la_mv <- NEI[(NEI$fips %in% c("24510","06037")) & (NEI$SCC %in% SCC_mv),]

# aggregating the data based on year
pm_bcla_mv_year <- aggregate(Emissions ~ year+fips,pm_bc_la_mv,sum)

# Adding county column to be used in plot
city <-data.frame(fips = c("24510","06037"),county = c("Baltimore City","Los Angeles County"))
pm_bcla_mv <- merge(pm_bcla_mv_year,city, by = "fips" )

# Generating the plot
g <- ggplot(pm_bcla_mv)+
    geom_line(aes(x= year, y=Emissions, col = county),size =2) +
    geom_point(aes(x= year, y=Emissions),color = "red",fill = "blue", shape = 24, size =4) +
    labs(title = "Emissions trend in Baltimore City vs LosAngeles", x = "Year", y="Total Motor Vehicle Emissions")

# Opening PNG File and printing the plot
png(filename = "plot6.png", width = 480, height = 480)
print(g)
dev.off()

