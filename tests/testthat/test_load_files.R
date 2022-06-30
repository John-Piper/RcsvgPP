library("RcsvgPP")


#-----------------------------------------------------------------------------------------------------------------


# setup

current_working_directory <- getwd()

file_path <- list("folder_files_for_tests/test_one/csv_test_file_1.csv")


#---------------------------------------------------------------------------


#tests


test_that("Expect a list to be returned from the function", {

  expect_type(load_files(file_path,
                         current_working_directory,
                         read.csv),
              "list")

})


test_that("Expect a data.frame in the list to be returned from the function", {

  df_list <- load_files(file_path,
                        current_working_directory,
                        read.csv)

  df <- df_list[[1]]

  expect_s3_class(df,
              "data.frame")

})
