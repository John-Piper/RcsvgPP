#' Checks the two data frames have the same column names or number of columns.
#'
#' Helper function for glue_data
#'
#' @param left_df data.frame
#' @param right_df data.frame
#' @param check_header_names logical. True to Check the files are the same by column names or False for number of columns
#'
#' @return logic
#'
#' @noRd
#'
#' @examples
#'
#' \dontrun{
#'
#' if (df_headers_ok(df_1, df_2, TRUE) {
#'
#'     # True code here
#'
#' } else {
#'
#'     # else code here
#'
#' }
#'
#' }
df_headers_ok <- function(left_df, right_df, check_header_names = TRUE) {

  return_value <- TRUE

  if (is.data.frame(left_df) & is.data.frame(right_df)) {

    if (check_header_names) {

      if (!same_df_headers(left_df, right_df)) {

        return_value <- FALSE

      }

    } else {

      if (ncol(left_df) != ncol(right_df)) {

        return_value <- FALSE

      }

    }

  }

  return_value

}




