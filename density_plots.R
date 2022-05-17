# ==================================================================================== #
# ==================================================================================== #
#################################### DENSITY PLOTS #####################################
# ==================================================================================== #
# ==================================================================================== #

library(ggplot2)
library(ggsignif)
library(ggpubr)
library(dplyr)

############ MEAN

mu <- ddply(bbdd_TNE[which(bbdd_TNE$Sexo == 1),], "Exitus", summarise,
            grp.mean=mean(BASAL_Total_muscle_NORM_mean.x))


############ PLOT
plotin <- ggplot(bbdd_TNE[which(bbdd_TNE$Sexo == 1),],
       aes(x=BASAL_Total_muscle_NORM_mean.x,
           fill=as.factor(bbdd_TNE[which(bbdd_TNE$Sexo == 1),"Exitus"]))) +
  geom_density(alpha=0.4)+
  geom_vline(data=mu, aes(xintercept=grp.mean, color = Exitus),
             linetype="dashed",show.legend = F)+
  xlab("Total muscle mass (cm²/m²)")+
  ylab("Density in women")+
  scale_x_continuous(breaks = seq(from = 25, to = 65, by = 5)) +
  scale_color_manual(values = c("#FFCC33", "#990099")) +
  scale_fill_manual(values = c("#FFCC33", "#990099"))+
  theme_classic()+
  theme(
    plot.title = element_text(size = 25, face = "bold"),
    axis.text.x = element_text(size=14,colour = "black"),
    axis.text.y = element_text(size=14,colour = "black"),
    #axis.title.x = element_text(size = 16),
    axis.title.x = element_text(size = 17),
    axis.title.y = element_text(size = 17),
    axis.text=element_text(size=15),
    axis.title=element_text(size=14,face="bold"),
    legend.title = element_blank(),
    legend.text = element_text(size=12)
    
)

plotin


png("~/CT/Body_composition/Análisis con muestra definitiva N= 104/Figuras/density_plot_TMA_exitus_women.png",
    width = 750, height = 500)
plotin
dev.off()
