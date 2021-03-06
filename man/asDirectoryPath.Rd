% Generated by roxygen2 (4.0.2): do not edit by hand
\name{asDirectoryPath}
\alias{asDirectoryPath}
\title{As Directory Path}
\usage{
asDirectoryPath(path = ".", ensure = FALSE, strict = FALSE, ...)
}
\arguments{
\item{path}{\strong{Signature argument}.
Object containing path information.}

\item{ensure}{\code{logical}.
Ensure Directory existence (\code{TRUE}) or not (\code{FALSE}, default).}

\item{strict}{\code{\link{logical}}.
\code{TRUE}: \code{path} must exist and be a directory;
\code{FALSE}: no prior checks. If \code{ensure = TRUE} then this is
automatically set to \code{FALSE}.}

\item{...}{Further arguments passed to:
\code{\link[filesystr]{ensureDirectory}}.}
}
\description{
Turns a \code{character} object denoting a directory path into an object
of class \code{RappFilesystemDirectory3}.
}
\examples{
\dontrun{

##------------------------------------------------------------------------------
## Method: character
##------------------------------------------------------------------------------

## Path //
path_0 <- file.path(tempdir(), "path")

res <- asDirectoryPath(path = path_0)
res
class(res)

## Strict:
try(asDirectoryPath(path = path_0, strict = TRUE))
## --> error as 'path' does not exist yet

path <- tempfile()
file.create(path)
try(asDirectoryPath(path = path, strict = TRUE))
## --> error as 'path' is a file and not a directory 

## Note that 'ensure' overrules 'strict':
asDirectoryPath(path = path_0, ensure = TRUE, strict = TRUE)
file.exists(path_0)

## Clean up //
conditionalDelete(path = path_0, condition = tempdir())

##------------------------------------------------------------------------------
## Method: DirectoryPath.S3
##------------------------------------------------------------------------------

## Path //
path_0 <- file.path(tempdir(), "path2")

res <- asDirectoryPath(path = asDirectoryPath(path_0))
res
class(res)

## Strict:
try(res <- asDirectoryPath(path = asDirectoryPath(path_0), strict = TRUE))
## --> error as 'path' does not exist yet

## Note that 'ensure' overrules 'strict':
asDirectoryPath(path = asDirectoryPath(path_0), ensure = TRUE, strict = TRUE)
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
   \link[base]{asDirectoryPath-character-method},
		\link[filesystr]{ensureDirectory}
}
}

