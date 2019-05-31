# Reading dataset
library(readr)
library(readxl)
GlassDataset <- read_xlsx("Glass.xlsx")

View(GlassDataset)
str(GlassDataset)

library(dplyr)
library(tidyr)

summary(GlassDataset)
head(GlassDataset)
tail(GlassDataset)
str(GlassDataset)

GlassDataset$Type = GlassDataset$Type %>% factor(labels = sort(unique(GlassDataset$Type)))
View(GlassDataset)

class(GlassDataset)
dim(GlassDataset)

colnames(GlassDataset)

library(dplyr)
glimpse(GlassDataset)

plot(GlassDataset$Id, GlassDataset$Type, main = "Type of Glass", xlab = "Identification Number", ylab = "Type")



#Hypothesis Test

t.test(GlassDataset$RI, GlassDataset$Type)

t.test(GlassDataset$RI, mu = 5, alternative = 'greater')
 

t.test(GlassDataset$Type, mu = 5, alternative = 'greater')

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

outlierKD(GlassDataset,RI)

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

grubbs.flag(GlassDataset$Na)
ggplot(grubbs.flag(GlassDataset$Na),aes(x=GlassDataset$Na,color=Outlier,fill=Outlier))+ geom_histogram(binwidth=diff(range(GlassDataset$Na))/0.3)+ theme_bw()


library(MoEClust)

View(GlassDataset)
Glass_Id<-GlassDataset[,1]
RI<-GlassDataset[,2]
Mg<-GlassDataset[,4]
dim(GlassDataset)

m1    <- MoE_clust(Mg, G=0:2, verbose=FALSE)

m2    <- MoE_clust(Mg, G=2:16, verbose=FALSE)


No covariates
m3    <- MoE_clust(Mg, G=16:30, verbose=FALSE)
comp <- MoE_compare(m1, m2)
(mod <- as.Mclust(comp$optimal))

plot(mod, what="classification")
plot(mod, what="uncertainty")

plot(comp$optimal, what="gpairs", jitter=FALSE)

plot(GlassDataset$Na , GlassDataset$RI, xlab = 'Sodium Content', ylab = 'Refractive Index', main = 'Scatter plot for sodium content')

library(ggplot2)
ggplot(data=GlassDataset,aes(x=Id, y=Na)) + geom_point() + theme_minimal()+geom_col()

ggplot(data=GlassDataset,aes(x=Id, y=Na)) + geom_point() + theme_minimal()

library(GGally)
ggpairs(GlassDataset)

library(scatterplot3d)
scatterplot3d(GlassDataset[,1:3])

install.packages("ggpubr")

library(ggpubr)
ggscatter(GlassDataset, x = "RI", y = "Na", add = "reg.line", conf.int = TRUE, cor.coef = TRUE, cor.method = "pearson", xlab = "Refractive Index with Sodium Content")

shapiro.test(GlassDataset$RI) 


shapiro.test(GlassDataset$Na) 

ggqqplot(GlassDataset$RI, ylab = "RI")
ggqqplot(GlassDataset$Na, ylab = "Na")

res <- cor.test(GlassDataset$RI, GlassDataset$Na, 
+                 method = "pearson")


plot(res$p.value, res$parameter)
res$p.value

res$estimate

res2 <- cor.test(GlassDataset$RI, GlassDataset$Na,  method="kendall")
res2









