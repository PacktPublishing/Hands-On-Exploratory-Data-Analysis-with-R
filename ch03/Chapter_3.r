# Reading the dataset
mpg <-read.csv("highway_mpg.csv",   stringsAsFactors = FALSE)   
View(mpg)
str(mpg)   
  
 
install.packages("tidyr")
library(tidyr)
mpg2 <- mpg %>% gather(mpg, "Year   of Establishment", "year", -manufacturer)   
View(mpg2) 
mpg4<- unite_(mpg, "FuelEfficiency", c("drv","fl"))   
View(mpg4) 
mpg3<- mpg4 %>% separate(FuelEfficiency, c("drv", "f1"))   
View(mpg3)
install.packages("dplyr")
library(dplyr)
mpgMutate <- mpg %>% mutate(nv=cyl+displ)   
View(mpgMutate)
mpgSummarize<- mpg %>% group_by(displ) %>% summarize(avg_displ=mean(displ))
View(mpgSummarize)
mpgGroupBy <- mpg %>%group_by(model)   
View(mpgGroupBy)

mpgArrange<- mpg %>%arrange(mpg$year)   
View(mpgArrange)
glimpse(mpg)
mpgFilter <- mpg %>%   filter(year>2000)   
View(mpgFilter) 
library(lubridate) # work with dates
library(dplyr) # data manipulation (filter, summarize, mutate)
library(ggplot2) # graphics
library(gridExtra) # tile several plots next to each other

library(scales)

# how many measurements were made each year?
tally(mpg.grp.year)
summarize(mpg.grp.year,
+           mean(displ)   # calculate the annual mean of displ
+ )

summarize(mpg.grp.year,
+           mean(displ, na.rm = TRUE)
+ )

mpg %>%
+ group_by(year) %>% # group by year
+ tally() # count measurements per year


year.sum <- mpg %>%
+ group_by(year) %>% # group by year
+ summarize(mean(displ, na.rm=TRUE))
> year.sum

str(year.sum)


qplot(mpg.grp.year$displ, mpg.grp.year$year,xlab = "Displacement", ylab = "year",main = "Manipulating Grouped Data")

 
