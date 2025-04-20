import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frip_trading/core/routes/router_screens.dart';
import 'package:frip_trading/core/routes/routes_name.dart';
import 'package:frip_trading/core/utils/loading_dialog.dart';
import 'package:frip_trading/src/presentation/controllers/auth/auth_bloc.dart';
import 'package:lottie/lottie.dart';

class InitPage extends StatefulWidget {
  final BuildContext? context;
  const InitPage(this.context, {super.key});

  @override
  State<InitPage> createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  @override
  void initState() {
    super.initState();
  }

  void _navigateToNextPage(context, state) async {
    // await Future.delayed(const Duration(seconds: 4), () {
    //   if (!mounted) return;

    //   final targetContext = widget.context ?? context;
    //   AppRouter.router
    //       .navigateTo(targetContext, RoutesNames.loginRoute, clearStack: true);
    // });
    state.maybeWhen(
      initial: () {
        AppRouter.router.navigateTo(context, RoutesNames.loginRoute,
            clearStack: true,
            transitionDuration: const Duration(milliseconds: 500),
            transition: TransitionType.inFromBottom);
      },
      error: (message) {
        AppRouter.router.navigateTo(context, RoutesNames.loginRoute,
            clearStack: true,
            transitionDuration: const Duration(milliseconds: 500),
            transition: TransitionType.inFromBottom);
      },
      loaded: (user) {
        Navigator.of(context, rootNavigator: true).pop();
        if (user.role == "User") {
          debugPrint('Loaded with user: ${user.email}');
          AppRouter.router.navigateTo(context, RoutesNames.adminMainRoute,
              clearStack: true,
              transitionDuration: const Duration(milliseconds: 500),
              transition: TransitionType.inFromBottom);
        } else if (user.role == "Admin") {
          AppRouter.router.navigateTo(context, RoutesNames.adminMainRoute,
              clearStack: true,
              transitionDuration: const Duration(milliseconds: 500),
              transition: TransitionType.inFromLeft);
        } else {
          // Toast().error(context, 'Something went wrong!');
          AppRouter.router.navigateTo(context, RoutesNames.adminMainRoute,
              clearStack: true,
              transitionDuration: const Duration(milliseconds: 500),
              transition: TransitionType.inFromBottom);
        }
      },
      orElse: () {
        debugPrint('Something else');
        AppRouter.router.navigateTo(context, RoutesNames.loginRoute,
            clearStack: true,
            transitionDuration: const Duration(milliseconds: 500),
            transition: TransitionType.inFromBottom);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return BlocListener<AuthBloc, AuthState>(
      listener: _navigateToNextPage,
      child: Container(
        color: theme.primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/init_page.png',
                  width: 315,
                  height: 182,
                  filterQuality: FilterQuality.high,
                ),
                Image.asset(
                  'assets/images/FRIP_TRADING.png',
                  width: 176,
                  height: 48,
                  filterQuality: FilterQuality.high,
                ),
              ],
            ),
            Center(
              child: Lottie.asset(
                'assets/lottie/loading.json',
                width: 200,
                height: 200,
                // fit: BoxFit.cover,
                filterQuality: FilterQuality.high,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
