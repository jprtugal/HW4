\name{myLT}
\alias{myLT}}
\title{myLT}}
\usage{
myLT<-function(x,mx,dx,ax=.5,initpop = 100000)
}
\arguments{
\item{x}{vector of ages or years}

\item{mx}{death/mortality rate}

\item{dx}{total deaths at age interval}

\item{initpop}{initial population at time 0}

\item{ax}{time alive in age interval for deaths in that same interval (most commonly set to .5)}
}
\itemize{
 	\item qx survival probability
	\item cumul cumulative hazard
	\item lx total number of people alive at interval, initpop is used to set the initial population
	\item Lx total number of person years at interval
	\item tx average number of person years at interval
	\item ex average expected years remaining at each interval
}
\description{
	Returns a life table object as well as a corresponding surviorship plot. Straighforward measurements and an "easy on the eyes" survivorship plot.
}
\details{
works only with numeric data, vectors of equal length, initial population can be altered
}
\examples{
	(using the "ahmd" dataset from MortalityLaw package)

	x<-seq(0,length(mx),1)

	ex<-ahmd$ex[,1];mx#crude death rate

	dx<-ahmd$Dx[,1];dx#death count

	myLT(x,ex,dx, initpop = 100000)
}
