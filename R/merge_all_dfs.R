#' Merges a List of data frames by binding the rows and then removes the rownames
#'
#' Helper function for glue_data
#'
#' @param df_list List data.frame
#'
#' @return data.frame
#'
#' @noRd
merge_all_dfs <- function(df_list) {

  final_df <- do.call(rbind.data.frame, df_list)

  rownames(final_df) <- NULL

  final_df

}
