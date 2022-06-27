library("Rcsvg")


test_input_vector <- c("file_one.csv", "file_two.csv", "file_three.csv", "file_four.csv")

test_output_vector <- c("file_three.csv", "file_one.csv", "file_two.csv", "file_four.csv")

test_item_1 <- "file_three.csv"

test_item_2 <- "not_in_list.csv"


test_that("Returns expected character vector when a matching item is in the list", {

  expect_equal(
    move_to_index_one(test_item_1, test_input_vector),
    test_output_vector
    )

})


test_that("Returns the same input vector because the first argument is not in the vector", {

  expect_equal(move_to_index_one(test_item_2, test_input_vector),
                  test_input_vector
  )

})
