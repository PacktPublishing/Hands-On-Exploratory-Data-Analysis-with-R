>#Installing package
>install.packages("ggplot2") 
> library('ggplot2')
>#Scattered Plots
> library(readr)
> Iris <- read.csv('Iris.csv')
> class(Iris)
[1] "data.frame"
> View(Iris)
> head(Iris)
Id SepalLengthCm SepalWidthCm PetalLengthCm PetalWidthCm Species

1 1 5.1 3.5 1.4 0.2 Iris-setosa
2 2 4.9 3.0 1.4 0.2 Iris-setosa
3 3 4.7 3.2 1.3 0.2 Iris-setosa
4 4 4.6 3.1 1.5 0.2 Iris-setosa
5 5 5.0 3.6 1.4 0.2 Iris-setosa
6 6 5.4 3.9 1.7 0.4 Iris-setosa
> summary(Iris)
Id SepalLengthCm SepalWidthCm PetalLengthCm PetalWidthCm
Min. : 1.00 Min. :4.300 Min. :2.000 Min. :1.000 Min. :0.100
1st Qu.: 38.25 1st Qu.:5.100 1st Qu.:2.800 1st Qu.:1.600 1st Qu.:0.300
Median : 75.50 Median :5.800 Median :3.000 Median :4.350 Median :1.300
Mean : 75.50 Mean :5.843 Mean :3.054 Mean :3.759 Mean :1.199
3rd Qu.:112.75 3rd Qu.:6.400 3rd Qu.:3.300 3rd Qu.:5.100 3rd Qu.:1.800
Max. :150.00 Max. :7.900 Max. :4.400 Max. :6.900 Max. :2.500
Species
Iris-setosa :50
Iris-versicolor:50
Iris-virginica :50

> ggplot(data=Iris,aes(x=SepalWidthCm, y=SepalLengthCm)) + geom_point() + theme_minimal()
> ggplot(data=Iris,aes(x=SepalWidthCm, y=SepalLengthCm,color=Species)) + geom_point() + theme_minimal()
>Creating histograms
> hist(iris$Sepal.Width, freq=NULL, density=NULL, breaks=12,
+ xlab="Sepal Width", ylab="Frequency", main="Histogram of Sepal Width")

> library(ggplot2)
Attaching package: 'ggplot2'
The following object is masked _by_ '.GlobalEnv':
mpg
Warning message:
package 'ggplot2' was built under R version 3.5.3

>histogram <- ggplot(data=iris, aes(x=Sepal.Width))
>histogram + geom_histogram(binwidth=0.2, color="black", aes(fill=Species)) +
+ xlab("Sepal Width") + ylab("Frequency") + ggtitle("Histogram of Sepal Width")
> library(ggplot2)
Attaching package: 'ggplot2'
The following object is masked _by_ '.GlobalEnv':
mpg
Warning message:
package 'ggplot2' was built under R version 3.5.3

>#Density Plots
>ggplot(iris) +
+ geom_density(aes(x = Petal.Width, fill = Species), alpha=0.25)

>#Probability Plots
p1 <- ggplot(data = Iris, aes(PetalWidthCm)) +
+ stat_function(fun = dnorm, n = 101, args = list(mean = 0, sd = 1)) + ylab("") +
+ scale_y_continuous(breaks = NULL)
> p1

> p2 <- ggplot(data = Iris, aes(PetalWidthCm)) +
+ stat_function(fun = pnorm, n = 101, args = list(mean = 0, sd = 1)) + ylab("") +
+ scale_y_continuous(breaks = NULL)
> p2

> p4 <- ggplot(data = Iris, aes(PetalWidthCm)) +
+ stat_function(fun = rnorm, n = 101, args = list(mean = 0, sd = 1)) + ylab("") +
+ scale_y_continuous(breaks = NULL)
> p4

>#Box plots

> ggplot(data=Iris,aes(x=Species, y=SepalLengthCm,color=Species)) + geom_boxplot() +theme_minimal()+
+ theme(legend.position="none")

> ggplot(data=Iris,aes(x=Species, y=SepalLengthCm,color=Species)) + geom_violin() +theme_minimal()+
+ theme(legend.position="none")

>#Residual Plots
>ggplot(lm(Sepal.Length~Sepal.Width, data=iris)) + geom_point(aes(x=.fitted, y=.resid))


