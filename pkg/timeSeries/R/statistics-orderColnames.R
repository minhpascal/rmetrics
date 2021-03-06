#
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  A copy of the GNU General Public License is available at
#  ../../COPYING


################################################################################
# FUNCTION:                 DESCRIPTION:
#  statsColnames             Returns statistically rearranged column names
#  orderColnames             Returns ordered column names of a time Series
#  sortColnames              Returns sorted column names of a time Series
#  sampleColnames            Returns sampled column names of a time Series
#  pcaColnames               Returns PCA correlation ordered column names
#  hclustColnames            Returns hierarchical clustered column names
################################################################################


statsColnames =
  function(x, FUN = colMeans, ...)
{   
    # A function implemented by Diethelm Wuertz

    # Description:
    #   Returns statistically rearranged column names

    # Arguments:
    #   x - an object of class timeSeries
    #   FUN - a character string, the name of the function to be used
    #   ... - optional arguments to be passed to FUN
    
    # Note:
    #   Example of function Candidates:
    #   colStats        calculates column statistics,
    #   colSums         calculates column sums,
    #   colMeans        calculates column means,
    #   colSds          calculates column standard deviations,
    #   colVars         calculates column variances,
    #   colSkewness     calculates column skewness,
    #   colKurtosis     calculates column kurtosis,
    #   colMaxs         calculates maximum values in each column,
    #   colMins         calculates minimum values in each column,
    #   colProds        computes product of all values in each column,
    #   colQuantiles    computes quantiles of each column.

    # FUNCTION:

    # Apply colStats Function:
    fun = match.fun(FUN)
    Sort = sort(fun(x, ...))
    Order = names(Sort)
    ans = colnames(as.matrix(x)[, Order])
    attr(ans, "control") <- Sort

    # Return Value:
    ans
}


# ------------------------------------------------------------------------------


orderColnames =
  function(x, ...)
{   
    # A function implemented by Diethelm Wuertz

    # Description:
    #   Returns ordered column names of a time Series

    # Arguments:
    #   x - an object of class timeSeries

    # FUNCTION:

    # Order:
    ans = order(colnames(as.matrix(x)), ...)

    # Return Value:
    ans
}


# ------------------------------------------------------------------------------


sortColnames =
  function(x, ...)
{   
    # A function implemented by Diethelm Wuertz

    # Description:
    #   Returns sorted column names of a time Series

    # Arguments:
    #   x - an object of class timeSeries
    
    # FUNCTION:

    # Sort:
    ans = sort(colnames(as.matrix(x)), ...)

    # Return Value:
    ans
}


# ------------------------------------------------------------------------------


sampleColnames =
  function(x, ...)
{   
    # A function implemented by Diethelm Wuertz

    # Description:
    #   Returns sampled column names of a time Series

    # Arguments:
    #   x - an object of class timeSeries
    
    # FUNCTION:

    # Sample:
    ans = sample(colnames(as.matrix(x)), ...)

    # Return Value:
    ans
}


# ------------------------------------------------------------------------------


pcaColnames =
  function(x, robust = FALSE, ...)
{   
    # A function implemented by Diethelm Wuertz

    # Description:
    #   Returns PCA correlation ordered column names

    # Arguments:
    #   x - an object of class timeSeries
    #   robust - a logical, should we use robust covariance estimation?
    
    # FUNCTION:

    # Order:
    if (robust) {
        x.cor = robustbase::covMcd(as.matrix(x), cor = TRUE, ...)$cor
    } else {
        x.cor = cor(as.matrix(x), ...)
    }
    x.eigen = eigen(x.cor)$vectors[,1:2]
    e1 = x.eigen[, 1]
    e2 = x.eigen[, 2]
    Order = order(ifelse(e1 > 0, atan(e2/e1), atan(e2/e1)+pi))
    ans = colnames(as.matrix(x))[Order]

    # Return Value:
    ans
}


# ------------------------------------------------------------------------------


hclustColnames =
  function(x, method = c("euclidean", "complete"), ...)
{   
    # A function implemented by Diethelm Wuertz

    # Description:
    #   Returns hierarchical clustered column names

    # Arguments:
    #   x - an object of class timeSeries
    #   method - the agglomeration method to be used. This should
    #       be (an unambiguous abbreviation of) one of "ward", "single",
    #       "complete", "average", "mcquitty", "median" or "centroid".
    #   ... optional arguments passed to the function hclust

    # FUNCTION:

    # Order:
    Order = hclust(dist(t(as.matrix(x)),
        method = method[1]), method = method[2], ...)$order
    ans = colnames(as.matrix(x))[Order]

    # Return Value:
    ans
}


################################################################################

