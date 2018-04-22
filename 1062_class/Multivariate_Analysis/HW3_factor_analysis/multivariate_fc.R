###### FUNCTIONS for MULTIVARIATE ANALYSIS #######
#################################################

############### QQ plot function ###################
# input variables: x, ID="none"(vector of ID), theme=NULL, color="red"(color of point), 
#                  text=TRUE(ID label beside points), text_adj=c(hjust=-0.1, vjust=0, size=3)
# output: scatter ggplot with quantiles on x-axis, ordered x_value on y-axis

QQplot <- function(x, ID="none", theme=NULL, color="red", 
                    text=TRUE, text_adj=c(hjust=-0.1, vjust=0, size=3)) {
    library(dplyr)
    library(ggplot2)
    
    x <- as_data_frame(x) 
    n <- nrow(x)
    quantiles <- qnorm(p=seq(0.5/n, 1-0.5/n, 1/n))
    
    if (ID == "none") { # assign ID if not passed
        ID <- as.character(1:n)
    } else {
        ID <- as_data_frame(ID)
        ID <- as.character(ID[[colnames(ID)]])
        }
    
    if (text == TRUE) {
        text <- geom_text(aes(label=ID),
                              hjust=text_adj[1],
                              vjust=text_adj[2],
                              size = text_adj[3])
    } else {text <- NULL}
    
    data <- cbind(ID, x)
    colnames(data) <- c("ID", "x")
    data <- data %>% arrange(x) %>% mutate(quantile=quantiles)
    
    pl <- ggplot(data, aes(x=quantiles, y=x))+
        geom_point(color=color)+
        text + theme +
        labs(x="Predicted Quantile",
             y="x",
             title="Q-Q Plot")
    pl
}


######## Scree Plot ###############
## X: PCA list(contains 'sdev')

scree_plot <-
    scree_plot <-
    function (X,
              choice = c("eigenvalue", "variance"),
              double_axis = TRUE,
              axis_limits=NULL,
              sub_axis_name = "n",
              geom = c("line"), # "bar"
              barfill = "steelblue",
              barcolor = "steelblue",
              linecolor = "black",
              ncp = 10,
              addlabels = FALSE,
              hjust = 0,
              main = NULL,
              xlab = NULL,
              ylab = NULL,
              ggtheme = theme_minimal(),
              ...)
    {
        eig <- factoextra::get_eigenvalue(X)
        eig <- eig[1:min(ncp, nrow(eig)), , drop = FALSE]
        choice <- choice[1]
        if (choice == "eigenvalue") {
            eig <- eig[, 1] #??
            text_labels <- round(eig, 1)
            if (is.null(ylab))
                ylab <- "Eigenvalue"
        }
        else if (choice == "variance") {
            eig <- eig[, 2]
            text_labels <- paste0(round(eig, 1), "%")
        }
        else
            stop("Allowed values for the argument choice are : 'variance' or 'eigenvalue'")
        if (length(intersect(geom, c("bar", "line"))) == 0)
            stop("The specified value(s) for the argument geom are not allowed ")
        df.eig <- data.frame(dim = factor(1:length(eig)), eig = eig)
        extra_args <- list(...)
        bar_width <- extra_args$bar_width
        linetype <- extra_args$linetype
        if (is.null(linetype))
            linetype <- "solid"
        p <- ggplot(df.eig, aes(dim, eig, group = 1))
        if ("bar" %in% geom)
            p <- p + geom_bar(
                stat = "identity",
                fill = barfill,
                color = barcolor,
                width = bar_width
            )
        if ("line" %in% geom)
            p <-
            p + geom_line(color = linecolor, linetype = linetype) +
            geom_point(shape = 19, color = linecolor)
        if (addlabels)
            p <- p + geom_text(label = text_labels,
                               vjust = -0.4,
                               hjust = hjust,
                               size=3.5)
        if (is.null(main))
            main <- "Scree plot"
        if (is.null(xlab))
            xlab <- "Dimensions"
        if (is.null(ylab))
            ylab <- "Percentace of Variance Accounted (%)"
        if (double_axis)
            if (choice == "eigenvalue") {
                if (sub_axis_name == "n") {
                    sub_axis_name <- "Percentace of Variance Accounted (%)"
                }
                p <- p + scale_y_continuous(limits=axis_limits, sec.axis = 
                            sec_axis(~ . / sum(eig) * 100,
                            name = sub_axis_name))
            } else if (choice == "variance") {
                if (sub_axis_name == "n") {
                    sub_axis_name <- "Eigenvalue"
                }
                eigen <- factoextra::get_eigenvalue(X)[, 1]
                p <- p + scale_y_continuous(limits=axis_limits, sec.axis = 
                            sec_axis(~ . / 100 * sum(eigen),
                                     name = sub_axis_name))
            }
        else { # not double-axis
            p <- p + scale_y_continuous(limits=axis_limits)
        }
        p <- p + labs(title = main, x = xlab, y = ylab)
        p
        # ggpubr::ggpar(p, ggtheme = ggtheme, ...)
    }