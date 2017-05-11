NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(ggplot2)

png("plot5.png", width = 480, height = 480, units='px')

vehicle <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case = TRUE)
SCC_vehicle <- SCC[vehicles,]$SCC
NEI_vehicle <- NEI[NEI$SCC %in% SCC_vehicle,]

NEI_vehicle_Baltimore <- NEI_vehicle[NEI_vehicle$fips == 24510,]

ggplot(NEI_vehicle_Baltimore, aes(factor(year),Emissions)) +
  geom_bar(stat="identity",fill = "grey", width = 0.5) +
  theme_bw() +  guides(fill = FALSE) +
  labs(x = "year", y = expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
  labs(title = expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore from 1999-2008"))


dev.off()
