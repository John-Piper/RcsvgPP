library("Rcsvg")


#------------------------------------------------------------------------------------------------------------------------------------------#


# Setup

column_values_one <- c(1,2,3,4)
column_values_two <- c(4,3,2,1)
column_values_three <- c(5,6,7,8)
column_values_four <- c(9,8,7,6)


main_test_df <- data.frame(first_column = column_values_one,
                          second_column = column_values_two)

test_df_same_col_names <- data.frame(first_column = column_values_three,
                                    second_column = column_values_four)

test_df_different_col_names <- data.frame(column_one = column_values_one,
                                          column_two = column_values_three)

test_df_different_second_col_name <- data.frame(first_column = column_values_two,
                                                secondColumn = column_values_four)

test_df_same_col_names_different_order <- data.frame(second_column = column_values_two,
                                                     first_column = column_values_one)

test_df_only_one_column <- data.frame(first_column = column_values_one)

#------------------------------------------------------------------------------------------------------------------------------------------#


# tests


test_that("Both dataframes with the same column names return TRUE", {

  expect_equal(same_df_headers(main_test_df, test_df_same_col_names),
               TRUE)

})


test_that("Function returns FALSE when both dataframes have different column names", {

  expect_false(same_df_headers(main_test_df, test_df_different_col_names))

})


test_that("Function returns FALSE when right dataframes have at least one different column name", {

  expect_false(same_df_headers(main_test_df, test_df_different_second_col_name))

})


test_that("Function returns FALSE when both dataframes have the same col names but in a different order", {

  expect_false(same_df_headers(main_test_df, test_df_same_col_names_different_order))

})


test_that("Function returns FALSE when both dataframes have different column lengths", {

  expect_false(same_df_headers(main_test_df, test_df_only_one_column))

})

