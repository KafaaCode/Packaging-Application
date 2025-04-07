import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frip_trading/src/presentation/screens/auth/widgets/text_field_auth.dart';
import 'package:frip_trading/src/presentation/widgets/button_costum.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
          color: theme.canvasColor,
          child: Column(
            children: [
              Center(
                child: Text('Let’s Get Started',
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
                    'Please enter your data to continue',
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
                    const TextFieldAuth(
                      labelText: 'Enter your email',
                      svgIcon: 'assets/SVG/mail.svg',
                      hintText: 'Enter your email',
                    ),
                    const SizedBox(height: 20),
                    const TextFieldAuth(
                      svgIcon: 'assets/SVG/lock.svg',
                      isPassword: true,
                      labelText: 'Password',
                      hintText: 'Password',
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text('Forget Password?',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.primaryColor,
                            ))),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              ButtonCostum(
                onPressed: () {
                  // Handle login action
                },
                text: 'Login',
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account?',
                      style: TextStyle(color: Colors.grey)),
                  TextButton(
                    onPressed: () {
                      // Handle sign up action
                    },
                    child: Text(
                      'Signin',
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
    );
  }
}
