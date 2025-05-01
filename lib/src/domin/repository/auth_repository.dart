import 'package:frip_trading/core/utils/typedef.dart';
import 'package:frip_trading/src/data/models/models.dart';

abstract class BaseAuthRepository {
  ResultFuture<Auth> register({required User user});
  ResultFuture<UpdateData> update({required User user});
  ResultFuture<UpdateData> updateProfile({required String path});
  ResultFuture<Auth> login({required String email, required String password});
  ResultFuture<String> updatePassword({
    required String oldPassword,
    required String newPassword,
    required String confirmPassword,
  });
  ResultFuture<Auth> refreshToken();
  ResultFuture<bool> logout();
}
