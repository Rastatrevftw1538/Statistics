colleges <- read.csv("Colleges.csv", header=TRUE, sep=",")
head(colleges)

average <- mean(colleges$Tuition)
tu.median <- median(colleges$Tuition)

library(DescTools)

skewness <- Skew(colleges$Tuition,method = 2)

percentiles <- quantile(colleges$Tuition)

variance <- Var(colleges$Tuition)
  
std <- SD(colleges$Tuition)

fiveNumSum <- summary(colleges$Tuition)

boxplot(colleges$Tuition,main = "Box plot",ylab = "Tuition & Fees")

covariance <- Cov(colleges$Tuition,colleges$GraduateRate)

correlation <- Cor(colleges$Tuition,colleges$GraduateRate)
