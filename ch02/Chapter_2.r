library(readr)
read_csv("mtcars.csv")

cols(
mpg = col_double(),
cyl = col_double(),
disp = col_double(),
hp = col_double(),
drat = col_double(),
wt = col_double(),
qsec = col_double(),
vs = col_double(),
am = col_double(),
gear = col_double(),
carb = col_double()
)

cars_data <- read_csv(readr_example("mtcars.csv"))

cols(
mpg = col_double(),
cyl = col_double(),
disp = col_double(),
hp = col_double(),
drat = col_double(),
wt = col_double(),
qsec = col_double(),
vs = col_double(),
am = col_double(),
gear = col_double(),
carb = col_double()
)


read_csv("data.csv", skip = 2)

read_csv("data.csv", col_names = FALSE)

cars_data <- read_csv(readr_example("mtcars.csv"), col_types="ddddddddd")


read_csv(file, col_names = TRUE, col_types = NULL,
  locale = default_locale(), na = c("", "NA"), quoted_na = TRUE,
  quote = "\"", comment = "", trim_ws = TRUE, skip = 0,
  n_max = Inf, guess_max = min(1000, n_max),
  progress = show_progress(), skip_empty_rows = TRUE)

read_tsv("data.tsv")

read_tsv(file, col_names = TRUE, col_types = NULL,
  locale = default_locale(), na = c("", "NA"), quoted_na = TRUE,
  quote = "\"", comment = "", trim_ws = TRUE, skip = 0,
  n_max = Inf, guess_max = min(1000, n_max),
  progress = show_progress(), skip_empty_rows = TRUE)

read_delim("data.del", delim = "|")

read_fwf("data.txt")

read_fwf(data.txt, fwf_widths(c(10, 20, 18), c("ID", "Revenue", "Region")))


read_table("table.csv")

read_log("data.log")


library(readxl)

read_excel("data.xls")

read_excel("data.xlsx")
excel_sheets("data.xlsx")

read_excel("data.xlsx", sheet= 1)

read_excel("data.xlsx", sheet= "sheet1")

library(jsonlite)

json_data <-
'[
  {"Name" : "John", "Age" : 42, "City" : "New York"}, 
  {"Name" : "Jane", "Age" : 41, "City" : "Paris"},
  {},
  {"Name" : "Bob", "City" : "London"}
]'
df <- fromJSON(json_data)
df


library(httr)

r <- GET("http://httpbin.org/get")

r

content(r, "raw")

library(DBI)

con <- dbConnect(RSQLite::SQLite(), dbname = ":memory:")

dbListTables(con)


