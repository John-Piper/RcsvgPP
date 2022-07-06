#include <Rcpp.h>
#include <algorithm>
using namespace Rcpp;


//' Moves a string in a charcater vector to the start of the vector if it matches the string input.
//'
//' @param x String The string value to match in the character vector to move to the front.
//' @param chrVector character vector.
//' @return character vector.
// [[Rcpp::export]]
CharacterVector moveToIndexOne(String x, CharacterVector &chrVector) {

  CharacterVector::iterator it;

  for (it = chrVector.begin(); it != chrVector.end(); ++it) {

    if (x == *it) {

      std::iter_swap(chrVector.begin(), it);

      break;

    }

  }

  return chrVector;

}

