># Reading the dataset
> mpg <-read.csv("highway_mpg.csv",   stringsAsFactors = FALSE)   
> View(mpg)
> str(mpg)   
'data.frame':  234 obs. of  11 variables:   
 $ manufacturer: chr  "audi" "audi"   "audi" "audi" ...   
 $ model       : chr  "a4" "a4"   "a4" "a4" ...   
 $ displ       : num  1.8 1.8 2 2 2.8 2.8   3.1 1.8 1.8 2 ...   
 $ year        : int  1999 1999 2008 2008   1999 1999 2008 1999 1999 2008 ...   
 $ cyl         : int  4 4 4 4 6 6 6 4 4 4   ...   
 $ trans       : chr  "auto(l5)"   "manual(m5)" "manual(m6)" "auto(av)" ...   
 $ drv         : chr  "f" "f"   "f" "f" ...   
 $ cty         : int  18 21 20 21 16 18   18 18 16 20 ...   
 $ hwy         : int  29 29 31 30 26 26   27 26 25 28 ...   
 $ fl          : chr  "p" "p"   "p" "p" ...   
 
> install.packages("tidyr")
> library(tidyr)
> mpg2 <- mpg %>% gather(mpg, "Year   of Establishment", "year", -manufacturer)   
> View(mpg2) 
> mpg4<- unite_(mpg, "FuelEfficiency", c("drv","fl"))   
> View(mpg4) 
> mpg3<- mpg4 %>% separate(FuelEfficiency, c("drv", "f1"))   
> View(mpg3)
> install.packages("dplyr")  
> mpgMutate <- mpg %>% mutate(nv=cyl+displ)   
> View(mpgMutate)
> mpgGroupBy <- mpg %>%group_by(model)   
> View(mpgGroupBy)

> mpgArrange<- mpg %>%arrange(mpg$year)   
> View(mpgArrange)
> glimpse(mpg)
> mpgFilter <- mpg %>%   filter(year>2000)   
> View(mpgFilter) 
> library(lubridate) # work with dates
Attaching package: ‘lubridate’
The following object is masked from ‘package:base’:
date
> library(dplyr) # data manipulation (filter, summarize, mutate)
> library(ggplot2) # graphics
> library(gridExtra) # tile several plots next to each other
Attaching package: ‘gridExtra’
The following object is masked from ‘package:dplyr’:
combine
> library(scales)
Warning message:
package ‘scales’ was built under R version 3.5.3

> # how many measurements were made each year?
> tally(mpg.grp.year)
# A tibble: 2 x 2
   year     n
<int><int>
1  1999   117
2  2008   117
> summarize(mpg.grp.year,
+           mean(displ)   # calculate the annual mean of displ
+ )
# A tibble: 2 x 2
   year `mean(displ)`
<int><dbl>
1  1999          3.28
2  2008          3.66

> summarize(mpg.grp.year,
+           mean(displ, na.rm = TRUE)
+ )
# A tibble: 2 x 2
   year `mean(displ, na.rm = TRUE)`
<int><dbl>
1  1999                        3.28
2  2008                        3.66

> mpg %>%
+ group_by(year) %>% # group by year
+ tally() # count measurements per year
# A tibble: 2 x 2
year n
<int><int>
1 1999 117
2 2008 117

> year.sum <- mpg %>%
+ group_by(year) %>% # group by year
+ summarize(mean(displ, na.rm=TRUE))
> year.sum
# A tibble: 2 x 2
 year `mean(displ, na.rm = TRUE)`
<int><dbl>
1 1999 3.28
2 2008 3.66

> str(year.sum)
Classes ‘tbl_df’, ‘tbl’ and 'data.frame':               
2 obs. of  2 variables: $ year                     
: int  1999 2008 $ mean(displ, na.rm = TRUE): num  3.28 3.66

>qplot(mpg.grp.year$displ, mpg.grp.year$year,xlab = "Displacement", ylab = "year",main = "Manipulating Grouped Data")

 