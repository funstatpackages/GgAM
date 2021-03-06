% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot_plbpsm.R
\name{plot.plbpsm}
\alias{plot.plbpsm}
\title{Default PLBPSM plotting}
\usage{
\method{plot}{plbpsm}(x, residuals = FALSE, pages = 0, select = NULL,
  xlab = NULL, ylab = NULL, main = NULL, ylim = NULL,
  xlim = NULL, n1 = 40, n2 = 40, ...)
}
\arguments{
\item{x}{a fitted \code{plbpsm} object as produced by \code{plbpsm}}

\item{residuals}{If \code{TRUE} then a histogram of standardized residuals will be added.}

\item{pages}{(default 0) the number of pages over which to spread the output. For example,
if \code{pages=1} then all terms will be plotted on one page with the layout performed
automatically. Set to 0 to have the routine leave all graphics settings as they are.}

\item{select}{Allows the plot for a single model term to be selected for printing. e.g. if you
just want the plot for the second smooth term set \code{select=2}.}

\item{xlab}{If supplied then this will be used as the x label for all plots.}

\item{ylab}{If supplied then this will be used as the y label for all plots.}

\item{main}{Used as title for plots if supplied.}

\item{ylim}{If supplied then this pair of numbers are used as the y limits for each plot.}

\item{xlim}{If supplied then this pair of numbers are used as the x limits for each plot.}

\item{n1}{number of points used in x axis in each plot.}

\item{n2}{number of points used in y axis in each plot.}

\item{...}{other graphics parameters to pass on to plotting commands. See details for
smooth plot specific options.}
}
\description{
Takes a fitted \code{plbpsm} object produced by \code{plbpsm()} and plots the triangulation of
location data points, predicted surface of bivariate smooth function and optionally produces
histogram of residuals for the model.
}
\details{
Used R package \code{fdaPDE} and \code{plotly} to draw triangulation plot and predicted surfaces. See
\code{plbpsm:::plot.plbpsm.smooth}.
}
\examples{
library(MASS)
library(grpreg)

# irregular domain:
library(GgAM)
library(BPST)
data("eg1pop_dat")
eg1_V2=eg1pop_dat[['V2']]
eg1_T2=eg1pop_dat[['T2']]
eg1pop_rho03=eg1pop_dat[['rho03']]
n=1000
Npop=nrow(eg1pop_rho03)
# ind.pop=(1:Npop)[!is.na(eg1pop_rho03[,1])]
ind.pop=(1:Npop)
sam.ind=sort(sample(ind.pop,n,replace=FALSE))
sam=eg1pop_rho03[sam.ind,]
lambda=10^(seq(-2,5,by=1))
data=sam
formula=Y~z1+z2+z3+z4+z5+z6+z7+z8+b(x1,x2,V=eg1_V2,Tr=eg1_T2,d=2,r=1,lambda=lambda)
res=plbpsm(formula=formula,data=as.data.frame(data))
plot(res,residuals=TRUE,n1=80,n2=50)

### GGAM ###
data(dat_poi_ggams)
n=100
Npop=nrow(dat_poi_ggams)
# ind.pop=(1:Npop)[!is.na(eg1pop_poi2[,1])]
ind.pop=(1:Npop)
sam.ind=sort(sample(ind.pop,n,replace=FALSE))
sam=dat_poi_ggams[sam.ind,]
data=sam
formula=y~u(x1)+u(x2)+u(x3)+b(s1,s2,V=eg1_V2,Tr=eg1_T2,d=2,r=1)
res_eg1_poi_add=plbpsm(formula=formula,data=as.data.frame(data),family='poisson')
summary(res_eg1_poi_add)
plot(res_eg1_poi_add)
}
