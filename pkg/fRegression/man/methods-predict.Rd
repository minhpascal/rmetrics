\name{predict-methods}


\docType{methods}


\alias{predict-methods}
\alias{predict,ANY-method}
\alias{predict,fREG-method}


\title{Regression Models Prediction Function}


\description{

    Predicts a time series from a fitted regression model.

}


\usage{
\S4method{predict}{fREG}(object, newdata, se.fit = FALSE, type = "response", \dots)
}
 

\arguments{

    \item{newdata}{
        new data.
        }
    \item{object}{
        an object of class \code{fREG} as returned from the function
        \code{regFit()}.
        }   
    \item{se.fit}{
        a logical flag. Should standard errors be included?
        By default \code{FALSE}.
        }  
    \item{type}{
        a character string by default \code{"response"}.
        }  
    \item{\dots}{
        arguments to be passed.
        }   

}


\section{Methods}{
    \describe{

    \item{object = "ANY"}{
        Generic function
        }
    \item{object = "fREG"}{
        Predict method for regression models.
        }
        
    }
}


\value{

    returns ...
        
}


\author{

    Diethelm Wuertz for the Rmetrics \R-port.
    
}


\examples{
## regSim -
   x <- regSim(model = "LM3", n = 50)
  
## regFit -
   fit <- regFit(Y ~ X1 + X2 + X3, data = x, use = "lm")
}


\keyword{models}

