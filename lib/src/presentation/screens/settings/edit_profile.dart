import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frip_trading/core/localization/generated/l10n.dart';
import 'package:frip_trading/core/routes/router_screens.dart';
import 'package:frip_trading/core/routes/routes_name.dart';
import 'package:frip_trading/core/services/services_locator.dart';
import 'package:frip_trading/core/utils/loading_dialog.dart';
import 'package:frip_trading/src/data/models/models.dart';
import 'package:frip_trading/src/features/inital/presentation/inital/inital_bloc.dart';
import 'package:frip_trading/src/presentation/controllers/auth/auth_bloc.dart';
import 'package:frip_trading/src/presentation/screens/auth/widgets/dropdown_custom.dart';
import 'package:frip_trading/src/presentation/screens/settings/widgets/customAppbar.dart';
import 'package:frip_trading/src/presentation/screens/settings/widgets/custom_text_feild.dart';

class EditProfile extends StatelessWidget {
  EditProfile({super.key});
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Lang lang = Lang.of(context);
    MediaQueryData mediaQuery = MediaQuery.of(context);
    double screenHeight = mediaQuery.size.height;
    double screenWidth = mediaQuery.size.width;

    return Scaffold(
      body: CustomAppbar(
        tilte: lang.settings,
        icon: SvgPicture.asset(
          'assets/SVG/alarm.svg',
        ),
        onPressed: () {
          print('pressed');
          AppRouter.router.pop(context);
        },
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(20, 130, 20, 0),
                height: screenHeight,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 100),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: const [
                      BoxShadow(color: Colors.black12, blurRadius: 5)
                    ],
                  ),
                ),
              ),
              Positioned(
                left: screenWidth / 2 - 50,
                top: screenHeight / 4 - 143,
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.teal,
                      child: Icon(Icons.person, size: 60, color: Colors.white),
                    ),
                    Positioned(
                      child: CircleAvatar(
                        radius: 16,
                        backgroundColor: Colors.white,
                        child: SvgPicture.asset('assets/SVG/ar-camera.svg'),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: screenHeight / 4 - 35,
                left: 20,
                right: 20,
                child: BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    if (nameController.text == '' &&
                        emailController.text == '' &&
                        companyController.text == '') {
                      User? user = state.mapOrNull(
                        create: (user) {
                          nameController.text = user.user.name;
                          emailController.text = user.user.email;
                          companyController.text = user.user.companyName ?? '';
                          return user.user;
                        },
                      );
                      print('user: $user');
                    }
                    return Form(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              lang.companyNameHint,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black54,
                              ),
                            ),
                            const SizedBox(height: 10),
                            CustomTextFeild(
                              controller: companyController,
                              labelText: lang.companyNameHint,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              lang.fullNameHint,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black54,
                              ),
                            ),
                            const SizedBox(height: 10),
                            CustomTextFeild(
                              controller: nameController,
                              labelText: lang.fullNameHint,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              lang.enterYourEamilLabel,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black54,
                              ),
                            ),
                            const SizedBox(height: 10),
                            CustomTextFeild(
                              controller: emailController,
                              labelText: lang.enterYourEamilLabel,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              lang.selectSpecializationLabel,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black54,
                              ),
                            ),
                            const SizedBox(height: 10),
                            DropdownCustom<Specialization>(
                              svgIcon: 'assets/SVG/Vector_down.svg',
                              labelText: lang.selectSpecializationLabel,
                              decoration: _decoration(),
                              items: specializations,
                              defaultValue: state.mapOrNull(
                                create: (user) {
                                  final filteredSpecializations =
                                      specializations.where((s) =>
                                          s.id == user.user.specializationId);

                                  return filteredSpecializations.isNotEmpty
                                      ? filteredSpecializations.first
                                      : specializations.first;
                                },
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
                                              specializationId: value?.id ?? 0),
                                        ),
                                      ),
                                    );
                              },
                            ),
                            const SizedBox(height: 10),
                            Text(
                              lang.selectCountryLabel,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black54,
                              ),
                            ),
                            const SizedBox(height: 10),
                            DropdownCustom<Country>(
                              svgIcon: 'assets/SVG/Vector_down.svg',
                              labelText: lang.selectCountryLabel,
                              decoration: _decoration(),
                              defaultValue: state.mapOrNull(
                                create: (user) {
                                  final filteredCountries = countries.where(
                                      (c) => c.id == user.user.countryId);
                                  return filteredCountries.isNotEmpty
                                      ? filteredCountries.first
                                      : countries.isNotEmpty
                                          ? countries.first
                                          : null;
                                },
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
                        ),
                      ),
                    );
                  },
                ),
              ),
              Positioned(
                bottom: screenHeight / 4 - 80,
                left: screenWidth / 2 - 90,
                child: Image.asset(
                  'assets/images/init_page.png',
                  width: 189,
                  height: 109,
                  filterQuality: FilterQuality.high,
                ),
              ),
              Positioned(
                bottom: screenHeight / 10 - 15,
                left: screenWidth / 2 - 150,
                child: BlocConsumer<AuthBloc, AuthState>(
                  listener: (context, state) {
                    state.whenOrNull(
                      loadInProgress: () {
                        showLoadingDialog(context);
                      },
                      create: (user) {
                        AppRouter.router.pop(context);
                        AppRouter.router.navigateTo(
                            context, RoutesNames.mainRoute,
                            clearStack: true);
                      },
                      error: (error) {
                        AppRouter.router.pop(context);
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(lang.error),
                              content: Text(error),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    AppRouter.router.pop(context);
                                  },
                                  child: Text(lang.ok),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    );
                  },
                  builder: (context, state) {
                    return InkWell(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<AuthBloc>().add(
                                AuthEvent.updateProfile(
                                  user: sl<AuthBloc>().state.maybeWhen(
                                        create: (user) => user.copyWith(
                                          name: nameController.text,
                                          email: emailController.text,
                                          companyName: companyController.text,
                                        ),
                                        orElse: () => User(
                                          id: 0,
                                          name: nameController.text,
                                          email: emailController.text,
                                          companyName: companyController.text,
                                        ),
                                      ),
                                ),
                              );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Please fill all fields'),
                            ),
                          );
                          return;
                        }
                      },
                      child: Container(
                        width: 300,
                        height: 50,
                        decoration: BoxDecoration(
                          color: theme.primaryColor,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: const [
                            BoxShadow(color: Colors.black12, blurRadius: 5)
                          ],
                        ),
                        child: const Center(
                          child: Text(
                            'Edit',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration _decoration() {
    return const InputDecoration(
      // labelText: labelText,
      labelStyle: TextStyle(
        color: Color.fromRGBO(176, 179, 199, 1),
        fontSize: 14,
      ),
      border: OutlineInputBorder(
        borderSide:
            BorderSide(color: Color.fromRGBO(214, 214, 218, 1), width: 0.5),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 1),
    );
  }
}
