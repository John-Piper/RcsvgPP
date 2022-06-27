#' Moves an item in a list to the front if it is in the list.
#'
#' Helper function for glue_data
#'
#' @param x character vector.  The name of the item to move to the front of the character vector
#' @param input_vector character vector.
#'
#' @return character vector
#'
#' @noRd
#'
#' @examples
#'
#' \dontrun{
#'
#' letters <- c("a", "b", "c")
#'
#' letters <- move_to_index_one("c", letters)
#'
#' print(letters) #c("C", "a", "b")
#'
#' }
move_to_index_one <- function(x, input_vector) {

  index <- 1

  for (i in input_vector) {

    if (x == i) {

      break

    } else {

      index <- index + 1

    }

  }

  if (index > length(input_vector)) {

    return(input_vector)

  }

  output_vector <- c(x, input_vector[-index])

}
