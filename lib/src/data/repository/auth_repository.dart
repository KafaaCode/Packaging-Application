import 'package:dartz/dartz.dart';
import 'package:frip_trading/core/error/exceptions.dart';
import 'package:frip_trading/core/error/failure.dart';
import 'package:frip_trading/core/utils/typedef.dart';
import 'package:frip_trading/src/data/data_source/auth_remote_data_source.dart';
import 'package:frip_trading/src/data/models/models.dart';
import 'package:frip_trading/src/domin/repository/auth_repository.dart';

class AuthRepository extends BaseAuthRepository {
  final BaseAuthRemoteDataSource baseAuthRemoteDataSource;

  AuthRepository({required this.baseAuthRemoteDataSource});
  @override
  ResultFuture<Auth> login(
      {required String email, required String password}) async {
    try {
      final response = await baseAuthRemoteDataSource.login(
          email: email, password: password);
      return Right(response);
    } on AuthException catch (failure) {
      return Left(Failure(
          statusCode: failure.statusCode ?? 404,
          message: failure.authMessage ?? 'error'));
    }
  }

  @override
  ResultFuture<bool> logout() async {
    try {
      final response = await baseAuthRemoteDataSource.logout();
      return Right(response);
    } on AuthException catch (failure) {
      return Left(Failure(
          statusCode: failure.statusCode ?? 404,
          message: failure.authMessage ?? 'error'));
    }
  }

  @override
  ResultFuture<Auth> refreshToken() {
    // TODO: implement refreshToken
    throw UnimplementedError();
  }

  @override
  ResultFuture<Auth> register(
      {required String companyName,
      required String name,
      required String email,
      required String password,
      required String confirmPassword,
      required int specId,
      required int countryId}) async {
    try {
      final response = await baseAuthRemoteDataSource.register(
          confirmPassword: confirmPassword,
          email: email,
          name: name,
          password: password,
          companyName: companyName,
          countryId: countryId,
          specId: specId);
      return Right(response);
    } on AuthException catch (failure) {
      return Left(Failure(
          statusCode: failure.statusCode ?? 404,
          message: failure.authMessage ?? 'error'));
    }
  }

  @override
  ResultFuture<UpdateData> update({required User user}) async {
    try {
      final response = await baseAuthRemoteDataSource.update(user: user);
      return Right(response);
    } on AuthException catch (failure) {
      return Left(Failure(
          statusCode: failure.statusCode ?? 404,
          message: failure.authMessage ?? 'error'));
    }
  }

  @override
  ResultFuture<UpdateData> updateProfile(
      {String? companyName,
      String? name,
      String? email,
      int? specializationId,
      int? countryId}) async {
    try {
      final response = await baseAuthRemoteDataSource.updateProfile(
          companyName: companyName,
          name: name,
          email: email,
          specializationId: specializationId,
          countryId: countryId);
      return Right(response);
    } on AuthException catch (failure) {
      return Left(Failure(
          statusCode: failure.statusCode ?? 404,
          message: failure.authMessage ?? 'error'));
    }
  }

  @override
  ResultFuture<String> updatePassword(
      {required String oldPassword,
      required String newPassword,
      required String confirmPassword}) async {
    try {
      final response = await baseAuthRemoteDataSource.updatePassword(
        oldPassword: oldPassword,
        newPassword: newPassword,
        confirmPassword: confirmPassword,
      );
      return Right(response);
    } on AuthException catch (failure) {
      return Left(Failure(
          statusCode: failure.statusCode ?? 404,
          message: failure.authMessage ?? 'error'));
    }
  }

  @override
  ResultFuture<bool> deleteAccount() async {
    try {
      final response = await baseAuthRemoteDataSource.deleteAccount();
      return right(response);
    } on AuthException catch (failure) {
      return left(Failure(
          message: failure.authMessage ?? "error",
          statusCode: failure.statusCode ?? 404));
    }
  }

  //update user
}
