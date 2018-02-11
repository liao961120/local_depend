
## Setting up .Rmd

### Global code chunk behaviour

```r
knitr::opts_chunk$set(echo=FALSE, message=FALSE, warning=FALSE, comment="")
```
- `echo=FALSE`: Don't display codes in code chunks.

- `message=FALSE`, `warning=FALSE`: Don't display message/warning after executing the code chunks.

- `comment=""`: Change `##`(default) to nothing when showing text output from code chunks.

#### Speed up Knitting
The code below speeds up knitting by not evaluating cached code chunks but instead load them from previously saved databases. 
```r
knitr::opts_chunk$set(cache=TRUE) # speed up knitting process
```


### Directory Structure

While knitting, the working directory is forced to change to the directory where the current `.Rmd` file is (by default). This can cause a headache if you are sourcing file from the upper level directories. 

For example, my `.Rmd` file is in `/Rmd` under the project working directory, and the data is in `/data` under the same project working directory. While knitting, the working directory temporarily changes to `/Rmd`, so in order to source file from `/data`, I have to move the working directory up a level (i.e. back to the project working directory).

I can do this by including the code below in the r setup code chunk at the begining of the `.Rmd` file.
```r
knitr::opts_knit$set(root.dir='..') # set root directory
```

## Setting up .Rprofile

```r
options(continue = " ")  ## setting new line head to blank ("+", original) in console
```

## Some Arguments of `options`
```r
options(prompt = "> ", digits = 4, show.signif.stars = FALSE, continue = " ")
```