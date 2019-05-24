#Install required packages
install.packages("rmarkdown")
install.packages("tinytex")

install.packages("knitr")
library(readr)
Autompg <- read.csv("auto-mpg.csv")
Autompg
View(Autompg)

```{Summary of dataset imported}
summary(Autompg)
```
## Including Plots
You can also embed plots, for example:
```{r pressure, echo=FALSE}
plot(Autompg$mpg~Autompg$weight)

summary(Autompg)
 mpg cylinders displacement horsepower weight acceleration 
 Min. : 9.00 Min. :3.000 Min. : 68.0 150 : 22 Min. :1613 Min. : 8.00 
 1st Qu.:17.50 1st Qu.:4.000 1st Qu.:104.2 90 : 20 1st Qu.:2224 1st Qu.:13.82 
 Median :23.00 Median :4.000 Median :148.5 88 : 19 Median :2804 Median :15.50 
 Mean :23.51 Mean :5.455 Mean :193.4 110 : 18 Mean :2970 Mean :15.57 
 3rd Qu.:29.00 3rd Qu.:8.000 3rd Qu.:262.0 100 : 17 3rd Qu.:3608 3rd Qu.:17.18 
 Max. :46.60 Max. :8.000 Max. :455.0 75 : 14 Max. :5140 Max. :24.80 
 (Other):288 
 model.year origin car.name 
 Min. :70.00 Min. :1.000 ford pinto : 6 
 1st Qu.:73.00 1st Qu.:1.000 amc matador : 5 
 Median :76.00 Median :1.000 ford maverick : 5 
 Mean :76.01 Mean :1.573 toyota corolla: 5 
 3rd Qu.:79.00 3rd Qu.:2.000 amc gremlin : 4 
 Max. :82.00 Max. :3.000 amc hornet : 4 
 (Other) :369 
 
 
