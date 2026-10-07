# R code for population density

# Installing packages
install.packages("spatstat")

# Using packages
library(spatstat)

# Recall the data
bei

# Looking at the points in space
plot(bei)

# changing character
plot(bei, pch=15)

# decrease dimension
plot(bei, pch=15, cex=.5)

# Drivers
bei.extra

# Plotting variables
plot(bei.extra)

# subsetting a datasets: NEX CONCEPT!
# There are two different methods to make a subset:
# first: name of the variable and the $ symbol
# second: number of the layer and [] for tables, [[]]for map layers
elevation <- bei.extra$elev
# output
elevation

# Plot elevation
plot(elevation)

# subset by the number of the layer/variables
elevation2 <- bei.extra[[1]]
# in case bei.extra was a table: bei.extra[1]

# plot the new object
plot(elevation2)

# Creating our first map!
densitymap <- density(bei)

# Output
densitymap

# plot the result
plot(densitymap)

# Plotting the points on top of densitymap
points(bei, cex=.5)

# New concept: MULTIFRAME!
# creating the multiframe
par(mfrow=c(1,2))
plot(elevation)
plot(densitymap)

# Exercise: put the elevation map ontop of the densitymap
par(mfrow=c(2,1))
plot(elevation)
plot(densitymap)

# if you have any graphical issue use here is your  friend:
dev.off()
