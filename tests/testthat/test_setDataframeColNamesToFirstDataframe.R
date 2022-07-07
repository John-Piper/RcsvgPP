library("RcsvgPP")

#-------------------------------------------------------------------

# setup


column_values_one <- c(1,2,3,4)
column_values_two <- c(4,3,2,1)
column_values_three <- c(5,6,7,8)
column_values_four <- c(9,8,7,6)


df_one_main <- data.frame(
  first_column = column_values_one,
  second_column = column_values_two
)

df_two_same <- data.frame(
  first_column = column_values_three,
  second_column = column_values_four
)

df_three_different_header <- data.frame(
  column_one = column_values_one,
  column_two = column_values_two
)

df_four_same <- data.frame(
  first_column = column_values_three,
  second_column = column_values_four
)

df_five_different_header <- data.frame(
  column_a = column_values_one,
  column_b = column_values_two
)

df_three_same_header <- data.frame(
  first_column = column_values_one,
  second_column = column_values_two
)

df_five_same_header <- data.frame(
  first_column = column_values_one,
  second_column = column_values_two
)

df_six_not_the_same_number_of_cols <- data.frame(first_column = column_values_four)


test_one_list <- list(df_one_main, df_two_same, df_three_different_header, df_four_same, df_five_different_header)

test_one_expected_outcome <- list(df_one_main, df_two_same, df_three_same_header, df_four_same, df_five_same_header)

test_two_list <- list(df_one_main)

test_two_expected_outcome <- test_two_list


#--------------------------------------------------------------------------------------------------------------------


test_that("All the dataframes with different headers to the first data frame in the list
          will have the same headers out of the function", {

            expect_equal(setDataframeColNamesToFirstDataframe(test_one_list),
                         test_one_expected_outcome)

          })


test_that("The same dataframe in the list will be returned when only one dataframe in the list is passed into the function", {

            expect_equal(setDataframeColNamesToFirstDataframe(test_two_list),
                         test_two_expected_outcome)

})
