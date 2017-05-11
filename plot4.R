NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(ggplot2)

png("plot4.png", width = 480, height = 480, units='px')

combRelated <- grepl("comb", SCC$SCC.Level.One, ignore.case = TRUE)
coalRelated <- grepl("coal", SCC$SCC.Level.Four, ignore.case = TRUE) 
coalComb <- (combRelated & coalRelated)
combSCC <- SCC[coalComb,]$SCC
combNEI <- NEI[NEI$SCC %in% combSCC,]

ggplot(combNEI, aes(factor(year),Emissions/10^5)) +
  geom_bar(stat = "identity",fill = "grey", width = 0.5) +
  theme_bw() +  guides(fill = FALSE) +
  labs(x = "year", y = expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
  labs(title = expression("PM"[2.5]*"CCS Emissions Across US from 1999-2008"))


dev.off()
