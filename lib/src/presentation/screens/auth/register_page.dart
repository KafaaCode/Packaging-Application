import 'package:fluro/fluro.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frip_trading/core/localization/generated/l10n.dart';
import 'package:frip_trading/core/routes/router_screens.dart';
import 'package:frip_trading/core/routes/routes_name.dart';
import 'package:frip_trading/core/services/services_locator.dart';
import 'package:frip_trading/core/utils/loading_dialog.dart';
import 'package:frip_trading/src/data/models/models.dart';
import 'package:frip_trading/src/features/inital/presentation/inital/inital_bloc.dart';
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
  bool _ObscurePassword = true;

  List<Specialization> specializations = sl<InitalBloc>().state.maybeWhen(
        loaded: (v) =>
            v.specialization?.whereType<Specialization>().toList() ?? [],
        orElse: () {
          return [];
        },
      );
  List<Country> countries = sl<InitalBloc>().state.maybeWhen(
        loaded: (v) => v.country?.whereType<Country>().toList() ?? [],
        orElse: () {
          return [];
        },
      );

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
    Lang lang = Lang.of(context);
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
                  print('state: $state');
                  state.maybeWhen(
                    error: (message) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text(lang.error),
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
                      Navigator.of(context, rootNavigator: true).pop();
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
                            transitionDuration:
                                const Duration(milliseconds: 200),
                            transition: TransitionType.inFromBottom);
                      }
                    },
                    orElse: () {
                      debugPrint('Something else');
                    },
                  );
                },
                child: Text(
                  lang.signUp,
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
                      TextFieldAuth(
                          svgIcon: 'assets/SVG/Vector.svg',
                          controller: companyController,
                          hintText: lang.companyNameHint),
                      const SizedBox(height: 20),
                      TextFieldAuth(
                        svgIcon: 'assets/SVG/user.svg',
                        hintText: lang.fullNameHint,
                        controller: nameController,
                        colorIcon: const Color.fromRGBO(0, 0, 0, 1),
                      ),
                      const SizedBox(height: 20),
                      TextFieldAuth(
                        svgIcon: 'assets/SVG/mail.svg',
                        hintText: lang.eamilHint,
                        controller: emailController,
                        colorIcon: const Color.fromRGBO(0, 0, 0, .7),
                      ),
                      const SizedBox(height: 20),
                      TextFieldAuth(
                        onTap: () {
                          setState(() {
                            _ObscurePassword = !_ObscurePassword;
                          });
                        },
                        svgIcon: 'assets/SVG/lock.svg',
                        hintText: lang.passwordHint,
                        isPassword: _ObscurePassword,
                        controller: passwordController,
                        colorIcon: const Color.fromRGBO(0, 0, 0, .7),
                      ),
                      const SizedBox(height: 20),
                      BlocBuilder<AuthBloc, AuthState>(
                        builder: (context, state) {
                          return Column(
                            children: [
                              DropdownCustom<Specialization>(
                                svgIcon: 'assets/SVG/Vector_down.svg',
                                labelText: lang.selectSpecializationLabel,
                                items: specializations,
                                defaultValue: state.maybeWhen(
                                  create: (user) {
                                    final filteredSpecializations =
                                        specializations.where((s) =>
                                            s.id == user.specializationId);

                                    return filteredSpecializations.isNotEmpty
                                        ? filteredSpecializations.first
                                        : specializations.first;
                                  },
                                  orElse: () => specializations.isNotEmpty
                                      ? specializations.first
                                      : null,
                                ),
                                onChanged: (value) {
                                  context.read<AuthBloc>().add(
                                        AuthEvent.createEvent(
                                          user: state.maybeWhen(
                                            create: (user) => user.copyWith(
                                              specializationId: value?.id ?? 0,
                                            ),
                                            orElse: () => User(
                                                id: 0,
                                                name: '',
                                                email: '',
                                                specializationId:
                                                    value?.id ?? 0),
                                          ),
                                        ),
                                      );
                                },
                              ),
                              const SizedBox(height: 20),
                              DropdownCustom<Country>(
                                svgIcon: 'assets/SVG/Vector_down.svg',
                                labelText: lang.selectCountryLabel,
                                defaultValue: state.maybeWhen(
                                  create: (user) {
                                    final filteredCountries = countries
                                        .where((c) => c.id == user.countryId);
                                    return filteredCountries.isNotEmpty
                                        ? filteredCountries.first
                                        : countries.isNotEmpty
                                            ? countries.first
                                            : null;
                                  },
                                  orElse: () => countries.isNotEmpty
                                      ? countries.first
                                      : null,
                                ),
                                items: countries,
                                onChanged: (value) {
                                  context.read<AuthBloc>().add(
                                        AuthEvent.createEvent(
                                          user: state.maybeWhen(
                                            create: (user) => user.copyWith(
                                              countryId: value?.id ?? 0,
                                            ),
                                            orElse: () => User(
                                                id: 0,
                                                name: '',
                                                email: '',
                                                countryId: value?.id ?? 0),
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
                              text: lang.byCheckingTheBoxYouAgreeToOur,
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
                                TextSpan(
                                  text: lang.and,
                                ),
                                TextSpan(
                                  text: lang.conditions,
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
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      return ButtonCostum(
                        onPressed: () {
                          context.read<AuthBloc>().add(
                                AuthEvent.register(
                                  user: state.maybeWhen(
                                      create: (user) => user.copyWith(
                                            name: nameController.text,
                                            email: emailController.text,
                                            password: passwordController.text,
                                            company: companyController.text,
                                          ),
                                      orElse: () {
                                        print(3333);
                                        return const User(
                                          id: 0,
                                          name: '',
                                          email: '',
                                        );
                                      }),
                                ),
                              );
                          // print(nameController.text);
                          // print(

                          // );
                        },
                        text: lang.register,
                        size: const Size(340, 52),
                      );
                    },
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(lang.alreadyAMember),
                      TextButton(
                        onPressed: () {
                          AppRouter.router.navigateTo(
                              context, RoutesNames.loginRoute,
                              transition: TransitionType.inFromRight,
                              transitionDuration:
                                  const Duration(milliseconds: 200));
                        },
                        child: Text(
                          lang.login,
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
