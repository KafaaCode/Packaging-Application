part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.checkAuth() = _CheckAuth;
  const factory AuthEvent.createEvent({required User user}) = _CreateEvent;
  const factory AuthEvent.login({
    required User user,
  }) = _Login;
  const factory AuthEvent.register({
    required User user,
  }) = _Register;
  const factory AuthEvent.logout() = _Logout;
  const factory AuthEvent.updateProfile({required User user}) = _UpdateProfile;
  const factory AuthEvent.updatePassword({
    required String oldPassword,
    required String newPassword,
    required String confirmPassword,
  }) = _UpdatePassword;
}
