% Generated by roxygen2 (4.0.2): do not edit by hand
\docType{methods}
\name{getDirectoryPath,DecomposedPath.S3-method}
\alias{getDirectoryPath,DecomposedPath.S3-method}
\title{Get Directory Path}
\usage{
\S4method{getDirectoryPath}{DecomposedPath.S3}(path = ".", ...)
}
\arguments{
\item{path}{\code{\link{DecomposedPath.S3}}.}

\item{...}{Further arguments passed to:
\code{\link[filesystr]{decomposePath}}}
}
\value{
\code{\link{character}}. Vector containing file names or
		\code{""} or \code{NA} for respective inputs (i.e. directory paths or
		\code{NA}).
}
\description{
See generic: \code{\link[filesystr]{getDirectoryPath}}
}
\examples{
\dontrun{

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
getDirectoryPath(path = path)
getDirectoryPath(path = path, shortform = TRUE)
getDirectoryPath(path = character())
getDirectoryPath()

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
		\link[filesystr]{getDirectoryPath},
		\link[filesystr]{getDirectoryPath-missing-method}
}
}

