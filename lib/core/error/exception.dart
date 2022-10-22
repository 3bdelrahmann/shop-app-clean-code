class UnknownServerException implements Exception {}

class RequestErrorException implements Exception {
  final String responseMessage;

  RequestErrorException({required this.responseMessage});
}

class CacheException implements Exception {}

class InputFieldException implements Exception {
  final String message;

  InputFieldException({required this.message});
}
