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

#changin names to the stack
names(stackNIR) <- c("original","mean3x3","mean7x7","mean13x13")
stackNIR #check names
plot(stackNIR, col=mako(100))

#plotting two sets in a scatterplot
plot(stackNIR[[2]],stackNIR[[4]], col="gray")
abline(0,1,col="red") #y=x
plot(stackNIR$mean_3,stackNIR$mean_13)

# exercise: given the statistical function sd, calculate the sd of the NIR with a moving window of 3x3
# sd 3x3
# sd <- focal(sent[[1]],w=3, fun="sd") # avoid this ! otherwise you will overwrite the function
sdNIR <- focal(sent[[1]],w=3, fun="sd")
stacksd <- c(sent[[1]], sdNIR)
plot(stacksd, col=cividis(100))
plot(stacksd)

# exercise: calculate the sd for:
#7x7 pixels
#13x13 pixels
# and make a stack of all of the data: original,3x3,7x7,13x13
# rename the inner layers of the stack

sdNIR7x7 <- focal(sent[[1]],w=7, fun="sd")
sdNIR13x13 <- focal(sent[[1]],w=13, fun="sd")
stacksd <- c(sent[[1]], sdNIR, sdNIR7x7, sdNIR13x13)
stacksd

names(stacksd) <- c("original","sd3x3","sd7x7","sd13x13")
stacksd

plot(stacksd, col=plasma(100))

# measuring the variability of the whole original image

sentsd <- focal(sent,w=7, fun="sd")
# layer 1 # NIR
# layer 2 # red
# layer 3 # green

# the output images has 3 layers:
# hypothesis: terra is calculating sd on every single layer
# test: plotting the NIR sd vs the sd of the first layer of sent
teststack <- c(sdNIR7x7, sentsd[[1]])
plot(teststack)

#scatterplot
plot(sdNIR7x7,sentsd[[1]])
cor(sdNIR7x7,sentsd[[1]]) # the correlation could be done among vectors

# the correlation could be done among vectors
x<-values(sdNIR7x7)
y<-values(sdNIR7x7)
cor(x,y)
