import 'package:equatable/equatable.dart';
import 'package:mentoship_rockets_discovries_project/spacex_app.dart';

import '../utils/functions.dart';

class ServerException extends Equatable implements Exception {
  final String? message;

  const ServerException([this.message]);

  @override
  List<Object?> get props => [message];

  @override
  String toString() {
    return '$message';
  }
}

class FetchDataException extends ServerException {
  const FetchDataException([message]) : super("Error During Communication");
}

class BadRequestException extends ServerException {
  const BadRequestException([message]) : super("Bad Request");
}

class UnauthorizedException extends ServerException {
  const UnauthorizedException([message]) : super("Unauthorized");
}

class NotFoundException extends ServerException {
  const NotFoundException([super.message]);
}

class ConflictException extends ServerException {
  const ConflictException([message]) : super("Conflict Occurred");
}

class InternalServerErrorException extends ServerException {
  const InternalServerErrorException([message])
      : super("Internal Server Error");
}

class NoInternetConnectionException extends ServerException {
  NoInternetConnectionException([message])
      : super(getLocaleStringFrom(
            arabic: 'لا يوجد اتصال بالانترنت',
            english: 'No Internet Connection',
            context: SpacexApp.navigatorKey.currentContext!));
}

class CacheException implements Exception {
  final String? message;

  const CacheException([this.message]);

  @override
  String toString() {
    return '$message';
  }
}
