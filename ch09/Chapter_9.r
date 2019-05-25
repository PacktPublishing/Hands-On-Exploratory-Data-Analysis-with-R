library(readr)
Autompg <- read.csv("auto-mpg.csv")

View(Autompg)

library(dplyr)
library(tidyr)

summary(Autompg)

head(Autompg)


tail(Autompg)

names(Autompg)[9]<-"CarName"
View(Autompg)

Autompg$cylinders = Autompg$cylinders %>%
+     factor(labels = sort(unique(Autompg$cylinders)))
Autompg$horsepower = as.numeric(levels(Autompg$horsepower))[Autompg$horsepower]

View(Autompg)

class(Autompg)

dim(Autompg)

colnames(Autompg)

str(Autompg)

glimpse(Autompg)

plot(Autompg$displacement, Autompg$acceleration, main = "Rate of acceleration", xlab = "Displacement", ylab = "Acceleration")

t.test(Autompg$displacement, Autompg$weight)

t.test(Autompg$displacement, mu = 5, alternative = 'greater')

t.test(Autompg$displacement, mu = 5, alternative = 'greater')

outlierKD <- function(dt, var) {
+ var_name <- eval(substitute(var),eval(dt))
+ na1 <- sum(is.na(var_name))
+ m1 <- mean(var_name, na.rm = T)
+ par(mfrow=c(2, 2), oma=c(0,0,3,0))
+ boxplot(var_name, main="With outliers")
+ hist(var_name, main="With outliers", xlab=NA, ylab=NA)
+ outlier <- boxplot.stats(var_name)$out
+ mo <- mean(outlier)
+ var_name <- ifelse(var_name %in% outlier, NA, var_name)
+ boxplot(var_name, main="Without outliers")
+ hist(var_name, main="Without outliers", xlab=NA, ylab=NA)
+ title("Outlier Check", outer=TRUE)
+ na2 <- sum(is.na(var_name))
+ cat("Outliers identified:", na2 - na1, "n")
+ cat("Propotion (%) of outliers:", round((na2 - na1) / sum(!is.na(var_name))*100, 1), "n")
+ cat("Mean of the outliers:", round(mo, 2), "n")
+ m2 <- mean(var_name, na.rm = T)
+ cat("Mean without removing outliers:", round(m1, 2), "n")
+ cat("Mean if we remove outliers:", round(m2, 2), "n")
+ response <- readline(prompt="Do you want to remove outliers and to replace with NA? [yes/no]: ")
+ if(response == "y" | response == "yes"){
+ dt[as.character(substitute(var))] <- invisible(var_name)
+ assign(as.character(as.list(match.call())$dt), dt, envir = .GlobalEnv)
+ cat("Outliers successfully removed", "n")
+  return(invisible(dt))
+ } else{
+ cat("Nothing changed", "n")
+ return(invisible(var_name))
+ }}

outlierKD(Autompg,displacement)

install.packages("outliers")

library(outliers)

grubbs.flag <- function(x) {
+     outliers <- NULL
+     test <- x
+     grubbs.result <- grubbs.test(test)
+     pv <- grubbs.result$p.value
+     while(pv < 0.05) {
+         outliers <- c(outliers,as.numeric(strsplit(grubbs.result$alternative," ")[[1]][3]))
+         test <- x[!x %in% outliers]
+         grubbs.result <- grubbs.test(test)
+         pv <- grubbs.result$p.value
+     }
+     return(data.frame(X=x,Outlier=(x %in% outliers)))
+ }


grubbs.flag(AirQualityUCI$AH)
grubbs.flag(Autompg$displacement)

ggplot(grubbs.flag(Autompg$displacement),aes(x=Autompg$displacement,color=Outlier,fill=Outlier))+
+  geom_histogram(binwidth=diff(range(Autompg$displacement))/30)+ theme_bw()


library(MoEClust)



View(Autompg)
mpg <- Autompg[,1]
displacement <- Autompg[,3]
Acceleration <- Autompg[,6]
dim(Autompg)


m1    <- MoE_clust(displacement, G=0:2, verbose=FALSE)



m2    <- MoE_clust(displacement, G=2:16, verbose=FALSE)


comp <- MoE_compare(m1, m2)

(mod <- as.Mclust(comp$optimal))

plot(mod, what="classification")
plot(mod, what="uncertainty")

#Multi-factor Variance Analysis

d <- aggregate(mpg ~ displacement, data = Autompg, FUN = mean)
print(abs(d[[2]][1]-d[[2]][2]))

fit0 <- lm(mpg ~ displacement, data = Autompg)

lm(formula = mpg ~ displacement, data = Autompg)

fit0 <- lm(mpg ~ displacement, data = Autompg)
fit1 <- lm(mpg ~ ., data = Autompg)
fit2 <- lm(mpg ~ Acceleration + weight, Autompg)
View(Autompg)
fit3 <- lm(mpg ~ displacement + horsepower + Acceleration + weight, Autompg)
fit0

anova(fit0, fit1, fit2, fit3)

#Graphical exploration of dataset
plot(Autompg$weight , Autompg$mpg, xlab = 'Weight of Cars', ylab = 'Miles per Gallon', main = 'Scatter Plot for MTCars Weight Vs MPG')

library(ggplot2)
ggplot(data=Autompg,aes(x=weight, y=mpg)) + geom_point() + theme_minimal()

library(gplots)



plotmeans(model.year ~ origin, data = Autompg, frame = FALSE)

rate_of_activity = Autompg$displacement

sd(rate_of_activity)
ggplot(Autompg, aes(x=mpg, y=displacement)) + 
+     geom_bar(stat="identity", color="black", position=position_dodge())

p <- ggplot(Autompg, aes(x = weight, y = displacement))
p + geom_point() + stat_density2d()
p + stat_density2d(aes(colour = ..level..))
p + stat_density2d(aes(fill = ..density..), geom = "raster", contour = FALSE)














 



