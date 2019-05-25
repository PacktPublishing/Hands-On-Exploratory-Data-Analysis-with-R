#Reading the dataset
library(pls)
data(longley)

View(longley)

str(longley)

library(dplyr)
library(tidyr)

summary(longley)

 
 head(longley)

tail(longley)



View(longley)
names(longley)[1]<-"GNP Deflator"
names(longley)[4]<-"Armed Forces"

class(longley)


dim(longley)


colnames(longley)


str(longley)

glimpse(longley)
Observations: 16

Variables: 7



plot(longley$GNP, longley$Unemployed, main = "Rate of Unemployment with GNP", xlab = "GNP", ylab = "Unemployed")


t.test(longley$GNP, longley$Unemployed)

t.test(longley$GNP, mu = 5, alternative = 'two.sided')


t.test(longley$Unemployed, mu = 5, alternative = 'two.sided')


#Parsimonious model

install.packages('devtools')

 
GNP<-longley[,2]
Unemployed<-longley[,3]
Population<-longley[,5]
dim(longley)



m1 <- MoE_clust(GNP, G=0:2, verbose=FALSE)
m2 <- MoE_clust(GNP, G=2, verbose=FALSE)
m3 <- MoE_clust(GNP, G=2:16, verbose=FALSE)


comp <- MoE_compare(m1, m2, m3)

comp

(mod <- as.Mclust(comp$optimal))

plot(mod, what="classification")

#leveneTest examination
library(car)

leveneTest(longley$GNP, longley$Unemployed)


#Graphical Visualization   
library('ggplot2')



library(readr)


options(repr.plot.width = 6, repr.plot.height = 6)

class(longley)


View(longley)
head(longley)


summary(longley)
 
 
 
ggplot(data=longley,aes(x=longley$GNP, y=longley$Unemployed)) + geom_point() + theme_minimal()
ggplot(data=longley,aes(x=longley$`GNP Deflator`, y=longley$Unemployed)) + geom_point() + theme_minimal()


pairs(longley[,1:4], pch = 19)
pairs(longley[,5:7], pch = 19)

base<-lm(Employed ~., longley)
summary(base)


pcrFit<-pcr(Employed ~ ., data = longley, valdiation = "cv")
summary(pcrFit)