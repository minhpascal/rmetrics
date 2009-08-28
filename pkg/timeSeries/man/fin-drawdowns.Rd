\name{drawdowns}


\title{Calculations of Drawdowns}


\alias{drawdowns}
\alias{drawdownsStats}


\description{
    
    Compute series of drawdowns from financial returns 
    and ccalculate drawdown statisitcs.      
    \cr
    
    The functions are:
    
    \tabular{ll}{   
    \code{drawdowns} \tab Generates 'timeSeries' object of drawdown levels, \cr
    \code{drawdownsStats} \tab Compute drawdown stats for univariate time series. }
    
}
    
    
\usage{
drawdowns(x, \dots)

drawdownsStats(x, \dots)
}


\arguments{

    \item{x}{
        [drawdowns] - \cr
        an uni- or multivariate 'timeSeries' object of financial returns, \cr
        [drawdowns] - \cr
        an univariate 'timeSeries' object of financial returns.
        }
    \item{\dots}{
        [drawdowns] - \cr
        optional arguments passed to the function \code{na.omit}, \cr
        [drawdownsStats] - \cr
        arguments passed to the function \code{drawdowns}.
        
        }
        
}


\value{

    \code{drawdowns}\cr
    returns an object of class 'timeSeries'.
    
    \code{drawdownsStats}\cr
    returns an object of class 'data.frame' wit the following entries:\cr 
    \code{"drawdown"} - the depth of the drawdown, \cr 
    \code{"from"} - the start date, \cr  
    \code{"trough"} - the trough period, \cr 
    \code{"to"} - the end date, \cr 
    \code{"length"} - the length in number of records, \cr 
    \code{"peaktrough"} - the peak trough, and , \cr 
    \code{"recovery"} - the recovery length in number of records.
        
}

    

\author{

    Peter Carl and Sankalp Upadhyay for code from the contributed 
    R package PerformanceAnalytics.
    
}


\examples{
## Load Swiss Pension Fund Data Set -  
   setRmetricsOptions(myFinCenter = "GMT")
   data(LPP2005REC)
   head(LPP2005REC)

## Compute Drawdowns Statistics - 
   drawdownsStats(LPP2005REC[, "SPI"])
   
## Plot Drawdowns - 
   dd = drawdowns(LPP2005REC[, "SPI"])
   plot(dd)
}


\keyword{chron}
