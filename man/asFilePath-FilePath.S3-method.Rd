% Generated by roxygen2 (4.0.2): do not edit by hand
\docType{methods}
\name{asFilePath,FilePath.S3-method}
\alias{asFilePath,FilePath.S3-method}
\title{As File Path}
\usage{
\S4method{asFilePath}{FilePath.S3}(path = ".", ensure = FALSE,
  strict = FALSE, ...)
}
\arguments{
\item{path}{\code{\link{FilePath.S3}}.}

\item{ensure}{\code{logical}.
Ensure file existence (\code{TRUE}) or not (\code{FALSE}, default).}

\item{strict}{\code{\link{logical}}.
\code{TRUE}: \code{path} must exist and be a file;
\code{FALSE}: no prior checks. If \code{ensure = TRUE} then this is
automatically set to \code{FALSE}.}

\item{...}{Further arguments of:
\code{\link[filesystr]{asFilePath}}.}
}
\value{
See method
   \code{\link{asFilePath-character-method}}.
}
\description{
See \code{\link[base]{asFilePath}}
}
\examples{
\dontrun{

##------------------------------------------------------------------------------
## Method: character
##------------------------------------------------------------------------------  
  
## Path //
path_0 <- file.path(tempdir(), "path/test.txt")

res <- asFilePath(path = path_0)
res
class(res)

## Strict:
try(asFilePath(path = path_0, strict = TRUE))
## --> error as 'path' does not exist yet

try(asFilePath(path = tempdir(), strict = TRUE))
## --> error as 'path' is a directory and not a file 

## Note that 'ensure' overrules 'strict':
asFilePath(path = path_0, ensure = TRUE, strict = TRUE)
file.exists(path_0)

## Clean up //
conditionalDelete(path = path_0, condition = tempdir())

##------------------------------------------------------------------------------
## Method: FilePath.S3
##------------------------------------------------------------------------------

## Path //
path_0 <- file.path(tempdir(), "path/test2.txt")

res <- asFilePath(path = asFilePath(path_0))
res
class(res)

## Strict:
try(res <- asFilePath(path = asFilePath(path_0), strict = TRUE))
## --> error as 'path' does not exist yet

## Note that 'ensure' overrules 'strict':
asFilePath(path = asFilePath(path_0), ensure = TRUE, strict = TRUE)
file.exists(path_0)

## Clean up //
conditionalDelete(path = path_0, condition = tempdir())

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
   \link[base]{asFilePath},
   \link[base]{asFilePath-character-method}
}
}

