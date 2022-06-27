library("Rcsvg")


#------------------------------------------------------------------------------------------------------------------------------------------#


# DF Setup

column_values_one <- c(1,2,3,4)
column_values_two <- c(4,3,2,1)
column_values_three <- c(5,6,7,8)
column_values_four <- c(9,8,7,6)


test_df_one <- data.frame(first_column = column_values_one,
                          second_column = column_values_two)

test_df_two <- data.frame(column_one = column_values_three,
                          column_two = column_values_four)

test_df_three <- data.frame(column_A = column_values_one,
                            column_B = column_values_three)

test_df_four <- data.frame(Column_1 = column_values_two,
                           column_2 = column_values_four)


df_test_list <- list(test_df_one, test_df_two, test_df_three, test_df_four)


#------------------------------------------------------------------------------------------------------------------------------------------#


# Test Setup One

df_test_list_output_one <- set_df_colnames(df_test_list, names(df_test_list[[1]]))

df_test_list_output_one <- unlist(lapply(df_test_list_output_one, function(df) {

  names(df)

}))

expected_column_names_one <- rep(c("first_column", "second_column"), 4)


# Test Setup Two


df_test_list_output_two <- set_df_colnames(df_test_list, names(df_test_list[[3]]))

df_test_list_output_two <- unlist(lapply(df_test_list_output_two, function(df) {

  names(df)

}))

expected_column_names_two <- rep(c("column_A", "column_B"), 4)


# Test Setup Three


df_test_list_output_three <- set_df_colnames(df_test_list, c("col_1", "col_2"))

df_test_list_output_three <- unlist(lapply(df_test_list_output_three, function(df) {

  names(df)

}))


expected_column_names_three <- rep(c("col_1", "col_2"), 4)

#------------------------------------------------------------------------------------------------------------------------------------------#


#tests

test_that("All dataframes in the list have the same column names as the first dataframe in the list", {

  expect_equal(df_test_list_output_one, expected_column_names_one)

})


test_that("All dataframes in the list have the same column names as the third dataframe in the list", {

  expect_equal(df_test_list_output_two, expected_column_names_two)

})


test_that("All dataframes in the list have the same column names as the input character vector", {

  expect_equal(df_test_list_output_three, expected_column_names_three)

})


test_that("A Stop error occurs when the length of any of the dataframes in the df_list argument is different to the length of the df_col_names argument" , {

  expect_error(set_df_colnames(df_test_list, c("col1","col2","col3")), "`df_list[index]` should have the same number of columns as `length(df_col_names)`", fixed=TRUE)


})



