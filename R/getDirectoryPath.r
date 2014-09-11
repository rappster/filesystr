#' @title 
#' Get Directory Path
#' 
#' @description 
#' Returns the directory path of paths of file system ressources.
#'  
#' @param path \strong{Signature argument}.
#' 		Object containing path information.
#' @param ... Further arguments passed to:
#'    \code{\link[rapp.core.filesys]{decomposePath}}
#' @example inst/examples/getDirectoryPath.r
#' @seealso \code{
#' 		\link[rapp.core.filesys]{getDirectoryPath-character-method}
#' }
#' @template author
#' @template references
#' @export
setGeneric(
  name = "getDirectoryPath",
  signature = c(
    "path"
  ),
  def = function(
    path = ".",
    ...
  ) {
    standardGeneric("getDirectoryPath")       
  }
)

#' @title 
#' Get Directory Path
#'
#' @description 
#' See generic: \code{\link[rapp.core.filesys]{getDirectoryPath}}
#' 
#' @inheritParams getDirectoryPath
#' @param path \code{\link{missing}}.
#' @references \url{http://www.rappster.de/rapp/rapp.core.filesys}
#' @example inst/examples/getDirectoryPath.r
#' @seealso \code{
#'    \link[rapp.core.filesys]{getDirectoryPath},
#' 		\link[rapp.core.filesys]{getDirectoryPath-character-method},
#'    \link[rapp.core.filesys]{getDirectoryPath-RappFilesystemDecomposedPathS3-method}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "getDirectoryPath", 
  signature = signature(
    path = "missing"
  ), 
  definition = function(
    path,
    ...
  ) {
    
#   ## Tracing //
#   if (length(as.numeric(getOption("rapp")$trace$tracelevel))) {
#     
#   }        
  
  ## Dispatch
  out <- getDirectoryPath(
    path = path, 
    ...
  )
  
  ## Return //
  return(out)
    
  }
)

#' @title 
#' Get Directory Path
#'
#' @description 
#' See generic: \code{\link[rapp.core.filesys]{getDirectoryPath}}
#' 
#' @inheritParams getDirectoryPath
#' @param path \code{\link{character}}. Vector of file paths. 
#'   	Default: see \code{\link[rapp.core.filesys]{getDirectoryPath-missing-RappCoreDirectorysys-RappCoreDirectorysys-method}}.
#' @return See method
#'    \link[rapp.core.filesys]{getDirectoryPath-RappFilesystemDecomposedPathS3-method}
#' @example inst/examples/getDirectoryPath.r
#' @seealso \code{
#' 		\link[rapp.core.filesys]{getDirectoryPath},
#'   	\link[rapp.core.filesys]{getDirectoryPath-RappFilesystemDecomposedPathS3-method}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "getDirectoryPath", 
  signature = signature(
    path = "character"
  ), 
  definition = function(
    path,
    ...
  ) {
    
  ## Get file extensions //
  return(getDirectoryPath(
    path = decomposePath(path = path, ...),
    ...
  ))
    
  }
)

#' @title 
#' Get Directory Path
#'
#' @description 
#' See generic: \code{\link[rapp.core.filesys]{getDirectoryPath}}
#' 
#' @inheritParams getDirectoryPath
#' @param path \code{\link{RappFilesystemDecomposedPathS3}}. 
#' @return \code{\link{character}}. Vector containing file names or 
#' 		\code{""} or \code{NA} for respective inputs (i.e. directory paths or
#' 		\code{NA}).
#' @example inst/examples/getDirectoryPath.r
#' @seealso \code{
#' 		\link[rapp.core.filesys]{getDirectoryPath},
#' 		\link[rapp.core.filesys]{getDirectoryPath-missing-method}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "getDirectoryPath", 
  signature = signature(
    path = "RappFilesystemDecomposedPathS3"
  ), 
  definition = function(
    path,
    ...
  ) {
    
#   ## Tracing //
#   if (length(as.numeric(getOption("rapp")$trace$tracelevel))) {
#     
#   }        
  
  out <- path[["directory"]]
  
  ## Transform //
  if (is.null(out) || !length(out)) {
    out <- character()
  }
  
  ## Return //
  return(out)
    
  }
)
