colleges <- read.csv("Colleges.csv", header=TRUE, sep=",")
head(colleges)

average <- mean(colleges$Tuition)
tu.median <- median(colleges$Tuition)

library(DescTools)

skewness <- Skew(colleges$Tuition,method = 2)

percentiles <- quantile(colleges$Tuition)
