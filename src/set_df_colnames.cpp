#include <Rcpp.h>
using namespace Rcpp;


// [[Rcpp::export]]
std::vector<DataFrame> setDataframeColNamesToFirstDataframe(std::vector<DataFrame> &dataframeVector) {

  int length = dataframeVector.size();

  if (length <= 1) {

    return dataframeVector;

  }

  for (int i = 1; i < length; ++i) {

    if (dataframeVector[0].ncol() != dataframeVector[i].ncol()) {

      stop("`dataframeVecotr[0]` should have the same number of columns as `dataframeVecotr[i]`");

    }

    dataframeVector[i].attr("names") = dataframeVector[0].attr("names");

  }

  return dataframeVector;

}
