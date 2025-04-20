// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:frip_trading/core/error/error_message.dart';

class ServerException implements Exception {
  final int? statusCode;
  final ErrorMessageModel errorMessageModel;

  const ServerException(
      {required this.statusCode, required this.errorMessageModel});
}

class AuthException implements Exception {
  final int? statusCode;
  final String? authMessage;
  AuthException({
    required this.statusCode,
    required this.authMessage,
  });

  // factory AuthException.fromDioError(int statusCode, DioException error) {
  //   switch (error.type) {
  //     case DioExceptionType.connectionTimeout:
  //       return AuthException(
  //           authMessage: "connection timout with api server",
  //           statusCode: statusCode);

  //     case DioExceptionType.sendTimeout:
  //       return AuthException(
  //           authMessage: "send timout with api server", statusCode: statusCode);

  //     case DioExceptionType.receiveTimeout:
  //       return AuthException(
  //           authMessage: "receive timout with api server",
  //           statusCode: statusCode);

  //     case DioExceptionType.badCertificate:
  //       return AuthException(
  //           authMessage: "badCertificate timout with api server",
  //           statusCode: statusCode);

  //     case DioExceptionType.badResponse:
  //       return AuthException(
  //           authMessage: "badResponse", statusCode: statusCode);
  //     case DioExceptionType.cancel:
  //       return AuthException(
  //           authMessage: "request to Api Server was canceld",
  //           statusCode: statusCode);

  //     case DioExceptionType.connectionError:
  //       return AuthException(
  //           authMessage: "No Internet Connection", statusCode: statusCode);

  //     case DioExceptionType.unknown:
  //       return AuthException(
  //           authMessage: "Something was wrong!", statusCode: statusCode);

  //   }
  // }
  @override
  String toString() =>
      'AuthException(statusCode: $statusCode, authMessage: $authMessage)';
}
