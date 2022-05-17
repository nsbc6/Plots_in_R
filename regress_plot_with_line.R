#https://indrajeetpatil.github.io/ggstatsplot/

library(ggplot2)
library(ggpmisc)
library(openxlsx)
library(ggpubr)
library(ggstatsplot)

df <- data.frame(x = c(1:100))
df$y <- 2 + 3 * df$x + rnorm(100, sd = 40)
my.formula <- y ~ x
p <- ggplot(data = data, aes(x = Score_DietaMed, y = `CD4+CD49+LAG3+_ANALIT_ABS_NORM_ml`)) +
  geom_smooth(method = "lm", se=FALSE, color="black", formula = my.formula) +
  stat_poly_eq(formula = my.formula, 
               aes(label = paste(..eq.label.., ..rr.label.., sep = "~~~")), 
               parse = TRUE) +         
  geom_point()
p


# By default 
ggscatter(data, x = "Score_DietaMed", y = "CD4+CD49+LAG3+_ANALIT_ABS_NORM_ml", add = "reg.line",cor.method = "spearman") +
  stat_cor(label.y = 10) +
  stat_regline_equation(label.y = 10)

#
ggplot(data, aes(x = Score_DietaMed, y = `CD4+CD49+LAG3+_ANALIT_ABS_NORM_ml`)) + 
  geom_point() +
  stat_smooth(method = "lm", col = "red")


# EL QUE MÁS ME GUSTA
ggscatterstats(data = data, x = `Mediterranean diet score`, y = `CD8+IL10+`,
               type = "np", # spearman, pearson
               xlab = "Mediterranean diet score",
               ylab = "CD8+IL10+(thousands/ml)"
               )+ ## modifying the plot further
  theme(
    plot.title = element_text(size = 25),
    axis.text.x = element_text(size=12),
    axis.title.x = element_text(size = 16),
    axis.title.y = element_text(size = 16)
    
  )
