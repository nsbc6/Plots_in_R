library(plotly)

#https://github.com/Dragonmasterx87/Interactive-3D-Plotting-in-Seurat-3.0.0/blob/master/3D%20UMAP%20Plotting%20v1.3.R

# yourseuratobject <- RunUMAP(yourseuratobject,
#                             dims = 1:10,
#                             n.components = 3L)




# Prepare a dataframe for cell plotting
plot.data <- FetchData(object = together, vars = c("UMAP_1", "UMAP_2", "UMAP_3", "SCT_snn_res.0.3",
                                                   "Condition", "sample_id", "FDCSP", "TG", "CFD",
                                                   "CD3D"))

# Make a column of row name identities (these will be your cell/barcode names)
plot.data$label <- paste(rownames(plot.data))

# Plot your data, in this example my Seurat object had 21 clusters (0-20)
fig <- plot_ly(data = plot.data, 
               x = ~UMAP_1, y = ~UMAP_2, z = ~UMAP_3, 
               color = ~Condition,  #what you want to plot
               colors = c("lightseagreen",
                          "gray50",
                          "darkgreen",
                          "red4",
                          "red",
                          "turquoise4",
                          "black",
                          "yellow4",
                          "royalblue1",
                          "lightcyan3",
                          "peachpuff3",
                          "khaki3",
                          "gray20",
                          "orange2",
                          "royalblue4",
                          "yellow3",
                          "gray80",
                          "darkorchid1",
                          "lawngreen",
                          "plum2",
                          "darkmagenta"),
               type = "scatter3d", 
               mode = "markers", 
               marker = list(size = 1.5, width=2), # controls size of points
               text=~label, #This is that extra column we made earlier for which we will use for cell ID
               hoverinfo="text") #When you visualize your plotly object, hovering your mouse pointer over a point shows cell names

