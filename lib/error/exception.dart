class ServerException implements Exception {
  final String message;

  ServerException({required this.message});
}

class UnAuthorizedException implements Exception {}

class DataBaseException implements Exception {}

class UnVerifiedException implements Exception {
  final String authData;

  UnVerifiedException({required this.authData});
}
