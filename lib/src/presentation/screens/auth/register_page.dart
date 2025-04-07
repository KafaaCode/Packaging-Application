import 'package:flutter/material.dart';
import 'package:frip_trading/src/presentation/screens/auth/widgets/text_field_auth.dart';
import 'package:frip_trading/src/presentation/widgets/button_costum.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

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
              Text(
                'Sign Up',
                style: theme.textTheme.headlineLarge?.copyWith(
                  color: theme.primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    TextFieldAuth(
                        svgIcon: 'assets/SVG/Vector.svg',
                        hintText: 'Company Name'),
                    SizedBox(height: 20),
                    TextFieldAuth(
                        svgIcon: 'assets/SVG/user.svg', hintText: 'Full name'),
                    SizedBox(height: 20),
                    TextFieldAuth(
                        svgIcon: 'assets/SVG/mail.svg',
                        hintText: 'Valid email'),
                    SizedBox(height: 20),
                    TextFieldAuth(
                        svgIcon: 'assets/SVG/Vector_down.svg',
                        hintText: 'Strong Password'),
                    SizedBox(height: 20),
                    TextFieldAuth(
                        svgIcon: 'assets/SVG/Vector_down.svg',
                        hintText: 'Company Name'),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Checkbox(value: false, onChanged: (v) {}),
                
                ],
              ),
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
                  const Text('Already a member?',
                      style: TextStyle(color: Colors.grey)),
                  TextButton(
                    onPressed: () {
                      // Handle sign up action
                    },
                    child: Text(
                      'Log In',
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
