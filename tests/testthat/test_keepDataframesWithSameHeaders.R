library("RcsvgPP")


column_values_one <- c(1,2,3,4)
column_values_two <- c(4,3,2,1)
column_values_three <- c(5,6,7,8)
column_values_four <- c(9,8,7,6)


df_one_same <- data.frame(
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

# test one setup

df_list_test_one <- list(df_one_same, df_two_same, df_three_different_header, df_four_same)

expected_outcome_test_one_checking_headers <- list(df_one_same, df_two_same, df_four_same)

expected_outcome_test_one_not_checking_headers <- list(df_one_same, df_two_same, df_three_different_header, df_four_same)

# test two setup

df_list_test_two <- list(df_one_same, df_two_same, df_four_same)

expected_outcome_test_two_checking_headers <- list(df_one_same, df_two_same, df_four_same)

# test three setup

df_list_test_three <- list(df_one_same, df_two_same, df_three_different_header, df_four_same, df_five_different_header)

expected_outcome_test_three_checking_headers <- list(df_one_same, df_two_same, df_four_same)

#-----------------------------------------------------------------------------------------------------------------------------------------


# Tests


test_that("one Dataframe with different header names will not be in the functions returned list", {

            expect_equal(keepDataframesWithSameHeaders(df_list_test_one, TRUE),
                         expected_outcome_test_one_checking_headers)

          })


test_that("The same dataframes will be returned from the input list when the column number is only checked and not the header names", {

  expect_equal(keepDataframesWithSameHeaders(df_list_test_one, FALSE),
               expected_outcome_test_one_not_checking_headers)

})


test_that("The same dataframes will be returned from the input list when all the data frames have the same headers", {

  expect_equal(keepDataframesWithSameHeaders(df_list_test_two, TRUE),
               expected_outcome_test_two_checking_headers)

})


test_that("Two Dataframes with different header names will not be in the functions returned list", {

  expect_equal(keepDataframesWithSameHeaders(df_list_test_three, TRUE),
               expected_outcome_test_three_checking_headers)

})
