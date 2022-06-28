#include <Rcpp.h>
using namespace Rcpp;


// [[Rcpp::export]]
bool sameHeaders(DataFrame leftDataFrame, DataFrame rightDataFrame) {

  CharacterVector leftDFNames = leftDataFrame.names();

  CharacterVector rightDFNames = rightDataFrame.names();

  if (leftDFNames.size() != rightDFNames.size()) {

    return false;

  }

  bool isSameValue = true;

  CharacterVector::iterator it_left;
  CharacterVector::iterator it_right = rightDFNames.begin();

  for (it_left = leftDFNames.begin(); it_left != leftDFNames.end(); ++it_left) {

    if (*it_left != *it_right) {

      isSameValue = false;

      break;

    }

    ++it_right;

  }

  return isSameValue;


}
