library("Rcsvg")

#-----------------------------------------------------------------------------------------------------------------


# setup

test_one_csv_location <- "folder_files_for_tests/test_one"

expected_result_one <- read.csv("folder_files_for_tests/test_one/expected_result/expected_result_one.csv")


test_two_csv_location <- "folder_files_for_tests/test_two"

expected_result_two_a <- read.csv("folder_files_for_tests/test_two/expected_result/expected_result_two_a.csv")

expected_result_two_b <- read.csv("folder_files_for_tests/test_two/expected_result/expected_result_two_b.csv")


test_three_csv_location <- "folder_files_for_tests/test_three"

expected_result_three_a <- read.csv("folder_files_for_tests/test_three/expected_result/expected_result_three_a.csv")

expected_result_three_b <- read.csv("folder_files_for_tests/test_three/expected_result/expected_result_three_b.csv", stringsAsFactors=FALSE)


#-----------------------------------------------------------------------------------------------------------------


# Tests


test_that("The csv files with the same columns names from the folder path will merge into one dataframe", {

  expect_equal(glue_from_folder(folder_path = test_one_csv_location),
               expected_result_one)

})


test_that("The csv files with the different columns names but same number of columns from the folder path will merge into one dataframe", {

  expect_equal(glue_from_folder(folder_path = test_two_csv_location, check_header_names = FALSE),
               expected_result_two_a)

})


test_that("The csv files with the different columns names but same number of columns from the folder path will merge into one dataframe.
          The first file will be selected", {

  expect_equal(glue_from_folder(folder_path = test_two_csv_location, check_header_names = FALSE, first_file = "csv_test_file_2_column_no_names.csv"),
               expected_result_two_b)

})


test_that("The csv files with the different name and column size will be ignored when the csv files are merged together", {

            expect_equal(glue_from_folder(folder_path = test_three_csv_location, check_header_names = TRUE, first_file = "csv_test_file_1.csv"),
                         expected_result_three_a)

          })


test_that("The csv files with the different size columns will be ignored when the csv files are merged together", {

  expect_equal(glue_from_folder(folder_path = test_three_csv_location,
                                pattern = "*.csv",
                                check_header_names = FALSE,
                                first_file = "csv_test_file_extra_column_no_names.csv",
                                func=read.csv,
                                stringsAsFactors=FALSE),
              expected_result_three_b)

})

