NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

png("plot2.png", width = 480, height = 480, units='px')

NEI_Baltimore <- NEI[NEI$fips=="24510",]
totalsBaltimore <- aggregate(Emissions ~ year, NEI_Baltimore,sum)

barplot(
  totalsBaltimore$Emissions,
  names.arg = totalsBaltimore$year,
  xlab = "Year",
  ylab = "PM2.5 Emissions (Tons)",
  main = "Total PM2.5 Emissions From All Baltimore City Sources"
)

dev.off()
