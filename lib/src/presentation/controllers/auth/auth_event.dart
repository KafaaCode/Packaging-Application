part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.checkAuth() = _CheckAuth;
  const factory AuthEvent.createEvent({required User user}) = _CreateEvent;
  const factory AuthEvent.login({
    required User user,
  }) = _Login;
  const factory AuthEvent.deleteEvent() = _DeleteEvent;
  const factory AuthEvent.register({
    required String companyName,
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
    required int specId,
    required int countryId,
  }) = _Register;
  const factory AuthEvent.logout() = _Logout;
  const factory AuthEvent.updateProfile(
      {String? companyName,
      String? name,
      String? email,
      int? specializationId,
      int? countryId}) = _UpdateProfile;
  const factory AuthEvent.updatePassword({
    required String oldPassword,
    required String newPassword,
    required String confirmPassword,
  }) = _UpdatePassword;

  const factory AuthEvent.adminRegisterUser({
    required String companyName,
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
    required int specId,
    required int countryId,
  }) = _AdminRegisterUser;
}
