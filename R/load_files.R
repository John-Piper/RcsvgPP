#' Loads files into R from a List that stores file paths.  The file type depends on the function passed
#'
#' Helper function for glue_files_from_folder
#'
#' @param file_names List character vector. List of character vectors that stores file paths.
#' @param reset_wd character vector.  The working directory to reset if an error occurs in opening files.
#' @param func function. The function to use to open the files from the folder.  Default is csv.read.  User could use external packages to open files.
#' @param ... Extra arguments. Can be added that will be passed into the func param.
#'
#' @return data.frame
#'
#' @noRd
load_files <- function(file_names, reset_wd, func, ...) {

  files <- lapply(file_names, function(file_name) {

      tryCatch(

        {

          func(file_name, ...)

        },

        error = function(cnd) {

          setwd(reset_wd)
          simpleCondition(cnd)
          stop("There has been a problem with the `func` argument or list of file paths.")

        }
      )
    }
  )

}
