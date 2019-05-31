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
 
 
