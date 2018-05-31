library(ggplot2)

formant <- data.frame(
    sound = c("i", "a", "o"),
    F1 = c(284.63555, 748.90351, 381.478705),
    F2 = c(2145.243498, 1198.7695457, 1750.560005)
)

ggplot(formant)+
    geom_text(aes(x=-F2,
                  y=-F1,
                  label=sound))+
    scale_x_continuous(limits = c(-2500,-1000),
                       breaks = seq(-2500,-1000, 500), 
                       labels=abs(seq(-2500,-1000, 500))
                       )+
    scale_y_continuous(limits = c(-800,-200),
                   breaks = seq(-800,-200, 100), 
                   labels=abs(seq(-800,-200, 100))
                   )
    