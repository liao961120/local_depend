## input factor loading matrix, output df with highlighted loadings

format_loading_matrix <- function(loading, criterion=0.5, markdown=T) {
    df <- as.data.frame(loading)
    df_index <- df
    
    library(dplyr)
    for (j in 1:ncol(df)){ #for1
        for (i in 1:nrow(df)){
            if (markdown) {  # latex output
                if (abs(df_index[i,j]) > abs(criterion)){
                    df[i,j] <- paste("**", df[i, j], "**", sep = "")
                }
            } #end latex output
            else { # HTML output
                if (abs(df_index[i,j]) > abs(criterion)){
                    df[i,j] <- paste('<span style="color:red">', df[i, j], '</span>', sep="")
                }
            }#end html output
        }#end for2
    }#end for1
df
} #end fc
