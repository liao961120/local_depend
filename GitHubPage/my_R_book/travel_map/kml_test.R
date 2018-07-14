library(sf)
library(dplyr)
library(tidyr)
library(ggplot2)
library(tmap)

sp <- st_read("./shape/TOWN_MOI_1070330.shp") %>% 
    select(COUNTYNAME, TOWNNAME)
border <- st_read("COUNTY_BORDER.gpkg")[,-2] %>%
    mutate(TOWNAME = COUNTYNAME)
taitung <- st_read("taitung.kml")



idx <- sp$COUNTYNAME %in% c("花蓮縣","臺東縣") & sp$TOWNNAME %in% c("吉安鄉", "花蓮市", "壽豐鄉", "光復鄉", "臺東市", "東河鄉", "綠島鄉", "蘭嶼鄉")

color <- tmaptools::get_brewer_pal("RdYlGn", n = 16)
color <- color[seq(1, 16, by = 2)]
curve <- c(121.19205, 22.79167, 121.507004, 22.0574483,
           121.4723663, 22.6595601)

sp_trav <- sp[idx,]
sp_trav$TOWNNAME <- factor(sp_trav$TOWNNAME, levels = c("花蓮市","吉安鄉", "壽豐鄉", "光復鄉", "東河鄉", "臺東市", "綠島鄉", "蘭嶼鄉"))


pl <- ggplot()+
    geom_sf(data = sp, colour="grey50", 
            fill = "grey80", lwd=0.05) +
    geom_sf(data = border, 
            colour="grey30", fill=NA, lwd=0.08) +
    geom_sf(data = sp_trav, aes(fill=TOWNNAME), colour=NA)+
    #geom_sf(data = taitung,  size=0.01) +
    scale_x_continuous(limits = c(119.75, 121.9), 
                       breaks = 0)+
    scale_y_continuous(limits = c(21.9, 25.3),
                       breaks = 0) +
    # geom_curve(aes(x = curve[1], y = curve[2],
    #                xend = curve[3], yend = curve[4], 
    #                colour = "臺東至蘭嶼"),
    #            lwd=0.2, curvature = 0.2)+
    # geom_curve(aes(x = cplot_travel_location.pngurve[3], y = curve[4], 
    #                xend = curve[5], yend = curve[6], 
    #                colour = "蘭嶼至綠島"), 
    #            lwd=0.2, curvature = 0.2)+
    #guides(colour = guide_legend(override.aes = list(lwd=1)))+
    scale_fill_brewer(palette="Set1")+
    guides(fill = guide_legend(keywidth = 0.65, 
                               keyheight = 0.65, ncol =2)
           ) +
    labs(colour = "", x="", y="", fill="旅遊地區")+
    theme(panel.background = element_rect(fill = "transparent"),
          plot.background = element_rect(fill = "transparent"),
          legend.text = element_text(size = 7),
          legend.title = element_text(size = 10, face = "bold"), 
          legend.position = "right",
          legend.justification = "bottom"
    )

ggsave("plot_travel_location.png", pl, dpi = 800, width = 4.2, height = 4.6)