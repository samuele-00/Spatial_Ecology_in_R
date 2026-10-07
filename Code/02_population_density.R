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
elevation <- bei.extra$elev
# output
elevation

# Plot elevation
plot(elevation)



