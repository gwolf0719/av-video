abstract class AppException implements Exception {
  final String message;
  
  const AppException(this.message);
  
  @override
  String toString() => message;
}

class ServerException extends AppException {
  const ServerException(String message) : super(message);
}

class NetworkException extends AppException {
  const NetworkException(String message) : super(message);
}

class CacheException extends AppException {
  const CacheException(String message) : super(message);
}

class ParsingException extends AppException {
  const ParsingException(String message) : super(message);
}

class ValidationException extends AppException {
  const ValidationException(String message) : super(message);
}

class AgeVerificationException extends AppException {
  const AgeVerificationException(String message) : super(message);
} 