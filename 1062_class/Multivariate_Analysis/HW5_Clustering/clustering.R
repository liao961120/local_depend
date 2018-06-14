library(clValid)

PC_scores <- readr::read_csv("PC_scores.csv")

clusters_sing <- hclust(dist(PC_scores[, -1]), method = "single")
clusters_comp <- hclust(dist(PC_scores[, -1]), method = "complete")
clusters_avg <- hclust(dist(PC_scores[, -1]), method = "average")
clusters_ward <- hclust(dist(PC_scores[, -1]), method = "ward.D2")


methods <- c("ward", "single", "complete", "average")
intern <- clValid(scale(PC_scores[,-1]), nClust = 1:10, 
              clMethods = "hierarchical", 
              validation = "internal",
              method = "ward")