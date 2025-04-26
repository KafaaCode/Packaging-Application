import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frip_trading/core/localization/generated/l10n.dart';
import 'package:frip_trading/core/localization/language/language_cubit.dart';
import 'package:frip_trading/core/localization/language/language_state.dart';
import 'package:frip_trading/core/routes/router_screens.dart';
import 'package:frip_trading/core/routes/routes_name.dart';
import 'package:frip_trading/src/data/models/models.dart';
import 'package:frip_trading/src/presentation/controllers/auth/auth_bloc.dart';
import 'package:frip_trading/src/presentation/screens/auth/widgets/dropdown_custom.dart';
import 'package:frip_trading/src/presentation/screens/settings/widgets/customAppbar.dart';
import 'package:frip_trading/src/presentation/screens/settings/widgets/settings_dialogs.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    Lang lang = Lang.of(context);
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
                    AppRouter.router.navigateTo(
                      context,
                      RoutesNames.editProfileRoute,
                      rootNavigator: true,
                      transition: TransitionType.inFromLeft,
                      transitionDuration: const Duration(milliseconds: 500),
                    );
                  },
                  child: ListTile(
                    title: Text(lang.editProfile),
                    trailing: const Icon(
                      Icons.chevron_right,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    AppRouter.router.navigateTo(
                      context,
                      RoutesNames.changePasswordRoute,
                      rootNavigator: true,
                      transition: TransitionType.inFromLeft,
                      transitionDuration: const Duration(milliseconds: 500),
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
                    width: 110,
                    child: BlocBuilder<LanguageCubit, LanguageState>(
                      builder: (context, state) {
                        List<SupportedLanguage> langs =
                            LanguageCubit.supportedLanguages;
                        return DropdownCustom<SupportedLanguage>(
                          items: langs,
                          onChanged: (v) {
                            if (v != null) {
                              print("Selected Language: ${v.langCode}");
                              context
                                  .read<LanguageCubit>()
                                  .changeLanguageTo(v.langCode);
                            }
                          },
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 2, horizontal: 2),
                            hintText: lang.selectLanguageHint,
                            labelStyle: Theme.of(context).textTheme.bodyMedium,
                            hintStyle: Theme.of(context).textTheme.bodyMedium,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                          defaultValue: langs.firstWhere(
                            (element) =>
                                element.langCode == state.locale.languageCode,
                          ),
                          // context.read<LanguageCubit>().supportedLanguages[0],
                          svgIcon: 'assets/SVG/Vector_down.svg',
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
                    }),
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
    );
  }
}
