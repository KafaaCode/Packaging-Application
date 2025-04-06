import 'package:flutter/material.dart';
import 'package:frip_trading/src/data/data_source/auth_remote_data_source.dart';
import 'package:frip_trading/src/data/repository/auth_repository.dart';
import 'package:frip_trading/src/domin/repository/auth_repository.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    _authSl();
  }

  void _authSl() {
    sl.registerLazySingleton<BaseAuthRepository>(
        () => AuthRepository(baseAuthRemoteDataSource: sl()));
    sl.registerLazySingleton<BaseAuthRemoteDataSource>(
        () => AuthRemoteDataSource());
  }
}

class SingleInstanceService {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static BuildContext? get context => navigatorKey.currentContext;
}
