import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frip_trading/src/data/models/models.dart';

part 'auth_state.dart';
part 'auth_event.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState.initial()) {
    on<_CreateEvent>(_createEvent);
    on<_Register>(_registerEvent);
    on<_Login>(_loginEvent);
  }
  void _createEvent(
    _CreateEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthState.create(user: event.user));
  }

  void _registerEvent(
    _Register event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loadInProgress());
    try {
      await Future.delayed(const Duration(seconds: 3));
      emit(AuthState.loaded(user: event.user));
    } catch (e) {
      emit(AuthState.error(message: e.toString()));
    }
  }

  void _loginEvent(
    _Login event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loadInProgress());
    try {
      await Future.delayed(const Duration(seconds: 3));
      emit(AuthState.loaded(user: event.user));
    } catch (e) {
      emit(AuthState.error(message: e.toString()));
    }
  }
}
