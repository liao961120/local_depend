library(readr)
data <- read_csv("C:/Users/user/Desktop/data.csv")

type <- data[2:nrow(data), c(2, 5, 8)]

new_data <- c(type$`演苦李腳黨_1`, 
  type$`飽組每姐採_1`, 
  type$闖偶轉久往_1) %>% as.data.frame()

name <- c(rep("test1", 28),
              rep("test2", 28),
              rep("test3", 28)) %>% as.data.frame()
new_data <- cbind(name, new_data)
colnames(new_data) <- c("test_type", "say_type")
    

t1 <- table(type$`演苦李腳黨_1`)
t2 <- table(type$`飽組每姐採_1`)
t3 <- table(type$`闖偶轉久往_1`, type$`飽組每姐採_1`)