# Once we have seen how species are related to each other in space we can proceed to lok at how they are related to each other in time

#install.packages("overlap")
library(overlap)

# Using the dataset
data(kerinci)

kerinci
head(kerinci)

# If you want to look the end of the dataset: tail(kerinci)
tail(kerinci)

# Getting summary of the dataset
summary(kerinci)

install.packages("igraph") #for the next lesson
