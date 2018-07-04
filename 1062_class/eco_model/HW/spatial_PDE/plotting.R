library(ggplot2)
library(dplyr)
library(magrittr)
library(tidyr)
data_extinct <- readr::read_delim("data_0.09.txt", "\t", escape_double = FALSE, col_names = FALSE, trim_ws = TRUE) %>%
    set_names(c("time", paste0("",seq(1,100,1))))

df <- data_extinct %>% 
    gather(key=i, value=N, -time) %>%
    mutate(i = as.integer(i)) %>%
    arrange(time, i)

ggplot(df, aes(x=time, y=i, z = N))+
    stat_contour(geom = "polygon", 
                 aes(fill = ..level..),
                 bins = 900) +
    scale_fill_distiller(palette="Spectral", 
                         trans="log10")+
    geom_contour(aes(colour = ..level..), 
                 binwidth=0.25,
                 lwd=0.3, show.legend = F)+
    scale_color_distiller(palette="Spectral", 
                         trans="log10")+
    labs(x="Time", y="Position", fill="Pop. Size")+
    theme_bw()