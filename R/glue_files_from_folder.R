#' Collects files from folder and joins the data into one data frame
#'
#' @param folder_path character vector.
#' @param pattern character.  Regex pattern used in list.files.
#' @param check_header_names logical. True to Check the files are the same by column names or False for number of columns.
#' @param first_file character vector. Choose the file name that all the other files check for the same column names or number of columns.
#' @param func function. The function to use to open the files from the folder.  Default is csv.read.  User could use external packages to open files.
#' @param ... Extra arguments. Can be added that will be passed into the func param.
#'
#' @return data.frame
#' @export
#'
#' @examples
#'
#' \dontrun{
#'
#' df <- glue_from_folder("example_path/")
#'
#' df <- glue_from_folder(folder_path = "example_path/",
#'                        pattern = "*example.csv",
#'                        check_header_names = FALSE,
#'                        first_file = "first_file.csv",
#'                        func=read.csv,
#'                        stringsAsFactors=FALSEglue
#'                       )
#' }
glue_from_folder <- function(folder_path = "",
                             pattern = "*.csv",
                             check_header_names = TRUE,
                             first_file = NA_character_,
                             func=read.csv,
                             ...) {

  current_wd <- getwd()

  setwd(folder_path)

  file_names <- list.files(pattern = pattern)

  if (!is.na(first_file)) {

    file_names <- move_to_index_one(first_file, file_names)

  }

  files <- load_files(file_names, current_wd, func, ...)

  setwd(current_wd)

  return_df <- glue_data(files, check_header_names)

  return_df

}

