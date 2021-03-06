% Generated by roxygen2 (4.0.2): do not edit by hand
\name{DirectoryCopyResults.S3}
\alias{DirectoryCopyResults.S3}
\title{Class: DirectoryCopyResults.S3}
\usage{
DirectoryCopyResults.S3(..., .x)
}
\arguments{
\item{.x}{\code{\link{ANY}}. An object of an arbitrary class whose class
attribute should be updated so that it becomes an instance of class
\code{DirectoryCopyResults.S3}. Mainly intended for rapid prototyping
purposes}
}
\value{
Instance of class \code{DirectoryCopyResults.S3}.
}
\description{
Copy result class (S3).
}
\section{Fields}{

\describe{
\item{\code{...}}{A collection of instances of class
\code{\link[filesystr]{DirectoryCopyResult.S3}}.}
}}
\section{Intended use of this class}{


This S3 class, or to be more precise its constructor function, exists mainly
for rapid prototyping purposes.
This is mainly reflected in the fact, that when specifying \code{.x}, this
constructor function will simply update the \code{class} attribute of
whatever object has been provided.

However, it also allows for a more formal OOP-style of rapid
prototyping by offering explicit \emph{class fields} (all arguments except
\code{.x}). Nevertheless, it is probably advisable to switch to an
explicit formal approach such as \emph{S4} and/or \emph{Reference Classes}
once the package or application has reached a certain state of maturity.
}
\examples{
\dontrun{

## Informal use (intended mainly for rapid prototyping) //
## Takes *any* object and simply changes the class attributes  
DirectoryCopyResults.S3(
  .x = list(
    DirectoryCopyResult.S3(),
    DirectoryCopyResult.S3(),
    DirectoryCopyResult.S3()
  )
)  
DirectoryCopyResults.S3(.x = TRUE)  

## Formal use (explicitly using 'fields') //
DirectoryCopyResults.S3()
DirectoryCopyResults.S3(
  DirectoryCopyResult.S3(),
  DirectoryCopyResult.S3(),
  DirectoryCopyResult.S3()
)  

## Recommended: inlcude namespace //
filesystr::DirectoryCopyResults.S3(DirectoryCopyResult.S3())

}
}
\author{
Janko Thyson \email{janko.thyson@rappster.de}
}
\references{
\url{https://github.com/Rappster/filesystr}
}
\seealso{
\code{
    \link[filesystr]{DirectoryCopyResult.S3}
}
}

