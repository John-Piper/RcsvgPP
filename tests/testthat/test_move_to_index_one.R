library("RcsvgPP")


test_input_vector <- c("file_one.csv", "file_two.csv", "file_three.csv", "file_four.csv")

test_output_vector <- c("file_three.csv", "file_two.csv", "file_one.csv", "file_four.csv")

test_item_1 <- "file_three.csv"

test_item_2 <- "not_in_list.csv"


test_that("Swaps index 0 with the index number of the matching value in the 2nd argument in the function", {

  expect_equal(
    moveToIndexOne(test_item_1, test_input_vector),
    test_output_vector
    )

})


test_that("Returns the same input vector because the first argument is not in the vector", {

  expect_equal(moveToIndexOne(test_item_2, test_input_vector),
                  test_input_vector
  )

})
