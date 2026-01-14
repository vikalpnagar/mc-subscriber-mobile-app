class ApiException {
  String message;
  bool translate;
  bool reportToCrashlytics;
  bool isOutOfCoverage;
  dynamic data;

  ApiException(
    this.message, {
    this.translate = true,
    this.reportToCrashlytics = false,
    this.isOutOfCoverage = false,
    this.data,
  });

  @override
  String toString() {
    return 'ApiException: $message, reportToCrashlytics: $reportToCrashlytics, isOutOfCoverage: $isOutOfCoverage';
  }
}
