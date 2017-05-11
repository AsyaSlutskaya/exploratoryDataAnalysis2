NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

png("plot1.png", width = 480, height = 480, units='px')

totalPM25 <- aggregate(Emissions ~ year,NEI, sum)

barplot(
  (totalPM25$Emissions)/10^6,
  names.arg = totalPM25$year,
  xlab = "Year",
  ylab = "PM2.5 Emissions (10^6 Tons)",
  main = "Total PM2.5 Emissions From All US Sources"
)

dev.off()
