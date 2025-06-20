import 'package:flutter/material.dart';
import 'package:frip_trading/core/network/api_call_handler.dart';
import 'package:frip_trading/src/data/data_source/auth_remote_data_source.dart';
import 'package:frip_trading/src/data/main/main_remote_data_source.dart';
import 'package:frip_trading/src/data/repository/auth_repository.dart';
import 'package:frip_trading/src/data/repository/main_repository.dart';
import 'package:frip_trading/src/domin/repository/auth_repository.dart';
import 'package:frip_trading/src/domin/repository/main_repository.dart';
import 'package:frip_trading/src/features/inital/data/data_source/inital_remote_data_source.dart';
import 'package:frip_trading/src/features/inital/data/repository/inital_repository.dart';
import 'package:frip_trading/src/features/inital/domain/repository/inital_repository.dart';
import 'package:frip_trading/src/features/inital/presentation/inital/inital_bloc.dart';
import 'package:frip_trading/src/presentation/controllers/auth/auth_bloc.dart';
import 'package:frip_trading/src/presentation/controllers/cart/cart_bloc.dart';
import 'package:frip_trading/src/presentation/controllers/category/category_bloc.dart';
import 'package:frip_trading/src/presentation/controllers/myorder/myorder_bloc.dart';
import 'package:frip_trading/src/presentation/controllers/products/products_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    _initalSL();
    _authSl();
    _mainSl();
  }

  void _authSl() {
    sl.registerFactory(() => ApiCallHandler(authDataSource: sl()));
    sl.registerLazySingleton(() => AuthBloc(sl()));
    sl.registerLazySingleton<BaseAuthRepository>(
        () => AuthRepository(baseAuthRemoteDataSource: sl()));
    sl.registerLazySingleton<BaseAuthRemoteDataSource>(
        () => AuthRemoteDataSource());
  }

  void _mainSl() {
    sl.registerLazySingleton<BaseMainRepository>(
        () => MainRepository(mainRemoteDataSource: sl()));
    sl.registerLazySingleton<BaseMainRemoteDataSource>(
        () => MainRemoteDataSource());
    sl.registerFactory(() => ProductBloc(mainRepository: sl()));
    sl.registerLazySingleton(() => CategoriesBloc(sl()));

    sl.registerLazySingleton(() => MyOrdersBloc(sl()));
    sl.registerLazySingleton(() => CartBloc());
  }

  void _initalSL() {
    sl.registerLazySingleton(() => InitalBloc(initalRepository: sl()));
    sl.registerLazySingleton<BaseInitalRepository>(
        () => InitalRepository(sl()));
    sl.registerLazySingleton<BaseInitalRemoteDataSource>(
        () => InitalRemoteDataSource());
  }
}

class SingleInstanceService {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static BuildContext? get context => navigatorKey.currentContext;
}
