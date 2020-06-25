df <- readRDS("Data/summarySCC_PM25.rds")
dfsource <- readRDS("Data/Source_Classification_Code.rds")
sub <- subset(dfsource, dfsource$EI.Sector== c("Fuel Comb - Electric Generation - Coal", "Fuel Comb - Industrial Boilers, ICEs - Coal", "Fuel Comb - Comm/Institutional - Coal"))
sccneed <- sub[,1]
sccneed <- as.character(sccneed)
subM <- subset(df, df$SCC %in% sccneed)
Mean<- tapply(subM$Emissions, subM$year, mean, na.rm=TRUE)
subM$year <- as.Date(subM$year, format= "%Y", origin="1970-01-01")
plot(unique(subM$year),Mean, type= "b", main= "Mean Emission over Time Due to Coal combustion", pch= 19, col= "purple", xlab= "Year")