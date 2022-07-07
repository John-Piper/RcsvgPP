#include <Rcpp.h>
using namespace Rcpp;


//' checks the same headers are in both data frames past into the function.
//' Helper function for dataFrameHeadersCheck.
//'
//' @param leftDataFrame data frame.
//' @param rightDataFrame data frame.
//' @return bool true if the data frames have the same headers else false.
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


//' checks two different data frames have the same number of columns and the same headers if requested.
//' Helper function for indexOfDiffDataframeInVector.
//'
//' @param leftDataFrame data frame.
//' @param rightDataFrame data frame.
//' @param checkHeaderNames bool true if header names required checking.
//' @return bool true if the data frames have the same number of columns and if required the headers are the same else false.
// [[Rcpp::export]]
bool dataFrameHeadersCheck(const DataFrame &leftDataFrame, const DataFrame &rightDataFrame, bool checkHeaderNames) {

  if (leftDataFrame.ncol() != rightDataFrame.ncol()) {

    return false;

  }

  if (checkHeaderNames) {

    if (!sameHeaders(leftDataFrame, rightDataFrame)) {

      return false;

    }

  }

  return true;

}


//' adds the index number of the data frames from a vector to remove in a int vector.
//'
//' @param indexOfDataframesToRemove an empty int vector passed by reference for index numbers to be added if required.
//' @param dataframeVector vector of data frames.
//' @param checkHeaderNames bool true if header names required checking for the helper function dataFrameHeadersCheck.
//' @return void.
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


//' removes data frames from a vector using the index positions from a vector of ints.
//' Helper function for keepDataframesWithSameHeaders.
//'
//' @param indexOfDataframesToRemove an int vector passed by reference with the position of the data frames in a vector to be removed.
//' @param dataframeVector vector of data frames.
//' @return void.
void removeDifferentDataframes(std::vector<int> &indexOfDataframesToRemove, std::vector<DataFrame> &dataframeVector) {

  if (indexOfDataframesToRemove.size() == 0) {

    return;

  }

  std::vector<int>::iterator it;

  for (it = indexOfDataframesToRemove.begin(); it != indexOfDataframesToRemove.end(); ++it) {

    dataframeVector.erase(dataframeVector.begin() + *it);

  }

}


//' removes data frames from a vector if they do not have the same header structure as the first data frame in the vector.
//'
//' @param dataframeVector vector of data frames.
//' @param checkHeaderNames bool true if header names required checking for the helper function dataFrameHeadersCheck.
//' @return vector of data frames.
// [[Rcpp::export]]
std::vector<DataFrame> keepDataframesWithSameHeaders(std::vector<DataFrame> &dataframeVector, bool checkHeaderNames) {

  std::vector<int> indexOfDataframesToRemove;

  indexOfDiffDataframeInVector(indexOfDataframesToRemove, dataframeVector, checkHeaderNames);

  removeDifferentDataframes(indexOfDataframesToRemove, dataframeVector);

  return dataframeVector;

}
