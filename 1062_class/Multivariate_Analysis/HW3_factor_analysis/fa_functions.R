# library(psych)
# library(robustfa)
bulls <- readr::read_table2("T1-10.dat", col_names = FALSE)
colnames(bulls) <- c("Breed", "SalePr", "YrHgt", 
                     "FtFrBody", "PrctFFB", "Frame",
                     "BkFat", "SaleHt", "SaleWt")
bulls <- as.data.frame(bulls[,-c(1,9)])

library(robustfa)

rob_cov_pfa <- factorScorePfa(bulls, factors = 3, covmat = NULL, cor = FALSE, rotation = "varimax", scoresMethod = "regression")

rob_cov_pca <- factorScorePca(bulls, factors = 3, covmat = NULL, cor = FALSE, rotation = "varimax", scoresMethod = "regression")


fa_cov_pa <- psych::fa(cov(bulls), nfactors=3, rotate="varimax", covar = T, fm="pa", scores="regression")

fa_cov_mle <- psych::fa(cov(bulls), nfactors=3, rotate="varimax", covar = T, fm="mle", scores="regression")