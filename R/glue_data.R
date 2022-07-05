#' Glues a list of data.frames into one data.frame if the they have the same headers or column size as the first data.frame
#'
#' @param input_data List data.frame
#' @param check_header_names logical. True to Check the files are the same by column names or False for number of columns
#'
#' @return data.frame
#'
#' @export
#'
#' @examples
#'
#' \dontrun{
#'
#' df_list <- List(df_1, df_2, df_3)
#'
#' final_df_one <- glue_data(df_list)
#'
#' final_df_two <- glue_data(df_list, check_header_names = FALSE)
#'
#' }
glue_data <- function(input_data, check_header_names = TRUE) {

  stopifnot(length(input_data) > 0, is.data.frame(input_data[[1]]))

  df_list <- keepDataframesWithSameHeaders(input_data, check_header_names)

  df_list <- setDataframeColNamesToFirstDataframe(df_list)

  merged_df <- merge_all_dfs(df_list)

}
