import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frip_trading/core/localization/generated/l10n.dart';
import 'package:frip_trading/core/routes/router_screens.dart';
import 'package:frip_trading/core/routes/routes_name.dart';
import 'package:frip_trading/core/utils/loading_dialog.dart';
import 'package:frip_trading/src/data/models/models.dart';
import 'package:frip_trading/src/presentation/controllers/auth/auth_bloc.dart';
import 'package:frip_trading/src/presentation/screens/auth/widgets/text_field_auth.dart';
import 'package:frip_trading/src/presentation/widgets/button_costum.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Lang lang = Lang.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
            color: theme.canvasColor,
            child: BlocListener<AuthBloc, AuthState>(
              listener: (context, state) {
                state.maybeWhen(
                  error: (message) {
                    Navigator.of(context, rootNavigator: true).pop();
                    debugPrint('Error: $message');

                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Error'),
                        content: Text(message),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                  },
                  loadInProgress: () {
                    showLoadingDialog(context);
                  },
                  create: (user) {
                    if (user.role != null) {
                      Navigator.of(context, rootNavigator: true).pop();
                      debugPrint('Loaded with user: ${user.email}');
                      AppRouter.router.navigateTo(
                          context, RoutesNames.mainRoute,
                          clearStack: true,
                          transitionDuration: const Duration(milliseconds: 200),
                          transition: TransitionType.inFromBottom);
                    }
                  },
                  orElse: () {
                    debugPrint('Something else');
                  },
                );
              },
              child: Column(
                children: [
                  Center(
                    child: Text(lang.letsGetStarted,
                        style: theme.textTheme.displayMedium?.copyWith(
                            color: theme.primaryColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 28)),
                  ),
                  const SizedBox(height: 20),
                  Image.asset(
                    'assets/images/init_page.png',
                    width: 315,
                    height: 182,
                    filterQuality: FilterQuality.high,
                  ),
                  Column(
                    children: [
                      Text(
                        'Welcome',
                        style: theme.textTheme.headlineMedium,
                      ),
                      Text(
                        lang.plsEnterDataToContiubue,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextFieldAuth(
                          labelText: lang.enterYourEamilLabel,
                          svgIcon: 'assets/SVG/mail.svg',
                          controller: emailController,
                          hintText: lang.enterYourEamilHint,
                        ),
                        const SizedBox(height: 20),
                        TextFieldAuth(
                          svgIcon: 'assets/SVG/lock.svg',
                          isPassword: true,
                          labelText: lang.passwordLabel,
                          hintText: lang.passwordHint,
                          controller: passwordController,
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text(lang.forgotYourPassword,
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: theme.primaryColor,
                                ))),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  ButtonCostum(
                    onPressed: () {
                      context.read<AuthBloc>().add(
                            AuthEvent.login(
                              user: User(
                                id: 0,
                                name: 'User',
                                email: emailController.text,
                                password: passwordController.text,
                              ),
                            ),
                          );
                    },
                    text: lang.login,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(lang.alreadyHaveAnAccount,
                          style: const TextStyle(color: Colors.grey)),
                      TextButton(
                        onPressed: () {
                          AppRouter.router.navigateTo(
                              context, RoutesNames.registerRoute,
                              clearStack: true,
                              transition: TransitionType.inFromLeft,
                              transitionDuration:
                                  const Duration(milliseconds: 200));
                        },
                        child: Text(
                          lang.signin,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
