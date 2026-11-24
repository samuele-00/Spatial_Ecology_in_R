# Code to estimare spatial variability of an image

library(terra)
library(imageRy)
library(viridis)

# Listing the different avalaibles sets in imageRy
im.list()

# Importing the data
sent<- im.import("sentinel.png")

# layer 1 # NIR
# layer 2 # red
# layer 3 # green

#Exercise: plot in RGB the image putting NIR ontop of the green component
# imageRy::im.plotRGB()
#?im.plotRGB()
im.plotRGB(sent,2,1,3 )

#exercise: make the same plot with the terra::plotRGB function
plotRGB(sent,2,1,3, stretch="lin")

#Measuring the mean: univariate statistics
meanNIR <- focal(sent[[1]],w=3, fun="mean")
plot(meanNIR)

#Exercise: plot the original infrared band beside the meanNIR
im.multiframe(1,2)
plot(sent[[1]])
plot(meanNIR)

# another manner to do that:
stackNIR <- c(sent[[1]], meanNIR)

# exercise: calculate the mean of the NIR with a moving window of 7x7 pixels
mean7x7NIR <- focal(sent[[1]],w=7, fun="mean")

# exercise: plot the images altogheter making a stack
stackNIR <- c(sent[[1]], meanNIR, mean7x7NIR)
plot(stackNIR)

# exercise: make the 13x13 mean, put in the stack and plot the stack with the inferno legend
mean13x13NIR <- focal(sent[[1]],w=13, fun="mean")
stackNIR <- c(sent[[1]], meanNIR, mean7x7NIR, mean13x13NIR)
plot(stackNIR, col=inferno(100))
