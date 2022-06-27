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


df_test_list_one <- list(test_df_one, test_df_two, test_df_three, test_df_four)

expected_outcome_test_one <- data.frame(first_column = c(column_values_one, column_values_three, column_values_one, column_values_two),
                                        second_column = c(column_values_two, column_values_four, column_values_three, column_values_four))


# Setup for test two - half different column names - half with the same column names


test_df_five <- data.frame(column_a = column_values_one,
                          column_b = column_values_three)

test_df_six <- data.frame(a_column = column_values_two,
                          b_column = column_values_four)

df_test_list_two <- list(test_df_one, test_df_two, test_df_five, test_df_six)


# Setup for test three - Three df with columns the same and one df with different amount of columns


test_df_seven <- data.frame(column_a = column_values_one,
                            column_b = column_values_two,
                            column_c = column_values_three)


df_test_list_three <- list(test_df_one, test_df_two, test_df_seven, test_df_three, test_df_four)


#------------------------------------------------------------------------------------------------------------------------------------------#


# test one


test_that("Four dataframes in a list with the same column names merge into a new data frame keeping all values", {

  expect_equal(glue_data(df_test_list_one),
               expected_outcome_test_one)

})


test_that("Four dataframes in a list with two with the same column names and two with different column names merge into a new data frame keeping all values", {

  expect_equal(glue_data(df_test_list_two, check_header_names = FALSE),
               expected_outcome_test_one)

})


test_that("One data frame that that has a different amount of columns which is not first in the list is not included in the merge - checking headers names", {

  expect_equal(glue_data(df_test_list_three),
               expected_outcome_test_one)

})


test_that("One data frame that that has a different amount of columns which is not first in the list is not included in the merge - not checking headers names", {

  expect_equal(glue_data(df_test_list_three, check_header_names = FALSE),
               expected_outcome_test_one)

})


test_that("Error occurs when an empty dataframe is passed into the function", {

  expect_error(glue_data(data.frame()),
               "", fixed=TRUE)

})


test_that("Error occurs when an data.frame is not passed into the function", {

  expect_error(glue_data(-1),
               "", fixed=TRUE)

})


