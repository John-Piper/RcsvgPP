% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/RcppExports.R
\name{dataFrameHeadersCheck}
\alias{dataFrameHeadersCheck}
\title{checks two different data frames have the same number of columns and the same headers if requested.
Helper function for indexOfDiffDataframeInVector.}
\usage{
dataFrameHeadersCheck(leftDataFrame, rightDataFrame, checkHeaderNames)
}
\arguments{
\item{leftDataFrame}{data frame.}

\item{rightDataFrame}{data frame.}

\item{checkHeaderNames}{bool true if header names required checking.}
}
\value{
bool true if the data frames have the same number of columns and if required the headers are the same else false.
}
\description{
checks two different data frames have the same number of columns and the same headers if requested.
Helper function for indexOfDiffDataframeInVector.
}
