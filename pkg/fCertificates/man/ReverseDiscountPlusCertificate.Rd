\name{ReverseDiscountPlusCertificate}
\alias{ReverseDiscountPlusCertificate}

\title{ Reverse Discount Plus Certificate valuation using pricing by duplication }

\description{
  values a Reverse Discount Plus Certificate using pricing by duplication
}

\usage{
ReverseDiscountPlusCertificate(S, S0, X, B, Time, r, r_d, sigma, 
  ratio = 1, barrierActive = TRUE)
}

\arguments{
  \item{S}{ the asset price, a numeric value. }
  \item{S0}{ the underlying start price at issue date }
  \item{X}{ the exercise price, a numeric value. }
  \item{B}{ the barrier ("Sicherheitslevel"), a numeric value. }
  \item{Time}{ time to maturity measured in years }
  \item{r}{ the annualized rate of interest, a numeric value; 
            e.g. 0.25 means 25\% pa. }
  \item{r_d}{ the annualized dividend yield, a numeric value; 
            e.g. 0.25 means 25\% pa. }
  \item{sigma}{ the annualized volatility of the underlying security, 
                a numeric value; e.g. 0.3 means 30\% volatility pa. }
  \item{ratio}{ ratio, number of underlyings one certificate refers to, a numeric value;
                e.g. 0.25 means 4 certificates refer to 1 share of the underlying asset }
  \item{barrierActive}{ flag whether barrier is active or not }
}

\details{
A Reverse Discount Plus Certificate is composed of
\enumerate{
\item a short position in stock with reference price S0 (i.e. a Put with strike S0)
\item a short put with strike price X
\item a up-and-out-call
}
}

\value{
the price (scalar or vector) of the Reverse Discount Plus Certificate
}

\author{ Stefan Wilhelm \email{wilhelm@financial.com} }
\seealso{ similar structures: \code{\link{ReverseDiscountCertificate}} }

\examples{
##
ReverseDiscountPlusCertificate(S=100, S0=100, X=90, B=110, Time=1, 
  r=0.045, r_d=0, sigma=0.4, ratio = 1, barrierActive = TRUE)
  
## payoff diagram
S <- seq(0, 150)
p <- ReverseDiscountPlusCertificate(S, S0=100, X=90, B=110, Time=1, 
  r=0.045, r_d=0, sigma=0.4, ratio = 1, barrierActive = TRUE)
p2 <- ReverseDiscountPlusCertificate(S, S0=100, X=90, B=110, Time=0, 
  r=0.045, r_d=0, sigma=0.4, ratio = 1, barrierActive = FALSE)
p3 <- ReverseDiscountPlusCertificate(S, S0=100, X=90, B=110, Time=0, 
  r=0.045, r_d=0, sigma=0.4, ratio = 1, barrierActive = TRUE)  
plot(S, p,  type="l", col="red", ylim=range(p, p2, na.rm=TRUE), 
  xlab="underlying price", ylab="payoff", main="Reverse Discount Plus Pro")
lines(S, p2, col="blue", lty=2)
lines(S, p3, col="blue")    
abline(v=c(90, 110), lty=2, col="gray80")  
}

\keyword{math}
