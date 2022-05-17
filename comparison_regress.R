library(openxlsx)
library(ggplot2)
library(ggpmisc)

datos <- read.xlsx("~/Documents/combination_ALLmRNA_and_ALLprot.xlsx")

rna <- datos[, which(colnames(datos) == "ave_PRE.x")]
l.rna <- log(rna)
prot <- datos[, which(colnames(datos) == "ave_PRE.y")]
l.prot <- log(prot)


df <- as.data.frame(cbind(as.numeric(rna), as.numeric(prot)))
colnames(df) <- c("rna", "prot")
df.lg <- as.data.frame(cbind(as.numeric(l.rna), as.numeric(l.prot)))
colnames(df.lg) <- c("l.rna", "l.prot")


ggplot(df.lg,aes(x = l.rna, y = l.prot)) + 
  geom_point() + 
  geom_smooth(method = "lm", se=FALSE) +
  xlab("Log mRNA exp")+
  ylab("Log prot exp")+
  ggtitle("PRE")

