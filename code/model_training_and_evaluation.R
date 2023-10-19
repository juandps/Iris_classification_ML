# Model Training and Evaluation for Iris Classification

# Load necessary libraries
library(caret)
library(randomForest)

# If you saved the iris dataset locally using the data_preparation.R script, you can read it.
# Otherwise, you can simply use the built-in iris dataset in R.
# iris <- read.csv("data/iris_dataset.csv")

# Split data into training and test sets
set.seed(123)  # Setting a seed for reproducibility
trainIndex <- createDataPartition(iris$Species, p = 0.7, list = FALSE)
irisTrain <- iris[trainIndex, ]
irisTest <- iris[-trainIndex, ]

# Train the Random Forest model
ctrl <- trainControl(method = "cv", number = 5)
set.seed(123)
rfModel <- train(Species ~ ., data = irisTrain, method = "rf", trControl = ctrl)

# Save model summary to a file (if needed)
# capture.output(print(rfModel), file = "results/model_output.txt")

# Predictions and Evaluation
predictions <- predict(rfModel, newdata = irisTest)
confMatrix <- confusionMatrix(predictions, irisTest$Species)

# Save confusion matrix to the same file (if needed)
# capture.output(print(confMatrix), append = TRUE, file = "results/model_output.txt")

# Print results to the console (for interactive sessions)
print(rfModel)
print(confMatrix)
