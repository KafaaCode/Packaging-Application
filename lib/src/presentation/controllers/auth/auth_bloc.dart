import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frip_trading/src/data/models/models.dart';
import 'package:frip_trading/src/domin/repository/auth_repository.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'auth_state.dart';
part 'auth_event.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends HydratedBloc<AuthEvent, AuthState> {
  final BaseAuthRepository repository;

  AuthBloc(this.repository) : super(const AuthState.initial()) {
    on<_CheckAuth>(_checkAuthEvent);
    on<_CreateEvent>(_createEvent);
    on<_Register>(_registerEvent);
    on<_Login>(_loginEvent);
  }

  void _checkAuthEvent(
    _CheckAuth event,
    Emitter<AuthState> emit,
  ) async {
    try {
      final token = await HydratedBloc.storage.read('token');
      final user = state.mapOrNull(
        create: (create) => create.user,
        loaded: (loaded) => loaded.user,
      );
      print('Token: $token');
      print('User: $user');
      if (token == null) {
        print('Token: $token');
        if (user != null) {
          final response = await repository.login(
            email: user.email,
            password: user.password!,
          );
          await response.fold((error) async {
            HydratedBloc.storage.clear();
            if (!emit.isDone) emit(AuthState.error(message: error.message));
          }, (r) async {
            await HydratedBloc.storage.write('token', r.token);
            if (!emit.isDone) emit(AuthState.loaded(user: r.user));
          });
        } else {
          if (!emit.isDone) emit(const AuthState.initial());
        }
      } else {
        if (!emit.isDone) {
          if (user != null) {
            emit(AuthState.loaded(user: user));
          } else {
            emit(const AuthState.initial());
          }
        }
      }
    } catch (e) {
      if (!emit.isDone) emit(AuthState.error(message: e.toString()));
    }
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
      final response = await repository.register(user: event.user);
      await response.fold((error) async {
        if (!emit.isDone) emit(AuthState.error(message: error.message));
      }, (r) async {
        await HydratedBloc.storage.write('token', r.token);
        if (!emit.isDone) emit(AuthState.loaded(user: r.user));
        if (!emit.isDone) {
          emit(state.maybeMap(
            orElse: () => AuthState.create(user: r.user),
            create: (create) => create.copyWith(user: r.user),
          ));
        }
      });
    } catch (e) {
      if (!emit.isDone) emit(AuthState.error(message: e.toString()));
    }
  }

  void _loginEvent(
    _Login event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loadInProgress());
    try {
      final response = await repository.login(
        email: event.user.email,
        password: event.user.password!,
      );
      await response.fold((error) async {
        if (!emit.isDone) emit(AuthState.error(message: error.message));
      }, (r) async {
        await HydratedBloc.storage.write('token', r.token);
        if (!emit.isDone) emit(AuthState.loaded(user: r.user));
        if (!emit.isDone) {
          emit(state.maybeMap(
            orElse: () => AuthState.create(user: r.user),
            create: (create) => create.copyWith(user: r.user),
          ));
        }
      });
    } catch (e) {
      if (!emit.isDone) emit(AuthState.error(message: e.toString()));
    }
  }

  @override
  AuthState? fromJson(Map<String, dynamic> json) {
    try {
      final stateType = json['type'] as String?;
      switch (stateType) {
        case '_Initial':
          return const AuthState.initial();
        case '_Create':
          return AuthState.create(
            user: User.fromJson(
              json['user'] as Map<String, dynamic>,
            ),
          );
        case '_LoadInProgress':
          return const AuthState.loadInProgress();
        case '_Loaded':
          return AuthState.loaded(
            user: User.fromJson(
              json['user'] as Map<String, dynamic>,
            ),
          );
        case '_Error':
          return AuthState.error(message: json['message'] as String);
        default:
          return null;
      }
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(AuthState state) {
    return state.map(
      initial: (_) => {'type': '_Initial'},
      create: (state) => {
        'type': '_Create',
        'user': state.user.toJson(),
      },
      loadInProgress: (_) => {'type': '_LoadInProgress'},
      loaded: (state) => {
        'type': '_Loaded',
        'user': state.user.toJson(),
      },
      error: (state) => {
        'type': '_Error',
        'message': state.message,
      },
    );
  }
}
