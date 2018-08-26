library(caret)
library(ggplot2)

method.vec <- c("rf")

#文字からformula
chr2formula <- function(y, x){
  ret <- paste0(y, "~", paste(x, collapse = "+"))
  ret <- as.formula(ret)
  return(ret)
}









