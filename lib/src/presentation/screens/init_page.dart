import 'package:flutter/material.dart';
import 'package:frip_trading/core/routes/router_screens.dart';
import 'package:frip_trading/core/routes/routes_name.dart';
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
    _navigateToNextPage();
  }

  void _navigateToNextPage() async {
    await Future.delayed(const Duration(seconds: 4), () {
      if (!mounted) return;

      final targetContext = widget.context ?? context;
      AppRouter.router.navigateTo(targetContext, RoutesNames.registerRoute,
          clearStack: true);
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
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
    );
  }
}
