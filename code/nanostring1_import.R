# import nanostring data
# Heather Burris
# Started 1/27/2014

library(NanoStringNorm)
library(gdata)
installXLSXsupport()
installXLSXsupport(perl = "C:/Strawberry/perl/bin/perl.exe")


path.data <- "C:/Users/heburris/Dropbox/Cervix paper/RNA/RCC/miRNARCC"
list.files(file.path(path.data))
path.to.xls.file <- system.file( "RCCCollector_miRNA_v2.xls",
package = "NanoStringNorm")
NanoString.mRNA <- read.xls.RCC(x = file.path(path.data, "RCCCollector_miRNA_v2.xlsx"),  sheet = 1)
df1<-NanoString.mRNA <- read.xls.RCC(x = file.path(path.data, "RCCCollector_miRNA_v2.xlsx"),  sheet = 1)
df1
str(df1)

## Loosest- not stringent
##Next, run a typical normalization. The following is reasonable and in many situations will be sucient to handle
##technical variation. Note the use of the `mean' option for Background correction. This is the least conservative
##method of summarizing negative controls and will increase the number of observed false positives due to elevated
##uncertainty at lower expression values.
##By default the output is a list of sample and gene summary data.frames. In the following example only the
##matrix of normalized values is output.

# normalize mRNA and output a matrix of normalized counts

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

### Normalize w/ geo mean due to miRNA issues
##NanoStringNorm prints informative diagnostic messages to the screen. Specically, samples that have normalization
##factors three standard deviations from the mean are 
##agged for review. These large values could re
##ect a technical
##problem and dramatically influ
####uence all normalization.
##In the following example the geometric mean is used to summarize the CodeCount (positive) and SampleContent
##(houskeeping) controls. This minimizes the impact of outlier values. Also, a stringent background correction is
##applied (mean + 2 standard deviations) which removes a large proportion of false positives and therefore increases
##specifcity at the expense of some sensitivity. For preliminary analysis it can be easier to focus on high condence
##results first. For these reasons, the following model is recommended as a first step. Adjustments, can be made
##based on review of diagnostics.
##For miRNA data the use of mRNA or RNU's can be problematic, so change the SampleContent method to
##'top.geo.mean'.
##'
NanoString.mRNA.norm <- NanoStringNorm(
x = NanoString.mRNA,
CodeCount = 'geo.mean',
Background = 'mean.2sd',
SampleContent = 'housekeeping.geo.mean',
round.values = TRUE,
take.log = TRUE
);

#Try to upload to GIT

