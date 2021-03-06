% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/print_plbpsm.R
\name{print.plbpsm}
\alias{print.plbpsm}
\title{Print a Bivariate Penalized Spline based on Triangulation object.}
\usage{
\method{print}{plbpsm}(x, ...)
}
\arguments{
\item{x, ...}{fitted model objects of class plbpsm as produced by \code{plbpsm()}.}
}
\description{
The default print method for a \code{plbpsm} object.
}
\details{
Prints out the family, model formula, and etc. (need to be decided) See \code{\link{plbpsmObject}} (or \code{names(x)}) for a listing
 of what the object contains. \code{\link{summary.plbpsm}} provides more detail.
 Note that the optimized smoothing penalty parameter selection criterion reported is one of GCV, CV.
}
