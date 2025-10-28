import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  const Failure({required this.message, required this.statusCode, this.errors});

  final String message;
  final int statusCode;
  final Map? errors;

  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure(
      {required super.statusCode, required super.message, super.errors});

  factory ServerFailure.fromResponse(
      {required int statusCode, dynamic response}) {
    if (statusCode == 404) {
      return ServerFailure(
          message: 'Your Api Server is not found , please try later',
          statusCode: statusCode);
    } else if (statusCode == 500) {
      return ServerFailure(
          message: 'there is a problem with server , please try later',
          statusCode: statusCode);
    } else if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      // return ServerFailure(message: response['error']['message']);
      return ServerFailure(
          message: "Check your Email and Password", statusCode: statusCode);
    } else {
      return ServerFailure(
          message: 'there was an error , please try again',
          statusCode: statusCode);
    }
  }
}

class DatabaseFailure extends Failure {
  const DatabaseFailure({required super.statusCode, required super.message});
}
