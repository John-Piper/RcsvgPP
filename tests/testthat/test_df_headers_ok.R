library("Rcsvg")


column_values_one <- c(1,2,3,4)
column_values_two <- c(4,3,2,1)
column_values_three <- c(5,6,7,8)
column_values_four <- c(9,8,7,6)


test_left_df_one <- data.frame(first_column = column_values_one,
                               second_column = column_values_two)

test_left_df_two <- data.frame(column_one = column_values_one,
                               column_two = column_values_two)

test_right_df_one <- data.frame(first_column = column_values_three,
                                second_column = column_values_four)

test_right_df_two <- data.frame(first_column = column_values_one,
                                second_column = column_values_two,
                                third_column = column_values_three,
                                fourth_column = column_values_four)


test_that("Returns True when two dataframes passed in the function have the same header names", {

  expect_equal(
    df_headers_ok(test_left_df_one, test_right_df_one),
    TRUE
  )

})


test_that("Returns False when two dataframes passed in the function do not have the same header names", {

  expect_equal(
    df_headers_ok(test_left_df_two, test_right_df_one),
    FALSE
  )

})


test_that("Return True when two dataframes passed in the function have the same number of columns and headers are not being checked", {

  expect_equal(
    df_headers_ok(test_left_df_two, test_right_df_one, check_header_names = FALSE),
    TRUE
  )

})


test_that("Return FALSE when two dataframes passed in the function do not have tge same number of columns and headers are not being checked", {

  expect_equal(
    df_headers_ok(test_left_df_two, test_right_df_two, check_header_names = FALSE),
    FALSE
  )

})
