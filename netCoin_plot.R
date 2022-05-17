library(ggplot2)
library(netCoin)


plot(surCoin(data = categorical_vars, variables = c(colnames(categorical_vars)),
             size = 4)) # plot network object
