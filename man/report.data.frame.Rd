% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/descriptive.R
\name{report.data.frame}
\alias{report.data.frame}
\title{Report tables of summary data}
\usage{
\method{report}{data.frame}(x, by = NULL, file = NULL, type = "word",
  digits = 2, digitscat = digits, font = ifelse(Sys.info()["sysname"] ==
  "Windows", "Arial", "Helvetica")[[1]], pointsize = 11,
  add.rownames = FALSE, ...)
}
\arguments{
\item{x}{A data.frame object}

\item{by}{Grouping variable for the report}

\item{file}{Name of the file to export the table}

\item{type}{Format of the file}

\item{digits}{Number of decimal places}

\item{digitscat}{Number of decimal places for categorical variables (if different to digits)}

\item{font}{Font to use if type="word"}

\item{pointsize}{Pointsize to use if type="word"}

\item{add.rownames}{Logical for adding rownames to the table}

\item{...}{further arguments passed to make_table()}
}
\description{
Creates a report table ready for publication
}
\examples{
report(iris)
(reporTable<-report(iris, by="Species"))
class(reporTable)
}
