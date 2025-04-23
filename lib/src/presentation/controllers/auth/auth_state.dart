part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.create({required User user}) = _Create;
  const factory AuthState.loadInProgress() = _LoadInProgress;
  const factory AuthState.error({required String message}) = _Error;
}
