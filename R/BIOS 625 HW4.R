library(demography)
library(MortalityLaws)
library(ggplot2)
library(ggthemes)
library(devtools)
library(roxygen2)

mx<-ahmd$mx[,1];mx#crude death rate
dx<-ahmd$Dx[,1];dx#death count
x<-seq(0,length(mx),1)

#'myLT
#'
#'Returns a life table object as well as a corresponding surviorship plot
#'
#'When given the correct parameters, this function returns a complete life table containing:
#'
#' @param x vector of ages or years
#'
#' @param mx death/mortality rate
#'
#' @param dx: total deaths at age interval
#'
#' @param initpop: initial population at time 0
#'
#' @param ax time alive in age interval for deaths in that same interval (most commonly set to .5)
#'
#'
#' @return Life table containing the arementioned parameters
#'
#' @return qx: survival probability
#'
#' @return cumul: cumulative hazard
#'
#' @return lx: total number of people alive at interval, initpop is used to set the initial population
#'
#' @return Lx total number of person years at interval
#'
#' @return tx:param average number of person years at interval
#'
#' @rerurn ex: average expected years remaining at each interval
#'
#'
#' @example
#'(using the "ahmd" dataset from MortalityLaw package)
#'
#'x<-seq(0,length(mx),1)
#'
#'mx<-ahmd$mx[,1];mx#crude death rate
#'
#'dx<-ahmd$Dx[,1];dx#death count
#'
#'myLT(x,mx,dx, initpop = 100000)
#'
#'
# @export
library(demography)
library(MortalityLaws)
library(ggplot2)
library(ggthemes)
library(devtools)


mx<-ahmd$mx[,1];mx#crude death rate
dx<-ahmd$Dx[,1];dx#death count
x<-seq(0,length(mx),1)

myLT<-function(x,mx,dx,ax=.5,initpop = 100000){
  ax<-rep(ax, length(x));ax
  if (length(mx) != length(dx)){
    stop("Vectors mx and dx are not the same length")
  }

  if (length(mx)<1|length(dx)<1|length(x)<1){
    stop("Parameter missing from function")
  }
  nx<-c(diff(x),Inf);nx

  nqx2<-1-exp((-nx[-1])*mx)
  nqx2[is.na(nqx2)]<-1;nqx2
  cumul<-1-nqx2
  lx  <- initpop * c(1, cumprod(1 - nqx2)[1:(length(nqx2) - 1)]);lx #Of the starting number of newborns in the life table, the number living at the beginning of the age interval

  if(lx[2]>initpop){
    stop("Population numbers inconsistent. Please review initpop")
  }
  #nx<-x[-length(-1)]-lx[-length(x)];

  #####for dx
  new2<-lx[-length(lx)]-lx[-1];new2
  new3<-lx[1]-sum(new2)
  dx<-c(new2,new3)
  #####for Lx
  p1<-nx-ax
  Lx<-nx*lx-(p1)*dx

  #####for Tx
  Lx[is.nan(Lx)] <- 0
  new5<-cumsum(rev(Lx));new5
  tx<-rev(new5);tx

  ex<-tx/lx;ex
  x<-x[1:length(x)-1]
  ax<-ax[1:length(ax)-1]
  Lx<-Lx[1:length(Lx)-1]
  tx<-tx[1:length(tx)-1]
  ex<-ex[1:length(ex)-1]

  #print(length(x))
  #print(length(mx))
  #print(length(nqx2))
  #print(length(cumul))
  #print(length(ax))
  #print(length(lx))
  #print(length(dx))
  #print(length(Lx))
  #print(length(tx))
  #print(length(ex))

  hi<-data.frame(x,mx,nqx2,cumul,ax=.5,lx,dx,Lx,tx,ex);hi

  hi2<-na.omit(hi)
  hi2$nqx2[length(hi2$nqx2)]<-1

  myplot<-ggplot(hi,aes(y = cumul,x=x))+
    geom_point()+
    geom_smooth(method='loess')+
    xlab("Age")+
    ylab("Survival Probability")+
    ggtitle("Survivorship Curve")+
    theme_economist()+scale_color_economist()


  return(list("Life Table" = hi2,
              "Survivorship Curve" = myplot))
}
myLT(x,mx,dx)

library(roxygen2); # Read in the roxygen2 R package
roxygenise()
