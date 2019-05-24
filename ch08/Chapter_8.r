#Reading the dataset
library(pls)
data(longley)

View(longley)

str(longley)
'data.frame': 16 obs. of 7 variables:

$ GNP.deflator: num 83 88.5 88.2 89.5 96.2 ...
$ GNP : num 234 259 258 285 329 ...
$ Unemployed : num 236 232 368 335 210 ...
$ Armed.Forces: num 159 146 162 165 310 ...
$ Population : num 108 109 110 111 112 ...
$ Year : int 1947 1948 1949 1950 1951 1952 1953 1954 1955 1956 ...
$ Employed : num 60.3 61.1 60.2 61.2 63.2 ...

library(dplyr)
library(tidyr)

summary(longley)
  GNP Deflator         GNP          Unemployed     Armed Forces     Population         Year         Employed    
 Min.   : 83.00   Min.   :234.3   Min.   :187.0   Min.   :145.6   Min.   :107.6   Min.   :1947   Min.   :60.17  
 1st Qu.: 94.53   1st Qu.:317.9   1st Qu.:234.8   1st Qu.:229.8   1st Qu.:111.8   1st Qu.:1951   1st Qu.:62.71  
 Median :100.60   Median :381.4   Median :314.4   Median :271.8   Median :116.8   Median :1954   Median :65.50  
 Mean   :101.68   Mean   :387.7   Mean   :319.3   Mean   :260.7   Mean   :117.4   Mean   :1954   Mean   :65.32  
 3rd Qu.:111.25   3rd Qu.:454.1   3rd Qu.:384.2   3rd Qu.:306.1   3rd Qu.:122.3   3rd Qu.:1958   3rd Qu.:68.29  
 Max.   :116.90   Max.   :554.9   Max.   :480.6   Max.   :359.4   Max.   :130.1   Max.   :1962   Max.   :70.55  
 
 
 head(longley)
GNP.deflator GNP Unemployed Armed.Forces Population Year Employed

1947 83.0 234.289 235.6 159.0 107.608 1947 60.323
1948 88.5 259.426 232.5 145.6 108.632 1948 61.122
1949 88.2 258.054 368.2 161.6 109.773 1949 60.171
1950 89.5 284.599 335.1 165.0 110.929 1950 61.187
1951 96.2 328.975 209.9 309.9 112.075 1951 63.221
1952 98.1 346.999 193.2 359.4 113.270 1952 63.639

tail(longley)

GNP.deflator GNP Unemployed Armed.Forces Population Year Employed

1957 108.4 442.769 293.6 279.8 120.445 1957 68.169
1958 110.8 444.546 468.1 263.7 121.950 1958 66.513
1959 112.6 482.704 381.3 255.2 123.366 1959 68.655
1960 114.2 502.601 393.1 251.4 125.368 1960 69.564
1961 115.7 518.173 480.6 257.2 127.852 1961 69.331
1962 116.9 554.894 400.7 282.7 130.081 1962 70.551


View(longley)
names(longley)[1]<-"GNP Deflator"
names(longley)[4]<-"Armed Forces"

class(longley)
[1] "data.frame"

dim(longley)
[1] 16 7

colnames(longley)
[1] "GNP Deflator" "GNP" "Unemployed" "Armed Forces" "Population"

[6] "Year" "Employed"

str(longley)
'data.frame': 16 obs. of 7 variables:

$ GNP Deflator: num 83 88.5 88.2 89.5 96.2 ...
$ GNP : num 234 259 258 285 329 ...
$ Unemployed : num 236 232 368 335 210 ...
$ Armed Forces: num 159 146 162 165 310 ...
$ Population : num 108 109 110 111 112 ...
$ Year : int 1947 1948 1949 1950 1951 1952 1953 1954 1955 1956 ...
$ Employed : num 60.3 61.1 60.2 61.2 63.2 ...

glimpse(longley)
Observations: 16

Variables: 7

$ `GNP Deflator` <dbl> 83.0, 88.5, 88.2, 89.5, 96.2, 98.1, 99.0, 100.0, 101.2, 104...

$ GNP <dbl> 234.289, 259.426, 258.054, 284.599, 328.975, 346.999, 365.3...

$ Unemployed <dbl> 235.6, 232.5, 368.2, 335.1, 209.9, 193.2, 187.0, 357.8, 290...

$ `Armed Forces` <dbl> 159.0, 145.6, 161.6, 165.0, 309.9, 359.4, 354.7, 335.0, 304...

$ Population <dbl> 107.608, 108.632, 109.773, 110.929, 112.075, 113.270, 115.0...

$ Year <int> 1947, 1948, 1949, 1950, 1951, 1952, 1953, 1954, 1955, 1956,...

$ Employed <dbl> 60.323, 61.122, 60.171, 61.187, 63.221, 63.639, 64.989, 63....

plot(longley$GNP, longley$Unemployed, main = "Rate of Unemployment with GNP", xlab = "GNP", ylab = "Unemployed")

#Hypothesis test

t.test(longley$GNP, longley$Unemployed)
Welch Two Sample t-test

data: longley$GNP and longley$Unemployed

t = 2.0045, df = 29.886, p-value = 0.05415

alternative hypothesis: true difference in means is not equal to 0

95 percent confidence interval:

-1.297804 138.032179

sample estimates:

mean of x mean of y

387.6984 319.3313

t.test(longley$GNP, mu = 5, alternative = 'two.sided')
One Sample t-test
data: longley$GNP
t = 15.401, df = 15, p-value = 1.337e-10

alternative hypothesis: true mean is not equal to 5
95 percent confidence interval:

334.7346 440.6623

sample estimates:
mean of x
387.6984

t.test(longley$Unemployed, mu = 5, alternative = 'two.sided')
One Sample t-test
data: longley$Unemployed
t = 13.455, df = 15, p-value = 8.912e-10

alternative hypothesis: true mean is not equal to 5
95 percent confidence interval:
269.5372 369.1253
sample estimates:
mean of x
319.3313


#Parsimonious model

install.packages('devtools')
Installing package into ‘C:/Users/Radhika/Documents/R/win-library/3.5’
(as ‘lib’ is unspecified)
trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.5/devtools_2.0.2.zip'
Content type 'application/zip' length 383720 bytes (374 KB)
downloaded 374 KB
package ‘devtools’ successfully unpacked and MD5 sums checked
The downloaded binary packages are in
 C:\Users\Radhika\AppData\Local\Temp\Rtmpc1oW5p\downloaded_packages
 
GNP<-longley[,2]
Unemployed<-longley[,3]
Population<-longley[,5]
dim(longley)
[1] 16 7


m1 <- MoE_clust(GNP, G=0:2, verbose=FALSE)
m2 <- MoE_clust(GNP, G=2, verbose=FALSE)
m3 <- MoE_clust(GNP, G=2:16, verbose=FALSE)


comp <- MoE_compare(m1, m2, m3)

comp

(mod <- as.Mclust(comp$optimal))
'Mclust' model object: single noise component

Available components: 
 [1] "call" "data" "modelName" "n" 
 [5] "d" "G" "BIC" "bic" 
 [9] "loglik" "df" "hypvol" "parameters" 
[13] "z" "classification" "uncertainty" 

plot(mod, what="classification")

library(car)
Loading required package: carData

Attaching package: ‘car’

The following object is masked from ‘package:dplyr’:

recode

The following object is masked from ‘package:arules’:

recode

Warning message:
package ‘car’ was built under R version 3.5.1 

leveneTest(longley$GNP, longley$Unemployed)
Levene's Test for Homogeneity of Variance (center = median)
      Df F value Pr(>F)
group 15 
       0 
	   

	   
library('ggplot2')

Attaching package: ‘ggplot2’

The following object is masked _by_ ‘.GlobalEnv’:

mpg

Warning message:
package ‘ggplot2’ was built under R version 3.5.3 

library(readr)


options(repr.plot.width = 6, repr.plot.height = 6)

class(longley)
[1] "data.frame"
"

View(longley)
head(longley)
 GNP Deflator GNP Unemployed Armed Forces Population Year Employed
1947 83.0 234.289 235.6 159.0 107.608 1947 60.323
1948 88.5 259.426 232.5 145.6 108.632 1948 61.122
1949 88.2 258.054 368.2 161.6 109.773 1949 60.171
1950 89.5 284.599 335.1 165.0 110.929 1950 61.187
1951 96.2 328.975 209.9 309.9 112.075 1951 63.221
1952 98.1 346.999 193.2 359.4 113.270 1952 63.639



summary(longley)
 GNP Deflator GNP Unemployed Armed Forces Population 
 Min. : 83.00 Min. :234.3 Min. :187.0 Min. :145.6 Min. :107.6 
 1st Qu.: 94.53 1st Qu.:317.9 1st Qu.:234.8 1st Qu.:229.8 1st Qu.:111.8 
 Median :100.60 Median :381.4 Median :314.4 Median :271.8 Median :116.8 
 Mean :101.68 Mean :387.7 Mean :319.3 Mean :260.7 Mean :117.4 
 3rd Qu.:111.25 3rd Qu.:454.1 3rd Qu.:384.2 3rd Qu.:306.1 3rd Qu.:122.3 
 Max. :116.90 Max. :554.9 Max. :480.6 Max. :359.4 Max. :130.1 
 Year Employed 
 Min. :1947 Min. :60.17 
 1st Qu.:1951 1st Qu.:62.71 
 Median :1954 Median :65.50 
 Mean :1954 Mean :65.32 
 3rd Qu.:1958 3rd Qu.:68.29 
 Max. :1962 Max. :70.55 
 
 
ggplot(data=longley,aes(x=longley$GNP, y=longley$Unemployed)) + geom_point() + theme_minimal()
ggplot(data=longley,aes(x=longley$`GNP Deflator`, y=longley$Unemployed)) + geom_point() + theme_minimal()


pairs(longley[,1:4], pch = 19)
pairs(longley[,5:7], pch = 19)

base<-lm(Employed ~., longley)
summary(base)


pcrFit<-pcr(Employed ~ ., data = longley, valdiation = "cv")
summary(pcrFit)