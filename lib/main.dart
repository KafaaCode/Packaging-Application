import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frip_trading/core/localization/generated/l10n.dart';
import 'package:frip_trading/core/localization/language/language_cubit.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:frip_trading/core/observer/app_observer.dart';
import 'package:frip_trading/core/routes/router_screens.dart';
import 'package:frip_trading/core/routes/routers_define.dart';
import 'package:frip_trading/core/routes/routes_name.dart';
import 'package:frip_trading/core/services/services_locator.dart';
import 'package:frip_trading/core/theme/theme.dart';
import 'package:frip_trading/core/theme/theme_cubit.dart';
import 'package:frip_trading/src/features/inital/presentation/inital/inital_bloc.dart';
import 'package:frip_trading/src/presentation/controllers/auth/auth_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorageDirectory.web
        : HydratedStorageDirectory((await getTemporaryDirectory()).path),
  );
  Bloc.observer = AppBlocObserver();
  ServicesLocator().init();
  configureRoutes(AppRouter.router);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => LanguageCubit(),
                lazy: false,
              ),
              BlocProvider(
                  lazy: false,
                  create: (context) =>
                      sl<InitalBloc>()..add(const InitalEvent.getInitalData())),
              BlocProvider(create: (context) => ThemesCubit()),
              BlocProvider(
                  create: (context) =>
                      sl<AuthBloc>()..add(const AuthEvent.checkAuth())),
            ],
            child: BlocBuilder<ThemesCubit, ThemeMode>(
              builder: (context, state) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  localizationsDelegates: const [
                    Lang.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  locale: const Locale('en'),
                  supportedLocales: Lang.delegate.supportedLocales,
                  theme: lightTheme,
                  darkTheme: darkTheme,
                  themeMode: state,
                  onGenerateTitle: (BuildContext context) => "app",
                  initialRoute: RoutesNames.initalRoute,
                  onGenerateRoute: AppRouter.router.generator,
                  navigatorKey: SingleInstanceService.navigatorKey,
                );
              },
            ),
          );
        });
  }
}
