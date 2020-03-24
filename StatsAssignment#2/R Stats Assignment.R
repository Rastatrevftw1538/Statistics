numbers <- c(10,20,30,40,50)
numbers

strings <- c('ten','twenty','thirty','forty','fifty')
strings

logical <- c(TRUE,FALSE,TRUE,FALSE,TRUE)
logical

mydata <- data.frame(numbers,strings,logical)
mydata

mydata[2]

mydata[1:4,]

mydata[5,2]

c(mydata[c(3)])

str(mydata)

networks <- read.csv('2012Networks.CSV',header = TRUE,sep = ',')
networks

str(networks)

freq.networks <- table(networks)
freq.networks


percent.freq.networks <- prop.table(freq.networks)*100
prop
percent.freq.networks

barplot(percent.freq.networks,main = "Bar chart of TV networks", col = '#00bd00', xlab = 'Network', ylab = 'Frequency')
