#include <Rcpp.h>
using namespace Rcpp;


// [[Rcpp::export]]
bool sameHeaders(const DataFrame &leftDataFrame, const DataFrame &rightDataFrame) {

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



// [[Rcpp::export]]
bool dataFrameHeadersCheck(const DataFrame &leftDataFrame, const DataFrame &rightDataFrame, bool checkHeaderNames) {

  if (checkHeaderNames) {

    if (!sameHeaders(leftDataFrame, rightDataFrame)) {

      return false;

    }

  }

  if (leftDataFrame.ncol() != rightDataFrame.ncol()) {

    return false;

  }

  return true;

}



void indexOfDiffDataframeInVector(std::vector<int> &indexOfDataframesToRemove, std::vector<DataFrame> &dataframeVector, bool const &checkHeaderNames) {

  std::vector<DataFrame>::iterator it;

  int index = 1;

  for (it = dataframeVector.begin() + 1; it != dataframeVector.end(); ++it) {

    if (!(dataFrameHeadersCheck(*dataframeVector.begin(), *it, checkHeaderNames))) {

      indexOfDataframesToRemove.push_back(index);

    }

    index++;

  }

}


void removeDifferentDataframes(std::vector<int> &indexOfDataframesToRemove, std::vector<DataFrame> &dataframeVector) {

  if (indexOfDataframesToRemove.size() == 0) {

    return;

  }

  std::vector<int>::iterator it;

  for (it = indexOfDataframesToRemove.begin(); it != indexOfDataframesToRemove.end(); ++it) {

    dataframeVector.erase(dataframeVector.begin() + *it);

  }

}



// [[Rcpp::export]]
std::vector<DataFrame> keepDataframesWithSameHeaders(std::vector<DataFrame> &dataframeVector, bool checkHeaderNames) {

  std::vector<int> indexOfDataframesToRemove;

  indexOfDiffDataframeInVector(indexOfDataframesToRemove, dataframeVector, checkHeaderNames);

  removeDifferentDataframes(indexOfDataframesToRemove, dataframeVector);

  return dataframeVector;

}

