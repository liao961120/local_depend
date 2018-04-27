library(googlesheets)
library(dplyr)

data <- gs_url("https://docs.google.com/spreadsheets/d/1ufuzTL9VCxdvX1QeFQcMGxYbEMq1ZEWVht3CEDpXBmc/edit?usp=sharing") %>% gs_read()

data2 <- readr::read_csv(url("https://docs.google.com/spreadsheets/d/e/2PACX-1vQz4zjZfhWBYYRuW2Zhhx-sXvnlrS6vpvcgP0cJPdvsQI-6eKggXmpaWbu4dgbMQgcOHv0NQxL8a_K_/pub?output=csv"))