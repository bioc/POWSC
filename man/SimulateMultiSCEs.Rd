% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/simData.R
\name{SimulateMultiSCEs}
\alias{SimulateMultiSCEs}
\title{Simulate the data for multiple-group comparisons; e.g., different cell types in blood
It simulates the DE changes in two forms corresponding two types of DE genes}
\usage{
SimulateMultiSCEs(
  n = 1000,
  estParas_set,
  multiProb,
  delta1 = 0.1,
  delta2 = 0.5
)
}
\arguments{
\item{n}{the number of total cells for multiple groups; e.g., 1000, 2000, and etc.}

\item{estParas_set}{a set of parameters corresponding to different cell types.}

\item{multiProb}{a vector of probilities correponding to each cell type. It is not necessary to sum up to 1 because POWSC will normalize internally.}

\item{delta1}{the minimum of expression change used to determine the Form I DE.}

\item{delta2}{the minimum of log fold change used to determine the Form II DE.}
}
\value{
a list of simulated datasets. Each dataset corresponds to a pair-wise comparison including a series of metrics such as the DE gene indices for Form I and II DE genes, and simulated expression data in singlecellexperiment format.
}
\description{
Simulate the data for multiple-group comparisons; e.g., different cell types in blood
It simulates the DE changes in two forms corresponding two types of DE genes
}
\examples{
data("es_mef_sce")
set.seed(123)
rix = sample(1:nrow(es_mef_sce), 500)
es_mef_sce = es_mef_sce[rix, ]
sce1 = es_mef_sce[, colData(es_mef_sce)$cellTypes == "fibro"]
estParas1 = Est2Phase(sce1)
sce2 = es_mef_sce[, colData(es_mef_sce)$cellTypes == "stemCell"]
estParas2 = Est2Phase(sce2)
estParas_set = list(celltype1 = estParas1, celltype2 = estParas1, celltype3 =estParas2)
multiProb = c(0.2, 0.3, 0.5)
simData = SimulateMultiSCEs(n=200, estParas_set = estParas_set, multiProb = multiProb)
}
