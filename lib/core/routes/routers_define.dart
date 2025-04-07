import 'package:fluro/fluro.dart';
import 'package:frip_trading/core/routes/routes_name.dart';
import 'package:frip_trading/src/presentation/screens/auth/login_page.dart';
import 'package:frip_trading/src/presentation/screens/auth/register_page.dart';
import 'package:frip_trading/src/presentation/screens/init_page.dart';
import 'package:frip_trading/src/presentation/screens/main/main_page.dart';

void configureRoutes(FluroRouter router) {
  router.define(
    RoutesNames.initalRoute,
    handler: Handler(
      handlerFunc: (context, parameters) {
        return InitPage(context);
      },
    ),
  );
  router.define(
    RoutesNames.mainRoute,
    handler: Handler(
      handlerFunc: (context, parameters) {
        return const MainPage();
      },
    ),
  );
  router.define(
    RoutesNames.loginRoute,
    handler: Handler(
      handlerFunc: (context, parameters) {
        return const LoginPage();
      },
    ),
  );
  router.define(
    RoutesNames.registerRoute,
    handler: Handler(
      handlerFunc: (context, parameters) {
        return const RegisterPage();
      },
    ),
  );


  // routes :


}
