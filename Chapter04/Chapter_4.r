#Installing package
install.packages("ggplot2") 
library('ggplot2')
#Scattered Plots
library(readr)
options(repr.plot.width = 6, repr.plot.height = 6)
Iris <- read.csv('Iris.csv')
class(Iris)
[1] "data.frame"
View(Iris)
head(Iris)

summary(Iris)


ggplot(data=Iris,aes(x=SepalWidthCm, y=SepalLengthCm)) + geom_point() + theme_minimal()
ggplot(data=Iris,aes(x=SepalWidthCm, y=SepalLengthCm,color=Species)) + geom_point() + theme_minimal()
Creating histograms
hist(iris$Sepal.Width, freq=NULL, density=NULL, breaks=12,
xlab="Sepal Width", ylab="Frequency", main="Histogram of Sepal Width")

library(ggplot2)


histogram <- ggplot(data=iris, aes(x=Sepal.Width))
histogram + geom_histogram(binwidth=0.2, color="black", aes(fill=Species)) +
xlab("Sepal Width") + ylab("Frequency") + ggtitle("Histogram of Sepal Width")
library(ggplot2)


#Density Plots
ggplot(iris) +
geom_density(aes(x = Petal.Width, fill = Species), alpha=0.25)

#Probability Plots
p1 <- ggplot(data = Iris, aes(PetalWidthCm)) +
 stat_function(fun = dnorm, n = 101, args = list(mean = 0, sd = 1)) + ylab("") +
 scale_y_continuous(breaks = NULL)
 p1

p2 <- ggplot(data = Iris, aes(PetalWidthCm)) +
 stat_function(fun = pnorm, n = 101, args = list(mean = 0, sd = 1)) + ylab("") +
 scale_y_continuous(breaks = NULL)
p2

p4 <- ggplot(data = Iris, aes(PetalWidthCm)) +
 stat_function(fun = rnorm, n = 101, args = list(mean = 0, sd = 1)) + ylab("") +
 scale_y_continuous(breaks = NULL)
p4

#Box plots

ggplot(data=Iris,aes(x=Species, y=SepalLengthCm,color=Species)) + geom_boxplot() +theme_minimal()+
 theme(legend.position="none")

ggplot(data=Iris,aes(x=Species, y=SepalLengthCm,color=Species)) + geom_violin() +theme_minimal()+
 theme(legend.position="none")

#Residual Plots
ggplot(lm(Sepal.Length~Sepal.Width, data=iris)) + geom_point(aes(x=.fitted, y=.resid))


