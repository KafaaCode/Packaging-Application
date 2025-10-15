// أضف هذه الحزمة في ملف pubspec.yaml
// dependencies:
//   collection: ^1.17.2

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
// ⚠️ يجب إضافة استيراد الـ extension من حزمة collection
import 'package:collection/collection.dart';

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
import 'package:frip_trading/src/presentation/widgets/custom_text_feild.dart';

class EditProfile extends StatefulWidget {
  EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController companyController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // 🎯 سيتم تعيين القيمة الافتراضية هنا في initState
  Specialization? selectedSpec;
  Country? selectedCountry;

  // ⚠️ جلب البيانات خارج initState يعتمد على تحميلها مسبقاً في sl
  List<Specialization> specializations = sl<InitalBloc>().state.maybeWhen(
        loaded: (v) =>
            v.specialization?.whereType<Specialization>().toList() ?? [],
        orElse: () => [],
      );

  List<Country> countries = sl<InitalBloc>().state.maybeWhen(
        loaded: (v) => v.country?.whereType<Country>().toList() ?? [],
        orElse: () => [],
      );

  @override
  void initState() {
    // ⚠️ لا يجب استدعاء هذا هنا، الـ BlocConsumer هو من سيحدد متى يتم التحميل أو متى يتم الوصول للبيانات.
    // BlocProvider.of<InitalBloc>(context).add(const InitalEvent.getInitalData());

    // 🎯 تعيين القيمة الافتراضية بناءً على الـ ID المحفوظ في AuthBloc
    final AuthState authState = context.read<AuthBloc>().state;
    final User? initialUser =
        authState.mapOrNull(create: (value) => value.user);

    if (initialUser != null) {
      nameController.text = initialUser.name;
      emailController.text = initialUser.email;
      companyController.text = initialUser.companyName ?? '';

      // ✅ البحث عن الكائن المطابق للـ ID الفعلي في القوائم المتاحة
      selectedSpec = specializations.firstWhereOrNull(
        (s) => s.id == initialUser.specializationId,
      );
      selectedCountry = countries.firstWhereOrNull(
        (c) => c.id == initialUser.countryId,
      );
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Lang lang = Lang.of(context);
    MediaQueryData mediaQuery = MediaQuery.of(context);
    double screenHeight = mediaQuery.size.height;
    double screenWidth = mediaQuery.size.width;

    // ❌ تم حذف حساب specIndex و countryIndex

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
                    // ⚠️ تم نقل تعيين Controllers إلى initState
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
                            BlocConsumer<InitalBloc, InitalState>(
                              listener: (context, state) {
                                state.whenOrNull(
                                  loaded: (v) {
                                    setState(() {
                                      specializations = v.specialization!
                                          .whereType<Specialization>()
                                          .toList();
                                      // ⚠️ إذا تم تحميل البيانات بعد initState، أعد تعيين selectedSpec/Country
                                      final initialUser = context
                                          .read<AuthBloc>()
                                          .state
                                          .mapOrNull(
                                              create: (value) => value.user);
                                      if (initialUser != null) {
                                        selectedSpec =
                                            specializations.firstWhereOrNull(
                                          (s) =>
                                              s.id ==
                                              initialUser.specializationId,
                                        );
                                      }
                                    });
                                  },
                                );
                              },
                              builder: (context, state) {
                                return state.maybeWhen(
                                  orElse: () => const SizedBox.shrink(),
                                  loadInProgress: () => const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                  loaded: (specializationAndCountry) {
                                    return DropdownCustom<Specialization>(
                                      svgIcon: 'assets/SVG/Vector_down.svg',
                                      labelText: lang.selectSpecializationLabel,
                                      items: specializations,
                                      // ✅ استخدام الكائن المُختار مباشرةً كقيمة افتراضية
                                      defaultValue: selectedSpec,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedSpec = value;
                                        });
                                      },
                                    );
                                  },
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
                            BlocConsumer<InitalBloc, InitalState>(
                              listener: (context, state) {
                                state.whenOrNull(
                                  loaded: (v) {
                                    setState(() {
                                      countries = v.country!
                                          .whereType<Country>()
                                          .toList();
                                      // ⚠️ إذا تم تحميل البيانات بعد initState، أعد تعيين selectedSpec/Country
                                      final initialUser = context
                                          .read<AuthBloc>()
                                          .state
                                          .mapOrNull(
                                              create: (value) => value.user);
                                      if (initialUser != null) {
                                        selectedCountry =
                                            countries.firstWhereOrNull(
                                          (c) => c.id == initialUser.countryId,
                                        );
                                      }
                                    });
                                  },
                                );
                              },
                              builder: (context, state) {
                                return state.maybeWhen(
                                  orElse: () => const SizedBox.shrink(),
                                  loadInProgress: () => const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                  loaded: (specializationAndCountry) {
                                    return DropdownCustom<Country>(
                                      svgIcon: 'assets/SVG/Vector_down.svg',
                                      labelText: lang.selectCountryLabel,
                                      items: countries,
                                      // ✅ استخدام الكائن المُختار مباشرةً كقيمة افتراضية
                                      defaultValue: selectedCountry,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedCountry = value;
                                        });
                                      },
                                    );
                                  },
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
                bottom: screenHeight / 6 - 80,
                left: screenWidth / 2 - 90,
                child: Image.asset(
                  'assets/images/init_page.png',
                  width: 189,
                  height: 109,
                  filterQuality: FilterQuality.high,
                ),
              ),
              Positioned(
                bottom: screenHeight / 16 - 15,
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
                          // ⚠️ يجب استخدام الـ ID الفعلي من الكائن selectedCountry/selectedSpec
                          // إذا لم يتم اختيار قيمة جديدة، يتم استخدام الـ ID القديم المحفوظ في الـ AuthBloc
                          final int? initialCountryId = context
                              .read<AuthBloc>()
                              .state
                              .mapOrNull(
                                  create: (value) => value.user.countryId);
                          final int? initialSpecId = context
                              .read<AuthBloc>()
                              .state
                              .mapOrNull(
                                  create: (value) =>
                                      value.user.specializationId);

                          final int? finalCountryId =
                              selectedCountry?.id ?? initialCountryId;
                          final int? finalSpecId =
                              selectedSpec?.id ?? initialSpecId;

                          print('Final Country ID Sent: $finalCountryId');
                          print('Final Spec ID Sent: $finalSpecId');

                          BlocProvider.of<AuthBloc>(context).add(
                            AuthEvent.updateProfile(
                              companyName: companyController.text,
                              // ✅ إرسال الـ ID الفعلي مباشرة
                              countryId: finalCountryId,
                              email: emailController.text,
                              name: nameController.text,
                              // ✅ إرسال الـ ID الفعلي مباشرة
                              specializationId: finalSpecId,
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
