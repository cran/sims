% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\name{sims_data}
\alias{sims_data}
\title{Simulated Datasets}
\usage{
sims_data(path = ".")
}
\arguments{
\item{path}{A string of the path to the directory with the simulated data.}
}
\value{
An \code{\link[nlist:nlists]{nlist::nlists_object()}} of the simulated datasets.
}
\description{
Gets the simulated datasets as an \code{\link[nlist:nlists]{nlist::nlists_object()}}.
There is no guarantee that all the datasets will fit in memory.
}
\examples{
set.seed(10)
sims_simulate("a <- runif(1)",
  nsims = 10L, path = tempdir(),
  exists = NA, ask = FALSE
)
library(nlist)
sims_data(tempdir())
}
