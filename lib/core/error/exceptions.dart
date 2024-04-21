/// [ServerException] will be thrown when the server returns an error code.
class ServerException implements Exception {
  /// [ServerException] constructor takes a [message] as an optional parameter.
  ServerException({
    required this.message,
    this.applicationStatus,
    this.stackTrace,
  });

  /// [message] is the error message returned from the server.
  final String message;
  final String? applicationStatus;
  final StackTrace? stackTrace;

  @override
  String toString() => 'ServerException: $message \n StackTrace: $stackTrace';
}

/// [CacheException] will be thrown when there is an error while caching or retrieving data from the local storage.
class CacheException implements Exception {
  /// [CacheException] constructor takes a [message] as an optional parameter.
  CacheException({
    required this.message,
    this.stackTrace,
  });

  /// [message] is the error message returned from the local storage service.
  final String message;
  final StackTrace? stackTrace;

  @override
  String toString() => 'CacheException: $message \n StackTrace: $stackTrace';
}

/// [NetworkException] will be thrown when there is an error while caching or retrieving data from the local storage.
class NetworkException implements Exception {
  /// [NetworkException] constructor takes a [message] as an optional parameter.
  NetworkException({
    required this.message,
    this.stackTrace,
  });

  /// [message] is the error message returned from the local storage service.
  final String message;
  final StackTrace? stackTrace;

  @override
  String toString() => 'NetworkException: \n StackTrace: $stackTrace';
}
