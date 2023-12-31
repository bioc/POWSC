% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/runDE.R
\name{runDE}
\alias{runDE}
\title{A wrapper function for calling DE genes. This contains two methods: MAST and SC2P}
\usage{
runDE(sce, DE_Method = c("MAST", "SC2P"))
}
\arguments{
\item{sce}{is a simulated scRNA-seq dataset with two-group conditions, e.g., treatment vs control.}

\item{DE_Method}{is a string chosen from "MAST" or "SC2P".}
}
\value{
a list of three tables: the first table summaries the DE result for both forms of DE genes. cont table represents the result for continous case. disc table shows the result for discontinous case.
}
\description{
A wrapper function for calling DE genes. This contains two methods: MAST and SC2P
}
\examples{
data("es_mef_sce")
sce = es_mef_sce[, colData(es_mef_sce)$cellTypes == "fibro"]
set.seed(123)
rix = sample(1:nrow(sce), 500)
sce = sce[rix, ]
estParas = Est2Phase(sce)
simData = Simulate2SCE(n=100, estParas1 = estParas, estParas2 = estParas)
sim_sce = simData$sce
DErslt = runDE(sim_sce)
}
