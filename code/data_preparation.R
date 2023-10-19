# Data Preparation for Iris Classification

# Load necessary library
library(datasets)

# Load iris data
data(iris)

# Optionally save iris data to a CSV file if you wish to have a local copy. 
# This step isn't strictly necessary for the analysis because the iris dataset is built-in to R.
write.csv(iris, "data/iris_dataset.csv", row.names = FALSE)
