
# Of the four types of sources indicated by the 𝚝𝚢𝚙𝚎 (point, nonpoint, onroad, nonroad) variable,
# which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
# Which have seen increases in emissions from 1999–2008? 
# Use the ggplot2 plotting system to make a plot answer this question.

library(ggplot2)

# Subsetting the data
pm_balt <- NEI[NEI$fips == "24510",]

# Splitting and aggregating the data
pm_balt_source_year <- aggregate(Emissions ~ type+year,pm_balt,sum)

# Creating GGplot

g <- ggplot(pm_balt_source_year)+
    geom_line(aes(x= year, y=Emissions, col = type),size =2) +
    geom_point(aes(x= year, y=Emissions),color = "red",fill = "blue", shape = 24, size =4) +
    labs(title = "Emissions trend in Baltimore City by type", x = "Year", y="Total Emissions")

# Opening PNG File and printing the plot
png(filename = "plot3.png", width = 480, height = 480)
print(g)
dev.off()
