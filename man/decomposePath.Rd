% Generated by roxygen2 (4.0.2): do not edit by hand
\name{decomposePath}
\alias{decomposePath}
\title{Decompose Path}
\usage{
decomposePath(path = ".", dir_slash = FALSE, shortform = FALSE, ...)
}
\arguments{
\item{path}{\strong{Signature argument}.
Object containing path information.}

\item{dir_slash}{\code{\link{logical}}.
Are directory paths denoted by a trailing slash (\code{TRUE}) or
not (\code{FALSE}, default). See details.}

\item{shortform}{\code{\link{logical}}. Dimension: 1.
Use shortforms (\code{TRUE}) for \code{getwd()} (i.e. \code{"."},
    \code{dirname(getwd()} (i.e. \code{".."} and \code{HOME} (i.e. \code{"~"})
    or not (\code{FALSE}, default).}

\item{...}{Further arguments passed to:
\code{\link[filesystr]{standardizePath}}}
}
\description{
Splits a path into the following components: \emph{directory name},
\emph{filename} (without extension), and \emph{file extension}.
\code{strip_extension} and
\code{get_extension} provide shortcuts to the second and third parts
of the filename. \code{recompose_path} takes the result of
\code{decompose_path} and returns complete paths.
}
\section{Processing of paths of non-existing directories}{


By default, a path of a non-existing directory (e.g. \code{"c:/nonexisting"})
would most likely often be treated as a \emph{file path} as
\code{file.info("c:/nonexisting")$isdir} would return with \code{NA}.
However, this function implements a different convention: a path whose
basename does not containing any dots are considered as being
\emph{directory} path instead of a file path. You can control the way
paths are treated by using \code{dir_slash} as follows:

Consider \emph{directory} path \code{"C:/nonexisting"}:
\itemize{
   \item{\code{dir_slash = TRUE} }
   {the method would decompose this into directory \code{"C:/"},
   filname \code{"nonexisting"} and extension \code{""}}
   \item{\code{dir_slash = FALSE} }
   {the method would decompose this into directory \code{"C:/nonexisting"},
   filname \code{""} and extension \code{""}}
}

Consider \emph{directory} path \code{"C:/nonexisting/"}:
\itemize{
   \item{\code{dir_slash = TRUE} }
   {the method would decompose this into directory \code{"C:/nonexisting"},
   filname \code{""} and extension \code{""}}
   \item{\code{dir_slash = FALSE} }
   {the method would decompose this into directory \code{"C:/"},
   filname \code{"nonexisting"} and extension \code{""}}
}
}
\examples{
\dontrun{

## Auxiliary function //
carefulCleanup <- function(x, pattern=basename(tempdir())) {
  out <- sapply(x, function(ii) {
    out <- NA
    if (grepl(pattern, ii)) {
      out <- unlink(ii, recursive=TRUE, force=TRUE)
    }        
    out
  })
  invisible(out)
}  
  
## Create example content //  
to_create <- file.path(tempdir(), "decomposePath", c("dir_a", file.path("dir_b", "sub_1")))
sapply(to_create, dir.create, recursive = TRUE, showWarnings = FALSE)
file.create(file.path(tempdir(), "decomposePath/dir_b/sub_1/file.txt"))

## Change working directory //
wd_0 <- getwd()
setwd(file.path(tempdir(), "decomposePath"))
## Make sure you undo this with 'setwd(wd_0)' when you are finished!!!

path <- c(
  ".",
  "..",
  "dir_a", 
  "dir_a/",
  "dir_b", 
  "dir_b/sub_1",
  "dir_b/sub_1/file.txt",
  "dir_b/sub_1/file.txt/",
  "dir_b/nonex",
  "dir_b/nonex/",
  "dir_b/nonex/file.txt",
  "nonex",
  "nonex/sub_1",
  "nonex/sub_1/file.txt",
  "nonex/foo.tgz", 
  "another nonex\\\\file.tar.gz", 
  "a_file", 
  "quux. quuux.tbz2", 
  "~/file.tar.xz",
  "", 
  NA_character_
)

res <- decomposePath(path = path)
res
class(res)

decomposePath(path = path, dir_slash = TRUE)
decomposePath(path = path, shortform = TRUE)
decomposePath(path = path, dir_slash = TRUE, shortform = TRUE)

decomposePath()
decomposePath(path = character())
decomposePath(path = NA_character_)

## Clean up //
## Reset working directory:
setwd(wd_0)

## Remove tempdir directory:
carefulCleanup(x = file.path(tempdir(), "decomposePath"))

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
   \link[filesystr]{decomposePath-character-method}
}
}

