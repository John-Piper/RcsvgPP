#include <Rcpp.h>
#include <algorithm>
using namespace Rcpp;


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

