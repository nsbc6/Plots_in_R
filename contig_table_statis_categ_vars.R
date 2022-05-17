# ========================================================================== #
# ========================================================================== #
################### STATISTICS WITH CATEGORICAL VARIABLES ####################
# ========================================================================== #
# ========================================================================== #

# http://www.sthda.com/english/wiki/chi-square-test-of-independence-in-r

# ========================================================================== #
################################## PACKAGES ##################################
# ========================================================================== #

library("gplots")
library("graphics")
library("vcd")
library(corrplot)

# ========================================================================== #
# ========================================================================== #

name_categ_var_1 <- "Incidental"
name_categ_var_2 <- "Exitus"

categ_var_1 <- bbdd_TNE$Incidental
categ_var_2 <- bbdd_TNE$Exitus

######### CONTINGENCY TABLE ##########

contig_table <- table(categ_var_1,categ_var_2)
dt <- as.table(as.matrix(contig_table))


######### CHI SQUARE #########

cs_results <- chisq.test(bbdd_TNE$Incidental, bbdd_TNE$Exitus)
name_vs <- paste("Chi square =", round(cs_results$p.value, 8))


########## BALLOON PLOT

balloonplot(t(dt), main = name_vs , xlab =name_categ_var_2, ylab=name_categ_var_1,
            label = FALSE, show.margins = FALSE)


########## MOSAIC PLOT

mosaicplot(dt, xlab = name_categ_var_1, ylab = name_categ_var_2,
           shade = TRUE, las=2,
           main = name_vs)


########## 

assoc(dt, row_vars = name_categ_var_1, col_vars = name_categ_var_2,
      shade = TRUE, las=3)


########## CORRPLOT

corrplot(cs_results$residuals, is.cor = FALSE,
         title = "Sarcopenia v2 Tipo exitus", mar=c(0,0,1,0))
