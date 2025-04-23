import 'package:fluro/fluro.dart';
import 'package:frip_trading/admin/admin_page.dart';
import 'package:frip_trading/core/routes/routes_name.dart';
import 'package:frip_trading/src/presentation/screens/auth/login_page.dart';
import 'package:frip_trading/src/presentation/screens/auth/register_page.dart';
import 'package:frip_trading/src/presentation/screens/init_page.dart';
import 'package:frip_trading/src/presentation/screens/main/main_page.dart';
import 'package:frip_trading/src/presentation/screens/settings/change_password.dart';
import 'package:frip_trading/src/presentation/screens/settings/edit_profile.dart';

import '../../src/presentation/screens/main/products.dart';

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
/*   router.define(
    RoutesNames.products,
    handler: Handler(
      handlerFunc: (context, parameters) {
        return const Products();
      },
    ),
  ); */

  router.define(
    RoutesNames.products,
    handler: Handler(
      handlerFunc: (context, parameters) {
        final args = context!.settings!.arguments;
        if (args is int) {
          return Products(
            cartegriesId: args,
          );
        } else {
          return null;
        }
      },
    ),
  );

  // routes :
  router.define(
    RoutesNames.editProfileRoute,
    handler: Handler(
      handlerFunc: (context, parameters) {
        return EditProfile();
      },
    ),
  );
  router.define(
    RoutesNames.changePasswordRoute,
    handler: Handler(
      handlerFunc: (context, parameters) {
        return ChangePassword();
      },
    ),
  );

  // admin routes

  router.define(
    RoutesNames.adminMainRoute,
    handler: Handler(
      handlerFunc: (context, parameters) {
        return const AdminPage();
      },
    ),
  );
}
