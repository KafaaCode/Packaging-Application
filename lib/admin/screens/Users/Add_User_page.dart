import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frip_trading/core/localization/generated/l10n.dart';
import 'package:frip_trading/core/services/services_locator.dart';
import 'package:frip_trading/core/utils/loading_dialog.dart';
import 'package:frip_trading/src/data/models/models.dart';
import 'package:frip_trading/src/features/inital/presentation/inital/inital_bloc.dart';
import 'package:frip_trading/src/presentation/controllers/auth/auth_bloc.dart';
import 'package:frip_trading/src/presentation/screens/auth/widgets/dropdown_custom.dart';
import 'package:frip_trading/src/presentation/screens/auth/widgets/text_field_auth.dart';
import 'package:frip_trading/src/presentation/widgets/button_costum.dart';

class AddUserPage extends StatefulWidget {
  const AddUserPage({super.key});

  @override
  State<AddUserPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<AddUserPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isDialogShowing = false;

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

  // ⭐️ دالة مساعدة لإغلاق مربع حوار التحميل
  void _dismissLoadingDialog() {
    if (_isDialogShowing &&
        Navigator.of(context, rootNavigator: true).canPop()) {
      Navigator.of(context, rootNavigator: true).pop();
      _isDialogShowing = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Lang lang = Lang.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              BlocListener<AuthBloc, AuthState>(
                listener: (context, state) {
                  print('AuthBloc State Listener: $state');
                  state.maybeWhen(
                    error: (message) {
                      _dismissLoadingDialog();
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
                    },
                    loadInProgress: () {
                      if (!_isDialogShowing) {
                        showLoadingDialog(context);
                        _isDialogShowing = true;
                      }
                    },
                    create: (user) {
                      // هذه الحالة قد تحدث عند تحديث بيانات المستخدم في الفورم
                      // أو عند تسجيل مستخدم جديد ليس عن طريق المسؤول (إذا كانت هذه الصفحة تستخدم لذلك).
                      // إذا كانت هذه الصفحة مخصصة فقط لإضافة مسؤول للمستخدمين،
                      // فإن StreamBuilder هو من سيتعامل مع النجاح والـ pop.
                      // إذا كانت هذه الحالة تشير إلى نجاح تسجيل مستخدم عادي،
                      // فيمكنك إضافة SnackBar هنا أيضًا إذا لم تكن تستخدم StreamBuilder لهذا الغرض.
                      // حاليًا، هذا الجزء يتعامل مع إغلاق مربع التحميل والـ pop للصفحة.
                      _dismissLoadingDialog();
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        if (ModalRoute.of(context)?.isCurrent == true) {
                          Navigator.of(context).pop();
                        }
                      });
                    },
                    orElse: () {}, // لا تفعل شيئًا هنا لتجنب التداخل
                  );
                },
                child: Text(
                  'Add User',
                  style: theme.textTheme.headlineLarge?.copyWith(
                    color: theme.primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Builder(builder: (innerContext) {
                return StreamBuilder<String>(
                  stream: context.read<AuthBloc>().userCreatedSuccessStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      WidgetsBinding.instance.addPostFrameCallback((_) async {
                        // ⭐️ جعلها async
                        _dismissLoadingDialog();
                        ScaffoldMessenger.of(innerContext).showSnackBar(
                          SnackBar(
                            content: Text(snapshot.data!),
                            backgroundColor: Colors.green,
                          ),
                        );
                        // ⭐️ إضافة تأخير للسماح للـ SnackBar بالظهور
                        await Future.delayed(const Duration(
                            milliseconds: 500)); // تأخير 0.5 ثانية
                        if (ModalRoute.of(innerContext)?.isCurrent == true) {
                          Navigator.of(innerContext).pop();
                        }
                      });
                    }
                    return const SizedBox.shrink();
                  },
                );
              }),
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
                        svgIcon: 'assets/SVG/lock.svg',
                        hintText: lang.passwordHint,
                        isPassword: true,
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
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      return ButtonCostum(
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            // context.read<AuthBloc>().add(
                            //       AuthEvent.register(
                            //         user: state.maybeWhen(
                            //             create: (user) => user.copyWith(
                            //                   name: nameController.text,
                            //                   email: emailController.text,
                            //                   password: passwordController.text,
                            //                   company: companyController.text,
                            //                 ),
                            //             orElse: () {
                            //               return User(
                            //                 id: 0,
                            //                 name: nameController.text,
                            //                 email: emailController.text,
                            //                 password: passwordController.text,
                            //                 company: companyController.text,
                            //                 specializationId:
                            //                     specializations.isNotEmpty
                            //                         ? specializations.first.id
                            //                         : 0,
                            //                 countryId: countries.isNotEmpty
                            //                     ? countries.first.id
                            //                     : 0,
                            //               );
                            //             }),
                            //       ),
                            //     );
                          }
                        },
                        text: 'Add User',
                        size: const Size(340, 52),
                      );
                    },
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
