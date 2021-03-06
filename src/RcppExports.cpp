// Generated by using Rcpp::compileAttributes() -> do not edit by hand
// Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

#include <Rcpp.h>

using namespace Rcpp;

#ifdef RCPP_USE_GLOBAL_ROSTREAM
Rcpp::Rostream<true>&  Rcpp::Rcout = Rcpp::Rcpp_cout_get();
Rcpp::Rostream<false>& Rcpp::Rcerr = Rcpp::Rcpp_cerr_get();
#endif

// sameHeaders
bool sameHeaders(const DataFrame& leftDataFrame, const DataFrame& rightDataFrame);
RcppExport SEXP _RcsvgPP_sameHeaders(SEXP leftDataFrameSEXP, SEXP rightDataFrameSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< const DataFrame& >::type leftDataFrame(leftDataFrameSEXP);
    Rcpp::traits::input_parameter< const DataFrame& >::type rightDataFrame(rightDataFrameSEXP);
    rcpp_result_gen = Rcpp::wrap(sameHeaders(leftDataFrame, rightDataFrame));
    return rcpp_result_gen;
END_RCPP
}
// dataFrameHeadersCheck
bool dataFrameHeadersCheck(const DataFrame& leftDataFrame, const DataFrame& rightDataFrame, bool checkHeaderNames);
RcppExport SEXP _RcsvgPP_dataFrameHeadersCheck(SEXP leftDataFrameSEXP, SEXP rightDataFrameSEXP, SEXP checkHeaderNamesSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< const DataFrame& >::type leftDataFrame(leftDataFrameSEXP);
    Rcpp::traits::input_parameter< const DataFrame& >::type rightDataFrame(rightDataFrameSEXP);
    Rcpp::traits::input_parameter< bool >::type checkHeaderNames(checkHeaderNamesSEXP);
    rcpp_result_gen = Rcpp::wrap(dataFrameHeadersCheck(leftDataFrame, rightDataFrame, checkHeaderNames));
    return rcpp_result_gen;
END_RCPP
}
// keepDataframesWithSameHeaders
std::vector<DataFrame> keepDataframesWithSameHeaders(std::vector<DataFrame>& dataframeVector, bool checkHeaderNames);
RcppExport SEXP _RcsvgPP_keepDataframesWithSameHeaders(SEXP dataframeVectorSEXP, SEXP checkHeaderNamesSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< std::vector<DataFrame>& >::type dataframeVector(dataframeVectorSEXP);
    Rcpp::traits::input_parameter< bool >::type checkHeaderNames(checkHeaderNamesSEXP);
    rcpp_result_gen = Rcpp::wrap(keepDataframesWithSameHeaders(dataframeVector, checkHeaderNames));
    return rcpp_result_gen;
END_RCPP
}
// moveToIndexOne
CharacterVector moveToIndexOne(String x, CharacterVector& chrVector);
RcppExport SEXP _RcsvgPP_moveToIndexOne(SEXP xSEXP, SEXP chrVectorSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< String >::type x(xSEXP);
    Rcpp::traits::input_parameter< CharacterVector& >::type chrVector(chrVectorSEXP);
    rcpp_result_gen = Rcpp::wrap(moveToIndexOne(x, chrVector));
    return rcpp_result_gen;
END_RCPP
}
// setDataframeColNamesToFirstDataframe
std::vector<DataFrame> setDataframeColNamesToFirstDataframe(std::vector<DataFrame>& dataframeVector);
RcppExport SEXP _RcsvgPP_setDataframeColNamesToFirstDataframe(SEXP dataframeVectorSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< std::vector<DataFrame>& >::type dataframeVector(dataframeVectorSEXP);
    rcpp_result_gen = Rcpp::wrap(setDataframeColNamesToFirstDataframe(dataframeVector));
    return rcpp_result_gen;
END_RCPP
}

static const R_CallMethodDef CallEntries[] = {
    {"_RcsvgPP_sameHeaders", (DL_FUNC) &_RcsvgPP_sameHeaders, 2},
    {"_RcsvgPP_dataFrameHeadersCheck", (DL_FUNC) &_RcsvgPP_dataFrameHeadersCheck, 3},
    {"_RcsvgPP_keepDataframesWithSameHeaders", (DL_FUNC) &_RcsvgPP_keepDataframesWithSameHeaders, 2},
    {"_RcsvgPP_moveToIndexOne", (DL_FUNC) &_RcsvgPP_moveToIndexOne, 2},
    {"_RcsvgPP_setDataframeColNamesToFirstDataframe", (DL_FUNC) &_RcsvgPP_setDataframeColNamesToFirstDataframe, 1},
    {NULL, NULL, 0}
};

RcppExport void R_init_RcsvgPP(DllInfo *dll) {
    R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
    R_useDynamicSymbols(dll, FALSE);
}
