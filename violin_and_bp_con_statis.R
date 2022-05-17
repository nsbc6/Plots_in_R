library(ggplot2)
library(ggstatsplot)
library(dplyr)
library(ggrepel)
library(ggsignif)

#https://cran.r-project.org/web/packages/ggstatsplot/ggstatsplot.pdf
#https://cran.r-project.org/web/packages/ggstatsplot/index.html
#https://cran.r-project.org/web/packages/ggstatsplot/vignettes/additional.html#additional-vignettes

p <- ggbetweenstats(
  data = mujeres,
  x = Type_patients, ## grouping/independent variable
  y = ` CD4+IL10+ analitica en ml`, ## dependent variables
  type = "p", ## type of statistics: PARAMETRIC TEST OR NOT
  #xlab = "Exitus", ## label for the x-axis
  ylab = "CD4+IL10+ (thousands/ml)", ## label for the y-axis
  plot.type = "boxviolin", ## type of plot,
  #results.subtitle = F,
  outlier.tagging = FALSE, ## Do we want to emphasize outliers?
  outlier.coef = 1.5, ## coefficient for Tukey's rule
  outlier.label = NULL , ## label to attach to outlier values
  outlier.label.args = list(color = "red"), ## outlier point label color
  pairwise.comparisons = FALSE,
  pairwise.annotation = "asterisk",
  centrality.type = "mean", #Decides el punto que quieres mostrar
  centrality.label.args = list(size = 4.5, nudge_x = 0.5, segment.linetype = 3,
                               min.segment.length = 0), #Ajustar punto media
  ## turn off messages
  ggtheme = ggplot2::theme_classic(), ## a different theme
  package = "yarrr", ## package from which color palette is to be taken
  palette = "info2", ## choosing a different color palette
  title = "Women CD4+IL10+",
  ggplot.component = list(theme(text = element_text(size = 16)))
  #caption = "Source: Gapminder Foundation"
) + ## modifying the plot further
  ggplot2::scale_y_continuous(
    limits = c(0,750),
    breaks = seq(from = 0, to = 750, by = 50))+
  #scale_x_discrete(labels = c("Alive", "Exitus"))+
  theme( # We use it to modify font size
    plot.title = element_text(size = 25, face = "bold"),
    axis.text.x = element_text(size=14,colour = "black"),
    axis.text.y = element_text(size=14,colour = "black"),
    #axis.title.x = element_text(size = 16),
    axis.title.x = element_blank(),
    axis.title.y = element_text(size = 16),
    axis.text=element_text(size=15),
    axis.title=element_text(size=14,face="bold")
    
)

### To add asterisks

(df <-
   pairwise_comparisons(mujeres, x = Type_patients,  y = ` CD4+IL10+ analitica en ml`,
                        paired = F,type = "parametric") %>%
   dplyr::mutate(groups = purrr::pmap(.l = list(group1, group2), .f = c)) %>%
   dplyr::arrange(group1) %>%
   dplyr::mutate(asterisk_label = c("**")))
 p_comp <- p + ggsignif::geom_signif(
 comparisons = df$groups,
 map_signif_level = TRUE,
 annotations = df$asterisk_label,
 textsize = 10,
 y_position = c(650),
 test = NULL,
 na.rm = TRUE
)


png("~/Diabetes probi/Ana_complete/Ana_complete/ANÁLISIS_DEFINITIVO_FACS_NOV2021/RESELECCIÓN_TR1/PROBI/NORM_BY_BLOOD/GLP1_wih_contr_CD4+CD49+LAG3+IL10+FOXP3+.png",
    width = 750, height = 500)

p_comp

 dev.off()