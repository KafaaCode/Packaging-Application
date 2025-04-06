part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.checkAuth() = _CheckAuth;
  const factory AuthEvent.login({
    required String email,
    required String password,
  }) = _Login;
  const factory AuthEvent.register({
    required String name,
    required String email,
    required String password,
    required String gander,
    required String phoneNumber,
    required String region,
  }) = _Register;
  const factory AuthEvent.logout() = _Logout;
  const factory AuthEvent.updateProfile({
    required String name,
    required String email,
    required String gander,
    required String phoneNumber,
    required String region,
  }) = _UpdateProfile;
  const factory AuthEvent.updatePassword({
    required String oldPassword,
    required String newPassword,
  }) = _UpdatePassword;
}
