library(ggplot2)
library(gghighlight)
library(dplyr)

poplev_helping <- readr::read_csv("poplev-helping2.csv") %>% 
  tidyr::gather("types", "y", -pop_level)

poplev_helping[seq(from=1, to=15, by=3),]

p <- ggplot(poplev_helping,
            aes(x = pop_level, color = types)) +
  geom_line(aes(y = y))
p

p + gghighlight(types %in% c('donation', 'envelope'))