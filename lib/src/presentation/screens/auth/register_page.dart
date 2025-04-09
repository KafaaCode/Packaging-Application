import 'package:fluro/fluro.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frip_trading/core/routes/router_screens.dart';
import 'package:frip_trading/core/routes/routes_name.dart';
import 'package:frip_trading/core/utils/loading_dialog.dart';
import 'package:frip_trading/src/data/models/models.dart';
import 'package:frip_trading/src/presentation/controllers/auth/auth_bloc.dart';
import 'package:frip_trading/src/presentation/screens/auth/widgets/dropdown_custom.dart';
import 'package:frip_trading/src/presentation/screens/auth/widgets/text_field_auth.dart';
import 'package:frip_trading/src/presentation/widgets/button_costum.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    companyController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
          color: theme.canvasColor,
          child: Column(
            children: [
              BlocListener<AuthBloc, AuthState>(
                listener: (context, state) {
                  print(state);
                  state.maybeWhen(
                    loadInProgress: () {
                      showLoadingDialog(context);
                    },
                    loaded: (user) {
                      Navigator.of(context, rootNavigator: true).pop();
                      debugPrint('Loaded with user: ${user.email}');
                      AppRouter.router.navigateTo(
                          context, RoutesNames.mainRoute,
                          clearStack: true,
                          transitionDuration: const Duration(milliseconds: 500),
                          transition: TransitionType.inFromBottom);
                    },
                    orElse: () {
                      debugPrint('Something else');
                    },
                  );
                },
                child: Text(
                  'Sign Up',
                  style: theme.textTheme.headlineLarge?.copyWith(
                    color: theme.primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 30),
                  child: Column(
                    children: [
                      const TextFieldAuth(
                          svgIcon: 'assets/SVG/Vector.svg',
                          hintText: 'Company Name'),
                      const SizedBox(height: 20),
                      const TextFieldAuth(
                        svgIcon: 'assets/SVG/user.svg',
                        hintText: 'Full name',
                        colorIcon: Color.fromRGBO(0, 0, 0, 1),
                      ),
                      const SizedBox(height: 20),
                      const TextFieldAuth(
                        svgIcon: 'assets/SVG/mail.svg',
                        hintText: 'Valid email',
                        colorIcon: Color.fromRGBO(0, 0, 0, .7),
                      ),
                      const SizedBox(height: 20),
                      const TextFieldAuth(
                        svgIcon: 'assets/SVG/lock.svg',
                        hintText: 'Strong Password',
                        colorIcon: Color.fromRGBO(0, 0, 0, .7),
                      ),
                      const SizedBox(height: 20),
                      BlocBuilder<AuthBloc, AuthState>(
                        builder: (context, state) {
                          return Column(
                            children: [
                              DropdownCustom(
                                svgIcon: 'assets/SVG/Vector_down.svg',
                                labelText: 'Select Specialization',
                                items: const [
                                  'Company',
                                  'Individual',
                                ],
                                defaultValue: state.maybeWhen(
                                  create: (user) => user.specialization,
                                  orElse: () => null,
                                ),
                                onChanged: (value) {
                                  context.read<AuthBloc>().add(
                                        AuthEvent.createEvent(
                                          user: state.maybeWhen(
                                            create: (user) => user.copyWith(
                                              specialization: value,
                                            ),
                                            orElse: () => const User(
                                              id: 0,
                                              name: '',
                                              email: '',
                                              role: '',
                                            ),
                                          ),
                                        ),
                                      );
                                },
                              ),
                              const SizedBox(height: 20),
                              DropdownCustom(
                                svgIcon: 'assets/SVG/Vector_down.svg',
                                labelText: 'Select Country',
                                defaultValue: state.maybeWhen(
                                  create: (user) => user.country,
                                  orElse: () => null,
                                ),
                                items: const [
                                  'Company Name 1',
                                  'Company Name 2',
                                  'Company Name 3',
                                ],
                                onChanged: (value) {
                                  context.read<AuthBloc>().add(
                                        AuthEvent.createEvent(
                                          user: state.maybeWhen(
                                            create: (user) => user.copyWith(
                                              country: value,
                                            ),
                                            orElse: () => const User(
                                              id: 0,
                                              name: '',
                                              email: '',
                                              role: '',
                                            ),
                                          ),
                                        ),
                                      );
                                },
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
                    child: Row(
                      children: [
                        BlocBuilder<AuthBloc, AuthState>(
                          builder: (context, state) {
                            return Checkbox(
                              focusColor: theme.primaryColor,
                              activeColor: theme.primaryColor,
                              side: BorderSide(
                                color: Colors.grey[400]!,
                                width: 2,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                                side: BorderSide(
                                    color: theme.primaryColor,
                                    style: BorderStyle.solid),
                              ),
                              value: state.maybeWhen(
                                orElse: () => false,
                                create: (user) => user.checkIsTerms,
                              ),
                              onChanged: (v) {
                                context.read<AuthBloc>().add(
                                      AuthEvent.createEvent(
                                        user: state.maybeWhen(
                                          create: (user) => user.copyWith(
                                            checkIsTerms: v,
                                          ),
                                          orElse: () => const User(
                                            id: 0,
                                            name: '',
                                            email: '',
                                            role: '',
                                          ),
                                        ),
                                      ),
                                    );
                              },
                            );
                          },
                        ),
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              text: 'By checking the box you agree to our ',
                              style: theme.textTheme.bodyMedium?.copyWith(
                                fontSize: 9,
                                fontWeight: FontWeight.w400,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Terms',
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    fontSize: 9,
                                    color: Colors.red,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      print('Terms clicked');
                                    },
                                ),
                                const TextSpan(
                                  text: ' and ',
                                ),
                                TextSpan(
                                  text: 'Conditions',
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                      fontSize: 9,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.red),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      print('Conditions clicked');
                                    },
                                ),
                                const TextSpan(
                                  text: '.',
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ButtonCostum(
                    onPressed: () {
                      context.read<AuthBloc>().add(
                            AuthEvent.register(
                                user: context.read<AuthBloc>().state.maybeWhen(
                                      create: (user) => user.copyWith(
                                        name: nameController.text,
                                        email: emailController.text,
                                        password: passwordController.text,
                                        company: companyController.text,
                                      ),
                                      orElse: () => const User(
                                        id: 0,
                                        name: '',
                                        email: '',
                                        role: '',
                                      ),
                                    )),
                          );
                    },
                    text: 'Register',
                    size: const Size(340, 52),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already a member?',
                      ),
                      TextButton(
                        onPressed: () {
                          AppRouter.router.navigateTo(
                              context, RoutesNames.loginRoute,
                              transition: TransitionType.inFromRight,
                              transitionDuration:
                                  const Duration(milliseconds: 800));
                        },
                        child: Text(
                          'Log In',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
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
