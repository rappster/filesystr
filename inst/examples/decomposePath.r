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
  "another nonex\\file.tar.gz", 
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