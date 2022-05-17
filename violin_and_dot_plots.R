####### PACKAGES

library(patchwork)
library(Seurat)
library(ggplot2)

######## DATA
#load("~/Spatial_gene_expression/Combination_of_conditions/Integration_Combination_of_Hashimotos/Combination_of_Hashimotos_R_environment.RData")


######## GENES
exp_genes_vln <- c("PTPRC", "IL6R", "KLRB1", "CCR4", "CCR6", "IL21R")
exp_genes_dot <- c("TG", "TPO",
                   "FDCSP",
                   "CFD",
                   "CD247",
                   "GZMK", "NCF1", "HMGB1", "PLCG2",
                   "TRAC", "CD3E",
                   "FCGR3A","FCGR3B",
                   "LTF")
  
######## VIOLIN PLOT  
plots <- VlnPlot(se_obj_norm, features = exp_genes_vln,
                 #split.by = "sample_id",
                 group.by = "SCT_snn_res.0.5", #resolution 
                 pt.size = 0,
                 combine = FALSE) 

png(filename = "prueba_vlns_res03_puntos.png",
    width = 1000, height = 1000)
wrap_plots(plots = plots, ncol = 1)
dev.off()


######## DOT PLOT
Idents(integrated_cond) <- "integrated_snn_res.0.3"
png(filename = "prueba_dots_res03.png",
    width = 1000, height = 1000)
DotPlot(integrated_cond, features = exp_genes_dot, 
        cols = c("blue", "red", "yellow"),
        split.by = "sample_id") + RotatedAxis()
dev.off()
