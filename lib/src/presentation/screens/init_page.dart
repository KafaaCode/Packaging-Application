import 'package:flutter/material.dart';
import 'package:frip_trading/core/routes/router_screens.dart';
import 'package:frip_trading/core/routes/routes_name.dart';

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

  void _navigateToNextPage() {
    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;

      final targetContext = widget.context ?? context;
      AppRouter.router.navigateTo(targetContext, RoutesNames.mainRoute);
        });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
