library("Rcsvg")


#------------------------------------------------------------------------------------------------------------------------------------------#


# Setup for test one

column_values_one <- c(1,2,3,4)
column_values_two <- c(4,3,2,1)
column_values_three <- c(5,6,7,8)
column_values_four <- c(9,8,7,6)


test_df_one <- data.frame(first_column = column_values_one,
                          second_column = column_values_two)

test_df_two <- data.frame(first_column = column_values_three,
                          second_column = column_values_four)

test_df_three <- data.frame(first_column = column_values_one,
                            second_column = column_values_three)

test_df_four <- data.frame(first_column = column_values_two,
                            second_column = column_values_four)


df_test_list <- list(test_df_one, test_df_two, test_df_three, test_df_four)

expected_outcome_test_one <- data.frame(first_column = c(column_values_one, column_values_three, column_values_one, column_values_two),
                               second_column = c(column_values_two, column_values_four, column_values_three, column_values_four))


#------------------------------------------------------------------------------------------------------------------------------------------#


# Setup for test two

test_df_one_row_names <- test_df_one

rownames(test_df_one_row_names) <- LETTERS[1:4]

test_df_two_row_names <- test_df_two

rownames(test_df_two_row_names) <- LETTERS[5:8]

df_test_list_row_names <- list(test_df_one_row_names, test_df_two_row_names)

expected_outcome_test_two <- as.character(1:8)


#------------------------------------------------------------------------------------------------------------------------------------------#


# Main tests


test_that("A list of dataframes should be joined together using the column names from the first df in the list", {

  expect_equal(merge_all_dfs(df_test_list),
               expected_outcome_test_one)

})


test_that("The returned dataframe row names to be the index numbers", {

  expect_equal(rownames(merge_all_dfs(df_test_list_row_names)),
               expected_outcome_test_two)

})


#------------------------------------------------------------------------------------------------------------------------------------------#
