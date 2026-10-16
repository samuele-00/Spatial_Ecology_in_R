# Code for performing multivariate analisys with community data

# The vegan package will be used for the multivariate part
library(vegan)

# Using the data inside vegan
data(dune)

# Looking inside the dataset
dune # whole dataset

# Looking at few rows
head(dune)

# Principal Component Analisys with vegan
multipca <- pca(dune)
multipca

# Principal Component Analisys without vegan
multivar <- prcomp(dune)
multivar

# Looking at the percentage of variance explained by each Principal Component
summary(multipca)

# How much variability is explained by the first two component?
# proportion of PC1: 0.2947
# percentage of explained variability by PC1: 29.47%

# Exercise: calculate the percentage of explained variability by PC2: 21.57%

# Exercise: we are going to make a graph with just two dimensions over the 20 original dimensions, what is the total variability explained by PC1 + PC2?
# Total explained variability
totvar = 29.47+ 21.57
totvar #51.04

# Make the final plot
plot(multipca)
