import 'package:flutter/material.dart';

import 'package:fluro/fluro.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:frip_trading/core/localization/generated/l10n.dart';
import 'package:frip_trading/core/localization/language/language_cubit.dart';
import 'package:frip_trading/core/localization/language/language_state.dart';
import 'package:frip_trading/core/network/api_constances.dart';
import 'package:frip_trading/core/routes/router_screens.dart';
import 'package:frip_trading/core/routes/routes_name.dart';
import 'package:frip_trading/src/data/data_source/auth_remote_data_source.dart';
import 'package:frip_trading/src/data/models/models.dart';
import 'package:frip_trading/src/presentation/controllers/auth/auth_bloc.dart';
import 'package:frip_trading/src/presentation/screens/auth/widgets/dropdown_custom.dart';
import 'package:frip_trading/src/presentation/screens/settings/widgets/customAppbar.dart';
import 'package:frip_trading/src/presentation/screens/settings/widgets/settings_dialogs.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthRemoteDataSource authRemoteDataSource = AuthRemoteDataSource();
    Lang lang = Lang.of(context);
    String? token = ApiConstances.tokenOrGuest();
    return SafeArea(
      child: CustomAppbar(
        icon: const Icon(
          Icons.settings,
          size: 35,
          color: Colors.white,
        ),
        tilte: lang.settings,
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 100, 20, 0),
          child: Container(
            height: MediaQuery.of(context).size.height - 210,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(color: Colors.black12, blurRadius: 5)
              ],
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      User? user = state.mapOrNull(
                        create: (state) => state.user,
                      );
                      return Row(
                        children: [
                          const CircleAvatar(
                            radius: 24,
                            backgroundImage:
                                AssetImage('assets/images/image6.png'),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            user?.name ?? "User",
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      );
                    },
                  ),
                  const Divider(height: 15),
                  Divider(height: .5, color: Colors.grey[350]),
                  const Divider(height: 15),
                  Text(lang.accountSettings,
                      style: const TextStyle(color: Colors.grey)),
                  InkWell(
                    onTap: () {
                      final token = ApiConstances.tokenOrGuest();
                      if (token == 'guest') {
                        // Toast()
                        //     .warning(context, 'Please login to edit profile');
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Please login to edit profile')),
                        );
                      } else {
                        AppRouter.router.navigateTo(
                          context,
                          RoutesNames.editProfileRoute,
                          rootNavigator: true,
                          transition: TransitionType.inFromLeft,
                          transitionDuration: const Duration(milliseconds: 900),
                        );
                      }
                    },
                    child: ListTile(
                      title: Text(lang.editProfile),
                      trailing: const Icon(Icons.chevron_right),
                    ),
                  ),
                  if (token != 'guest')
                    InkWell(
                      onTap: () {
                        AppRouter.router.navigateTo(
                          context,
                          RoutesNames.changePasswordRoute,
                          rootNavigator: true,
                          transition: TransitionType.inFromLeft,
                          transitionDuration: const Duration(milliseconds: 900),
                        );
                      },
                      child: ListTile(
                        title: Text(lang.changePassword),
                        trailing: const Icon(Icons.chevron_right),
                      ),
                    ),
                  ListTile(
                    title: Text(lang.selectLanguage),
                    trailing: SizedBox(
                      width: 150, // أو أي عرض يناسب التصميم
                      child: BlocBuilder<LanguageCubit, LanguageState>(
                        builder: (context, state) {
                          List<SupportedLanguage> langs =
                              LanguageCubit.supportedLanguages;
                          return DropdownCustom<SupportedLanguage>(
                            items: langs,
                            onChanged: (v) {
                              if (v != null) {
                                context
                                    .read<LanguageCubit>()
                                    .changeLanguageTo(v.langCode);
                              }
                            },
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 2),
                              hintText: lang.selectLanguageHint,
                              labelStyle:
                                  Theme.of(context).textTheme.bodyMedium,
                              hintStyle: Theme.of(context).textTheme.bodyMedium,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor),
                              ),
                            ),
                            defaultValue: langs.firstWhere(
                              (element) =>
                                  element.langCode == state.locale.languageCode,
                            ),
                            svgIcon: 'assets/SVG/Vector_down.svg',
                            icon: const Icon(Icons.keyboard_arrow_down_rounded),
                          );
                        },
                      ),
                    ),
                  ),
                  const Divider(height: 32),
                  Text(lang.more, style: const TextStyle(color: Colors.grey)),
                  ListTile(
                    title: Text(lang.aboutUs),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      SettingsDialogs.aboutUs(context);
                    },
                  ),
                  ListTile(
                    title: Text(lang.privacyPolicy),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      SettingsDialogs.privacyPolicy(context);
                    },
                  ),
                  Divider(height: .5, color: Colors.grey[350]),
                  const Divider(height: 10),
                  ListTile(
                    title: Text(lang.termsAndConditions),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      SettingsDialogs.termsAndConditions(context);
                    },
                  ),
                  if (token != 'guest')
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF70B9BE),
                          minimumSize: const Size.fromHeight(50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () async {
                          final confirm = await showDialog<bool>(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text(lang.confirm),
                              content: Text(lang.areUSureDeleteAccount),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.of(context).pop(false),
                                  child: Text(lang.cancel),
                                ),
                                TextButton(
                                  onPressed: () =>
                                      Navigator.of(context).pop(true),
                                  child: Text(lang.confirm),
                                ),
                              ],
                            ),
                          );

                          if (confirm == true) {
                            try {
                              final success = BlocProvider.of<AuthBloc>(context)
                                  .add(const AuthEvent.deleteEvent());
                              // if (success) {
                              //   Navigator.of(context)
                              //       .pushReplacementNamed('/login');
                              // } else {
                              //   ScaffoldMessenger.of(context).showSnackBar(
                              //     const SnackBar(
                              //         content: Text('فشل في تسجيل الخروج')),
                              //   );
                              // }
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('خطأ: $e')),
                              );
                            }
                          }
                        },
                        child: Text(
                          lang.deleteAccount,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF70B9BE),
                        minimumSize: const Size.fromHeight(50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () async {
                        final confirm = await showDialog<bool>(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text(lang.confirmLogOut),
                            content: Text(lang.AreUSureLogOut),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.of(context).pop(false),
                                child: Text(lang.cancel),
                              ),
                              TextButton(
                                onPressed: () =>
                                    Navigator.of(context).pop(true),
                                child: Text(lang.confirm),
                              ),
                            ],
                          ),
                        );

                        if (confirm == true) {
                          try {
                            final token = ApiConstances.tokenOrGuest();
                            if (token == 'guest') {
                              Navigator.of(context)
                                  .pushReplacementNamed('/login');
                            } else {
                              final success = BlocProvider.of<AuthBloc>(context)
                                  .add(const AuthEvent.logout());
                            }
                            // if (success) {
                            //   Navigator.of(context)
                            //       .pushReplacementNamed('/login');
                            // } else {
                            //   ScaffoldMessenger.of(context).showSnackBar(
                            //     const SnackBar(
                            //         content: Text('فشل في تسجيل الخروج')),
                            //   );
                            // }
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('خطأ: $e')),
                            );
                          }
                        }
                      },
                      child: Text(
                        lang.logOut,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: Image.asset(
                      'assets/images/init_page.png',
                      width: 189,
                      height: 109,
                      filterQuality: FilterQuality.high,
                    ),
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
