% Generated by roxygen2 (4.0.2): do not edit by hand
\name{getParentDirectory}
\alias{getParentDirectory}
\title{Get Path of Parent Directory}
\usage{
getParentDirectory(path, up = 1, ...)
}
\arguments{
\item{path}{\strong{Signature argument}.
Object containing path information.}

\item{up}{\code{\link{numeric}}. Dimension: 1
Number of levels to go up (relative to the initial directory).}

\item{...}{Further arguments to be passed to subsequent functions/methods.}
}
\description{
Gets the path of a directorie's parent directory.
Argument \code{up} controls how many levels to go up relative
to the initial directory.
}
\examples{
\dontrun{

path <- c(getwd(), R.home())

getParentDirectory(path = path)
getParentDirectory(path = path, up = 2)
getParentDirectory(path = path, up = 3)
getParentDirectory(path = path, up = c(1,4))

path <- "c:/Windows"
getParentDirectory(path = path, up = 2)
try(getParentDirectory(path = path, up = 3))

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
  	\link[filesystr]{getParentDirectory},
		\link[filesystr]{getParentDirectory-character-method}
}
}

