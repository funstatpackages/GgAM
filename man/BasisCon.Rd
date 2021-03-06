% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/BasisCon.R
\name{BasisCon}
\alias{BasisCon}
\title{Basis Construction Function}
\usage{
BasisCon(object, data)
}
\arguments{
\item{object}{is a smooth specification object or a smooth object.}

\item{data}{A data frame, model frame or list containing the values of the (named) covariates
at which the smooth term is to be evaluated. If it’s a list then n must be supplied.}
}
\value{
a list of \code{smooth} objects are returned. Many of the outputs are from \code{b} function.
Other outputs include all the information related to berstein basis.
}
\description{
Smooth terms in a \code{plbpsm} formula are turned into smooth specification objects of class
 xx.smooth.spec during processing of the formula. Each of these objects is converted to
 a smooth object using an appropriate \code{BasisCon} function.
}
\details{
It is the wrapper function which calls basis constructing method.
}
\examples{
library(BPST)
data("eg1pop_dat")
eg1_V2=eg1pop_dat[['V2']]
eg1_T2=eg1pop_dat[['T2']]
eg1pop_rho03=eg1pop_dat[['rho03']]
sam=eg1pop_rho03[sample(1:dim(eg1pop_rho03)[1],70),]

# bivariate spline
BI <- BasisCon(b(x1,x2,d=2,r=1,V=eg1_V2,Tr=eg1_T2),sam)
# univariate spline
BI <- BasisCon(u(z1),sam)
}
