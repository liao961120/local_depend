hemo <- readr::read_table2("T11-8.DAT", col_names = FALSE,
                           col_types = cols(X1 = col_character())
)

###### APER (lda) #####
library(MASS)
lda <- lda(formula = group ~ activity + antigen,
           prior=c(1,1)/2, data = hemo)
lda_prdict <- predict(lda)$class

confus_mt <- table(hemo$group, lda_prdict, dnn = c('Actual Group','Predicted Group'))
(confus_mt[1,2] + confus_mt[2,1])/sum(confus_mt)

####### Holdout Procedure(lda) ######
lda_hold <- lda(formula = group ~ activity + antigen, 
                CV=TRUE, prior=c(1,1)/2, data = hemo)

confus_mt_hold <- table(hemo$group, lda_hold$class, 
      dnn = c('Actual Group','Predicted Group'))
## Error Rate: Exp_AER
(confus_mt_hold[1,2] + confus_mt_hold[2,1])/sum(confus_mt_hold)

######## Holdout Procedure (Manual) ######
data <- hemo
n1_m <- 0 # holdouts misclassified as 2 in n1
n2_m <- 0 # holdouts misclassified as 2 in n1
pre_group_vec <- vector(mode = "character",length = nrow(data))
for (i in 1:nrow(data)){
    holdout <- data[i,]
    data <- data[-i,]
    
    library(MASS)
    r2 <- lda(formula = group ~ activity + antigen, 
              data = data)
    predicted_group <- predict(r2, newdata = holdout)$class
    pre_group_vec[i] <- predicted_group
    if (predicted_group != holdout$group) {
        if (holdout$group == "1") n1_m = n1_m + 1
        else n2_m = n2_m + 1
    }
    data <- hemo
}
confu_mt <- table(data$group, pre_group_vec, 
                  dnn = c('Actual Group','Predicted Group'))
Exp_AER <- (n1_m + n2_m)/nrow(data)


####### Calculate discriminant fc (Pure manual) #######
x1_bar <- hemo[hemo$group == "1",2:3] %>% colMeans()
x2_bar <- hemo[hemo$group == "2",2:3] %>% colMeans()

S1 <- hemo[hemo$group == "1", 2:3] %>% cov()
S2 <- hemo[hemo$group == "2", 2:3] %>% cov()

n1 <- hemo[hemo$group == "1",] %>% nrow
n2 <- hemo[hemo$group == "2",] %>% nrow


S_pool <- ((n1 - 1)*S1 + (n2 - 1)*S2)/(n1 + n2 - 2)

a <- solve(S_pool) %*% (x1_bar - x2_bar)

cutoff <- .5 * (x1_bar - x2_bar) %*% solve(S_pool) %*% (x1_bar + x2_bar)