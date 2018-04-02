library(timevis)
group_d <- data.frame(
    id      = 1:2,
    content = c("Stone Technology"  , "Species"),
    title = c("Stone Technology"  , "Species")
)

data <- data.frame(
    id      = 1:4,
    content = c("one"  , "two"  ,"Ranged item", "One"),
    start   = c("-10000-01-10", "-10001-01-11", "-10002-01-20", "-10003-01-11"),
    end     = c(NA          ,           NA, "-10001-02-04", NA),
    group   = c(1,2,2,1)
)




timevis(data, groups  = group_d) %>%
    setGroups(group_d)


#--------Googlevis

library(googleVis)

datTL <- data.frame(Position=c(rep("President", 3), rep("Vice", 3)),
                    Name=c("Washington", "Adams", "Jefferson",
                           "Adams", "Jefferson", "Burr"),
                    start=rep(c(1000, 2000,3000),2),
                    end=rep(c(1100, 2100,3100),2))

Timeline <- gvisTimeline(data=datTL, 
                         rowlabel="Name",
                         barlabel="Position",
                         start="start", 
                         end="end",
                         options=list(timeline="{groupByRowLabel:false}",
                                      backgroundColor='#ffd', 
                                      height=350,
                                      colors="['#cbb69d', '#603913', '#c69c6e']"))
plot(Timeline)

