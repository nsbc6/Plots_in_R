library(corrplot)
library(openxlsx)
library(dplyr)
library(tidyverse)


rebeca <- read.xlsx("~/Desktop/Matriz correlacion TMas.xlsx")
to_cor <- as.matrix(apply(to_cor,2, as.numeric))
#rebeca <- rebeca[,-c(2:9)]

corr <- cor(as.matrix(to_cor), use = "complete.obs", method = "spearman") #
corr2 <- cor.mtest(as.matrix(to_cor), method= "spearman", use = "complete.obs")
#corr2 %>% cor_get_pval()

        
            png("~/Diabetes probi/Ana_complete/Ana_complete/ANÁLISIS_DEFINITIVO_FACS_NOV2021/RESELECCIÓN_TR1/cor_spearman_probi_y_manarini_N43_varCLins_colest_comp.png",
                width = 1500, height = 1500,res = 100)
            corrplot(corr, type = "lower",
                     insig = "label_sig",
                     p.mat = corr2$p,
                     sig.level = c(.001, .01, .05),
                     pch.cex = 0.75, # tamaño asterisco
                     pch.col = "white") # order = "hclust"
            dev.off()

corrplot(corr, p.mat = corr2$p, type="lower",insig = "pch", 
         addrect=3,
         sig.level = .05,
         pch = corr2$p)
corrplot(corr, type="lower", order="hclust", p.mat = corr2$p, insig = "label_sig",
         sig.level = 0.05, pch.cex = .6, pch = c(0.05, 0.01 , 0.001))

