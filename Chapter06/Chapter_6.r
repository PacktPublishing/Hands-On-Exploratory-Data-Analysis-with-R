#Reading the dataset
library(readr)

bank <-read.csv("bank.csv", stringsAsFactors = FALSE)
bank

View(bank)

#Cleaning and tidying up the dataset

library(tidyr)


library(dplyr)
class(bank)

dim(bank)
colnames(bank)
str(bank)
library(plyr)
hist(bank$balance)
boxplot(bank$balance)

class(bank$balance)

bank$balance<-as.character(bank$balance)
class(bank$balance)

library(tidyr)
bank1<-unite(data = bank, col= balance, loan)
bank1

#Understanding the structure of dataset
summary(bank)
bank$age<-as.numeric(bank$age)
bank$job<-as.character(bank$job)
bank$marital<-as.character(bank$marital)
bank$education<-as.character(bank$education)
bank$default<-as.character(bank$default)
bank$balance<-as.numeric(bank$balance)
bank$housing<-as.character(bank$loan)
bank$contact<- as.character(bank$contact)
bank$day<-as.numeric(bank$day)
bank$month<-as.character(bank$month)
bank$duration<-as.numeric(bank$duration)
bank$campaign<-as.numeric(bank$campaign)


#Hypothesis Test

t.test(bank$balance, bank$age)
t.test(bank$balance, mu = 5, alternative = 'greater')
cor(bank$balance, bank$age, method = 'spearman')
cor(bank$balance, bank$age, method = 'kendall')

#Tietjan-Moore Test

TietjenMoore <- function(dataSeries,k)
+ {
+     n = length(dataSeries)
+     ## Compute the absolute residuals.
+     r = abs(dataSeries - mean(dataSeries))
+     ## Sort data according to size of residual.
+     df = data.frame(dataSeries,r)
+     dfs = df[order(df$r),]
+     ## Create a subset of the data without the largest k values.
+     klarge = c((n-k+1):n)
+     subdataSeries = dfs$dataSeries[-klarge]
+     ## Compute the sums of squares.
+     ksub = (subdataSeries - mean(subdataSeries))**2
+     all = (df$dataSeries - mean(df$dataSeries))**2
+     ## Compute the test statistic.
+     sum(ksub)/sum(all)
+ }


FindOutliersTietjenMooreTest <- function(dataSeries,k,alpha=0.05){
+     ek <- TietjenMoore(dataSeries,k)
+     ## Compute critical value based on simulation.
+     test = c(1:10000)
+     for (i in 1:10000){
+         dataSeriesdataSeries = rnorm(length(dataSeries))
+         test[i] = TietjenMoore(dataSeriesdataSeries,k)}
+     Talpha=quantile(test,alpha)
+     list(T=ek,Talpha=Talpha)
+ }
#Demonstration of test

x <- c(-1.40, -0.44, -0.30, -0.24, -0.22, -0.13, -0.05, 0.06, 0.10, 0.18,
+        0.20, 0.39, 0.48, 0.63, 1.01)
FindOutliersTietjenMooreTest(x, 2)

FindOutliersTietjenMooreTest(bank$balance, 2)

#Parsimonious Model

install.packages('devtools')
install.packages('MoEClust')
library(MoEClust)

View(bank)
age <- bank[,1]
age

balance<-bank[,6]
balance

m1    <- MoE_clust(balance, G=0:2, verbose=FALSE)
m2    <- MoE_clust(balance, G=2, verbose=FALSE)
m3    <- MoE_clust(balance, G=1:2,  verbose=FALSE)
comp

plot(comp$optimal, what="gpairs", jitter=FALSE)
(mod <- as.Mclust(comp$optimal))
 
plot(mod, what="classification")
plot(mod, what="uncertainty")

#Probability Plots

p1 <- ggplot(data = bank, aes(bank$balance)) + stat_function(fun = dnorm, n = 101, args = list(mean = 0, sd = 1)) + ylab("") + scale_y_continuous(breaks = NULL)
p2 <- ggplot(data = bank, aes(bank$balance)) +stat_function(fun = pnorm, n = 101, args = list(mean = 0, sd = 1)) + ylab("") + scale_y_continuous(breaks = NULL)
p4 <- ggplot(data = bank, aes(bank$balance)) +
+ stat_function(fun = rnorm, n = 101, args = list(mean = 0, sd = 1)) + ylab("") +scale_y_continuous(breaks = NULL)

#Shapiro Wik Test
shapiro.test(bank$balance[1:10])


shapiro.test(bank$balance[1:4000])













