# import nanostring data
# Heather Burris
# Started 1/27/2014

library(NanoStringNorm)
library(gdata)
installXLSXsupport()
installXLSXsupport(perl = "C:/Strawberry/perl/bin/perl.exe")


path.data <- "C:/Users/heburris/Dropbox/Cervix paper/RNA/RCC/miRNARCC"
list.files(file.path(path.data))
path.to.xls.file <- system.file( "RCCCollector_miRNA.xls",
package = "NanoStringNorm")
NanoString.mRNA <- read.xls.RCC(x = file.path(path.data, "RCCCollector_miRNA.xlsx"),  sheet = 1)
df1<-NanoString.mRNA <- read.xls.RCC(x = file.path(path.data, "RCCCollector_miRNA.xlsx"),  sheet = 1)
df1
str(df1)
NanoString.mRNA.norm <- NanoStringNorm(
x = NanoString.mRNA,
anno = NA,
CodeCount = 'sum',
Background = 'mean',
SampleContent = 'housekeeping.sum',
round.values = FALSE,
take.log = FALSE,
return.matrix.of.endogenous.probes = TRUE
);
NanoString.mRNA.norm <- NanoStringNorm(
x = NanoString.mRNA,
CodeCount = 'geo.mean',
Background = 'mean.2sd',
SampleContent = 'housekeeping.geo.mean',
round.values = TRUE,
take.log = TRUE
);

