library(ggplot2)
library(RColorBrewer)
library(dplyr)
library(tidyr)
library(directlabels)
poplev_helping <- readr::read_csv("poplev-helping.csv") %>% 
  mutate(`填寫調查` =  -70/0.8*(`填寫調查` - 3.6/7))



plot_data <- poplev_helping %>% 
  gather("types", "y", -pop_level)

# new
p_base <- ggplot(data = plot_data, aes(x = pop_level, color = types)) +
  geom_line(aes(y = y), size = 0.5) +
  scale_colour_discrete(guide = 'none')  +    
  geom_dl(aes(y = y, label = types), 
          method = list(dl.trans(y=y+0, x=x+0.1),
                        "last.points",
                        cex = 0.5)) + #,fontface='bold'
  scale_y_continuous(sec.axis = 
                       sec_axis(~.*(-0.8/70)+(3.6/7), 
                                breaks = seq(from = 0.4, 
                                             to = -0.4, 
                                             by = -0.1),
                                name = "完成人口調查 (factor score)")) +
  scale_x_continuous(limits = c(1, 5.6), breaks = 1:5) +
  labs(title = '助人行為與社群人口數關聯',
    color = '助人行為種類', 
    y = '助人行為 (%)',
    x = '人口數 (量級)') +
  #theme_gray(base_size = 10) +
  theme(legend.position="bottom",
        panel.grid.minor.y = element_blank(),
        panel.grid.minor.x = element_blank(),
        panel.grid.major.x = element_blank(),
        axis.line = element_line(colour = "black"),
        plot.title = element_text(face = "bold"),
        axis.line.y.right = element_line(color = "#00BA38"),
        axis.title.y.right = element_text(color = "#00BA38"),
        axis.ticks.y.right = element_line(color = "#00BA38"))

p_highlight <- p_base + 
  geom_line(data = poplev_helping,
             aes(y = `撿信封`),
             color='#F564E3',
             size = 1.1) +
  geom_line(data = poplev_helping,
             aes(y = `填寫調查`),
             color='#00BA38',
             size = 1.1)

## Save plot
png(file = "popsize_helping.png", bg = "transparent", res=300, width = 1150, height = 850)
p_base
dev.off()

png(file = "popsize_helping_bold.png", bg = "transparent", res=300, width = 1150, height = 850)
p_highlight
dev.off()


  # geom_line(data = poplev_helping,
  #           aes(y = dropped_envelope, color='幫忙撿掉落信封'),
  #         size = 1.1) +
  # geom_line(data = poplev_helping,
  #         aes(y = trans_nonresp, color='完成人口調查'),
  #         size = 1.1) + 
  
colors <- RColorBrewer::brewer.pal(6, "Set2")
  
# old
# ggplot(data = poplev_helping, aes(x = pop_level)) +
#   geom_line(aes(y = color_request, color='回答課堂訪問作業')) +
#   geom_line(aes(y = correct_direction, color='更正方向')) +
#   geom_line(aes(y = hurt_leg, color='受傷行人')) +
#   geom_line(aes(y = donation, color='慈善捐款')) +
#   scale_y_continuous(sec.axis = 
#                        sec_axis(~.*(-0.8/70)+(3.6/7), 
#                                 breaks = seq(from = 0.4, 
#                                              to = -0.4, 
#                                              by = -0.1),
#                                 name = "完成人口調查 (factor score)\n")) +
#   scale_color_manual(values = c(
#     '回答問題' = colors[1],
#     '更正方向' = colors[2],
#     '受傷行人' = colors[3],
#     '慈善捐款' = colors[4],
#     '撿信封' = colors[5],
#     '填寫調查' = colors[6])) +
#   labs(color = '助人行為種類', 
#        y = '助人行為 (%)\n',
#        x = '人口數 (量級)') +
#   theme_linedraw(base_size = 14) +
#   theme(legend.position="bottom")
  

