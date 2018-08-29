library(caret)
library(ggplot2)

#使用できる手法
#http://topepo.github.io/caret/available-models.html
method.vec <- c("rf",
                "treebag",
                "logicBag",
                "bagEarth",
                "bagEarthGCV",
                "bag",
                "bartMachine",
                "bayesglm",
                "gamboost",
                "glmboost",
                "BstLm",
                "bstSm",
                "blackboost",
                "bstTree",
                "rpart",
                "rpart1SE",
                "rpart2",
                "cforest",
                "ctree",
                "ctree2",
                "xgbDART",
                "xgbLinear",
                "xgbTree",
                "elm",
                "gaussprLinear",
                "gaussprPoly",
                "gaussprRadial",
                "gamLoess",
                "bam",
                "gam",
                "gamSpline",
                "glm",
                "glmStepAIC",
                "glmnet",
                "kknn",
                "knn",
                "svmLinear3",
                "logreg",
                "avNNet",
                "monmlp",
                "mlp",
                "mlpWeightDecay",
                "mlpWeightDecayML",
                "mlpML",
                "msaenet",
                "mlpSGD",
                "mlpKerasDropout",
                "mlpKerasDecay",
                "earth",
                "gcvEarth",
                "mxnet",
                "mxnetAdam",
                "nnet",
                "pcaNNet",
                "null",
                "parRF",
                "partDSA",
                "kernelpls",
                "pls",
                "simpls",
                "widekernelpls",
                "plsRglm",
                "rbf",
                "rbfDDA",
                "ranger",
                "Rborist",
                "extraTrees",
                "rfRules",
                "RRF",
                "RRFglobal",
                "xyf",
                "spls",
                "dnn",
                "gbm",
                "svmBoundrangeString",
                "svmExpoString",
                "svmLinear",
                "svmLinear2",
                "svmPoly",
                "svmRadial",
                "svmRadialCost",
                "svmRadialSigma",
                "svmSpectrumString",
                "evtree",
                "nodeHarvest",
                "Bioconductor")

#文字からformula
chr2formula <- function(y, x){
  ret <- paste0(y, "~", paste(x, collapse = "+"))
  ret <- as.formula(ret)
  return(ret)
}









