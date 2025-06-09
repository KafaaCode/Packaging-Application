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
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
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
                state.whenOrNull(
                  loadInProgress: () {
                    showLoadingDialog(context);
                  },
                  error: (message) {
                    Navigator.of(context, rootNavigator: true).pop(); // close loading
                    debugPrint('Login Error: $message');

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(message),
                        backgroundColor: Colors.red,
                      ),
                    );
                  },
                );
              },
              child: Column(
                children: [
                  Center(
                    child: Text(
                      'Let’s Get Started',
                      style: theme.textTheme.displayMedium?.copyWith(
                        color: theme.primaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 28,
                      ),
                    ),
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
                        Lang().plsEnterDataToContiubue,
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
                      children: [
                        TextFieldAuth(
                          labelText: Lang().enterYourEamilLabel,
                          svgIcon: 'assets/SVG/mail.svg',
                          controller: emailController,
                          hintText: Lang().enterYourEamilHint,
                        ),
                        const SizedBox(height: 20),
                        TextFieldAuth(
                          labelText: 'Password',
                          hintText: 'Password',
                          svgIcon: 'assets/SVG/lock.svg',
                          controller: passwordController,
                          isPassword: true,
                        ),
                        TextButton(
                          onPressed: () {
                            // TODO: Add forget password navigation
                          },
                          child: Text(
                            'Forget Password?',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.primaryColor,
                            ),
                          ),
                        ),
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
                            email: emailController.text.trim(),
                            password: passwordController.text,
                          ),
                        ),
                      );
                    },
                    text: Lang().login,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(Lang().alreadyHaveAnAccount,
                          style: const TextStyle(color: Colors.grey)),
                      TextButton(
                        onPressed: () {
                          AppRouter.router.navigateTo(
                            context,
                            RoutesNames.registerRoute,
                            transition: TransitionType.inFromLeft,
                            transitionDuration: const Duration(milliseconds: 800),
                          );
                        },
                        child: Text(
                          Lang().signin,
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
