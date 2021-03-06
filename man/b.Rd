% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/b.R
\name{b}
\alias{b}
\title{Defining smooths in PLBPSM formulae}
\usage{
b(..., d = NULL, r = NULL, V = NULL, Tr = NULL, b = NULL,
  nt = NULL, Holes = NULL, B = NULL, Q2 = NULL, K = NULL,
  ind = NULL, lambda = NULL, fx = FALSE, id = NULL)
}
\arguments{
\item{...}{a list of variables that are the covariates that this
smooth is a function of.}

\item{d}{degree of polynomials.}

\item{r}{smoothness and r \eqn{\leq}{\leq} d}

\item{V}{an \code{N} by two matrix that lists vertices with the \code{i}th
row storing in Cartesian coordinates for the ith vertex. \code{N} is the number of vertices.}

\item{Tr}{a \code{K} by three matrix that each row represents one triangle.
All the elements are the integers that stand for the indices of vertices in \code{V}. \code{K} is the
number of triangles.}

\item{b}{Boundary of the domain of sample points.}

\item{nt}{A parameter controls the number of total triangles.}

\item{Holes}{Information of holes of polygon.}

\item{B}{Bernstein basis matrix}

\item{Q2}{The \code{Q} matrix from QR decomposition of the constraint matrix.}

\item{K}{Energy matrix for constructing penalty matrix}

\item{ind}{An ordering indices of observation points, in which the
cnt[j]+1th to cnt[j+1]th elements are indices of points in the jth triangle.}

\item{lambda}{The default set of smoothing penalty parameter to be chosen from}

\item{fx}{indicates whether the term is a fixed d.f. regression
spline (\code{TRUE}) or a penalized regression spline (\code{FALSE}).}

\item{id}{An identifying label or number for the smooth, linking it to other smooths. Defaults to \code{NULL} for no linkage.}
}
\value{
These \code{smooth.spec} objects define bivariate smooths and are turned into bases and penalties by
\code{BasisCon} functions.
 The returned object contains the following items:
\item{d}{degree of polynomials.}
\item{r}{smoothness and \code{r}\eqn{\leq}{\leq} \code{d}.}
\item{V}{an \code{N} by two matrix that lists vertices with the \code{i}th
row storing in Cartesian coordinates for the ith vertex. \code{N} is the number of vertices.}
\item{Tr}{a \code{K} by three matrix that each row represents one triangle.
All the elements are the integers that stand for the indices of vertices in \code{V}. \code{K} is the
number of triangles.}
\item{ind}{An ordering indices of observation points corresponding to index of triangles.}
\item{B}{Bernstein basis matrix}
\item{K}{Energy matrix for constructing penalty matrix}
\item{lambda}{The default set of smoothing penalty parameter to be chosen from}
\item{term}{An array of text strings giving the names of the covariates that the term is a function of.}
\item{fixed}{\code{TRUE} if the term is to be treated as a pure regression
spline (with fixed degrees of freedom); FALSE if it is to be treated as a penalized regression spline}
\item{dim}{The dimension of the smoother - i.e. the number of covariates that it is a function of.}
\item{label}{A suitable text label for this smooth term.}
\item{id}{An identifying label or number for the smooth, linking it to other smooths. Defaults to \code{NULL} for no linkage. }
}
\description{
Function used in definition of smooth terms within \code{plbpsm} model formulae. The function does not
evaluate a (spline) smooth - it exists purely to help set up a model using spline based smooths.
}
\examples{
library(GgAM)
data(eg1pop_dat)
V=eg1pop_dat[['V2']]
Tr=eg1pop_dat[['T2']]
res <- b(x1,x2,d=2,r=1,V=V,Tr=Tr,lambda=0)
}
