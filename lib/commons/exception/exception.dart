class DataApiException implements Exception {
  String? cause;
  DataApiException(this.cause);
}

class DataLocalException implements Exception {
  String? cause;
  DataLocalException(this.cause);
}

