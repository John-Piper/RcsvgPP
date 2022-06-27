#' Checks two data frames have the same column names in the same order
#'
#' Helper function for glue_data
#'
#' @param left_df data.frame
#' @param right_df data.frame
#'
#' @return logic
#'
#' @noRd
same_df_headers <- function(left_df, right_df) {

  left_df_header <- names(left_df)
  right_df_header <- names(right_df)

  if (length(left_df_header) != length(right_df_header)) {

    return (FALSE)

  }

  index <- 1

  max_index <- length(left_df_header)

  same_headers <- TRUE

  while (index <= max_index) {

    if(left_df_header[index] != right_df_header[index]) {

      same_headers <- FALSE

      break

    }

    index <- index + 1

  }

  same_headers

}
