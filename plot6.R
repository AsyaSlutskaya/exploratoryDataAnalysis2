NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
library(ggplot2)

png("plot6.png", width = 480, height = 480, units='px')

NEI_vehicle <- NEI[NEI$SCC %in% SCC_vehicle,]
NEI_vehicle_Baltimore <- NEI_vehicle[NEI_vehicle$fips == 24510,]
NEI_vehicle_Baltimore$city <- "Baltimore City"
LANEI_vehicle <- NEI_vehicle[NEI_vehicle$fips=="06037",]
LANEI_vehicle$city <- "Los Angeles County"
NEI_both <- rbind(NEI_vehicle_Baltimore, LANEI_vehicle)

ggplot(NEI_both, aes(x = factor(year), y = Emissions, fill = city)) +
  geom_bar(aes(fill = year), stat = "identity") +
  facet_grid(scales = "free", space = "free", .~city) +
  guides(fill = FALSE) + theme_bw() +
  labs(x = "year", y = expression("Total PM"[2.5]*" Emission (Kilo-Tons)")) + 
  labs(title = expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore & LA, 1999-2008"))

dev.off()
