import 'package:frip_trading/core/utils/typedef.dart';
import 'package:frip_trading/src/data/models/models.dart';

abstract class BaseAuthRepository {
  ResultFuture<Auth> register(
      {required String companyName,
      required String name,
      required String email,
      required String password,
      required String confirmPassword,
      required int specId,
      required int countryId});
  ResultFuture<UpdateData> update({required User user});
  ResultFuture<UpdateData> updateProfile(
      {String? companyName,
      String? name,
      String? email,
      int? specializationId,
      int? countryId});
  ResultFuture<Auth> login({required String email, required String password});
  ResultFuture<String> updatePassword({
    required String oldPassword,
    required String newPassword,
    required String confirmPassword,
  });
  ResultFuture<Auth> refreshToken();
  ResultFuture<bool> logout();
  ResultFuture<bool> deleteAccount();
}
