library(dplyr)

############ How to find out the most fluent language ############
df <- data_frame(
    x1 = rnorm(10), #lang1
    x2 = rnorm(10), #lang2
    x3 = rnorm(10)  #lang3
    )

df <- df %>%
    rowwise() %>%
    mutate(best_val = max(x1, x2, x3)) %>%
    ungroup() %>%
    mutate(best = if_else(x1 == best_val, "x1",
                          if_else(x2 == best_val, "x2",
                                  "x3")
                          )
           ) %>%
    select(-best_val)
##################################################################
