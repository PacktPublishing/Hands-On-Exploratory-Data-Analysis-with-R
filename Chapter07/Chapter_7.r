#Reading the dataset

library(readr)
library(readxl)
AirQualityUCI <- read_xlsx("AirQualityUCI.xlsx")
View(AirQualityUCI)

str(AirQualityUCI)

#Cleaning the dataset

library(dplyr)
library(tidyr)

summary(AirQualityUCI)
str(AirQualityUCI)
head(AirQualityUCI)


tail(AirQualityUCI)

library("lubridate")



AirQualityUCI$Time<-parse_date_time(AirQualityUCI$Time, orders="ymd hms"

#Understanding the data structure

class(AirQualityUCI)
dim(AirQualityUCI)
colnames(AirQualityUCI)
str(AirQualityUCI)
library(dplyr)
glimpse(AirQualityUCI)

plot(AirQualityUCI$AH, AirQualityUCI$RH, main = "Humidity Analysis", xlab = "Absolute Humidity", ylab = "Relative Humidity")

#Hypothesis Tests
t.test(AirQualityUCI$RH, AirQualityUCI$AH)
t.test(AirQualityUCI$RH, mu = 5, alternative = 'greater')


t.test(AirQualityUCI$AH, mu = 5, alternative = 'greater')

#Grubbs Test and checking outliers

outlierKD <- function(dt, var) {
+     var_name <- eval(substitute(var),eval(dt))
+     na1 <- sum(is.na(var_name))
+     m1 <- mean(var_name, na.rm = T)
+     par(mfrow=c(2, 2), oma=c(0,0,3,0))
+     boxplot(var_name, main="With outliers")
+     hist(var_name, main="With outliers", xlab=NA, ylab=NA)
+     outlier <- boxplot.stats(var_name)$out
+     mo <- mean(outlier)
+     var_name <- ifelse(var_name %in% outlier, NA, var_name)
+     boxplot(var_name, main="Without outliers")
+     hist(var_name, main="Without outliers", xlab=NA, ylab=NA)
+     title("Outlier Check", outer=TRUE)
+     na2 <- sum(is.na(var_name))
+     cat("Outliers identified:", na2 - na1, "n")
+     cat("Propotion (%) of outliers:", round((na2 - na1) / sum(!is.na(var_name))*100, 1), "n")
+     cat("Mean of the outliers:", round(mo, 2), "n")
+     m2 <- mean(var_name, na.rm = T)
+     cat("Mean without removing outliers:", round(m1, 2), "n")
+     cat("Mean if we remove outliers:", round(m2, 2), "n")
+     response <- readline(prompt="Do you want to remove outliers and to replace with NA? [yes/no]: ")
+     if(response == "y" | response == "yes"){
+         dt[as.character(substitute(var))] <- invisible(var_name)
+         assign(as.character(as.list(match.call())$dt), dt, envir = .GlobalEnv)
+         cat("Outliers successfully removed", "n")
+         return(invisible(dt))
+     } else{
+         cat("Nothing changed", "n")
+         return(invisible(var_name))
+     }
+ }
outlierKD(AirQualityUCI,AH)


install.packages("outliers")

library(outliers)
library(ggplot2)

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

ggplot(grubbs.flag(AirQualityUCI$AH),aes(x=AirQualityUCI$AH,color=Outlier,fill=Outlier))+
+     geom_histogram(binwidth=diff(range(AirQualityUCI$AH))/30)+
+     theme_bw()

#Parsimonious Model

install.packages('devtools')
install.packages('MoEClust')

library(MoEClust)
View(AirQualityUCI)
Date


RH <-AirQualityUCI[,14]


AH <-AirQualityUCI[,15]
plot(comp$optimal, what="gpairs", jitter=FALSE)
(mod <- as.Mclust(comp$optimal))

plot(mod, what="classification")
plot(mod, what="uncertainty")

#Bartlett's Test
View(AirQualityUCI)

bartlett.test(RH~Date, AirQualityUCI)
bartlett.test(AH~Date, AirQualityUCI)

#Data Visualization

acf(AirQualityUCI)
require(graphics)
spectrum(AirQualityUCI, method = c("pgram", "ar"))
spectrum(AirQualityUCI)

#Phase Plots

install.packages("seewave")

library(seewave)

phaseplot(AirQualityUCI, , dim = 2)






