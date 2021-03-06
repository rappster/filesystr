% Generated by roxygen2 (4.0.2): do not edit by hand
\docType{methods}
\name{unlockRessource,character-method}
\alias{unlockRessource,character-method}
\title{Unlock File System Ressource}
\usage{
\S4method{unlockRessource}{character}(path, strict = FALSE, ...)
}
\arguments{
\item{path}{\code{\link{character}}. File path.}

\item{strict}{\code{\link{logical}}.
\code{TRUE}: non-existing ressources trigger error;
\code{FALSE}: non-existing ressources result in return value of \code{FALSE}.}

\item{...}{Further arguments passed to subsequent functions/methods.
In particular:
     \code{\link[filesystr]{getLockFileName}}.}
}
\value{
\code{\link{character}}. Lock file name.
}
\description{
See generic: \code{\link[filesystr]{unlockRessource}}
}
\examples{
\dontrun{

## Create example content  
path <- file.path(tempdir(), "test/registry.rdata")
dir.create(dirname(path), showWarnings = FALSE)
file.create(path)

## Open directory in file system browser //
openRessource(path = dirname(path))

## File //
lockRessource(path = path)
## Note additional '*FILE_LOCK' file in directory 
unlockRessource(path = path)
## Note '*FILE_LOCK' file in directory has been removed again

## Directory //
lockRessource(path = dirname(path))
## Note additional '*DIR_LOCK' file in directory 
unlockRessource(path = dirname(path))
## Note '*DIR_LOCK' file in directory has been removed again

## Non-existing ressources //
unlockRessource(path = "abcd")
try(unlockRessource(path = "abcd", strict = TRUE))

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
   \link[filesystr]{unlockRessource}
}
}

