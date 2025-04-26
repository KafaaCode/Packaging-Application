import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frip_trading/core/localization/generated/l10n.dart';
import 'package:frip_trading/core/routes/router_screens.dart';
import 'package:frip_trading/core/routes/routes_name.dart';
import 'package:frip_trading/core/utils/loading_dialog.dart';
import 'package:frip_trading/src/presentation/controllers/auth/auth_bloc.dart';
import 'package:frip_trading/src/presentation/screens/settings/widgets/customAppbar.dart';
import 'package:frip_trading/src/presentation/screens/settings/widgets/custom_text_feild.dart';

class ChangePassword extends StatelessWidget {
  ChangePassword({super.key});

  final TextEditingController currentController = TextEditingController();
  final TextEditingController newController = TextEditingController();
  final TextEditingController contirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Lang lang = Lang.of(context);
    MediaQueryData mediaQuery = MediaQuery.of(context);
    double screenHeight = mediaQuery.size.height;
    double screenWidth = mediaQuery.size.width;

    return Scaffold(
      body: CustomAppbar(
        tilte: lang.changePassword,
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
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: const [
                      BoxShadow(color: Colors.black12, blurRadius: 5)
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          lang.currentPassword,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black54,
                          ),
                        ),
                        const SizedBox(height: 10),
                        CustomTextFeild(
                          controller: currentController,
                          labelText: lang.currentPasswordLabel,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          lang.newPassword,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black54,
                          ),
                        ),
                        const SizedBox(height: 10),
                        CustomTextFeild(
                          controller: newController,
                          labelText: lang.newPasswordLabel,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          lang.confirmPassword,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black54,
                          ),
                        ),
                        const SizedBox(height: 10),
                        CustomTextFeild(
                          controller: contirmController,
                          labelText: lang.confirmPasswordLabel,
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                lang.forgotYourPassword,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: theme.primaryColor,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                lang.reset,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                          child: Center(
                            child: Image.asset(
                              'assets/images/init_page.png',
                              width: 245,
                              height: 142,
                              filterQuality: FilterQuality.high,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
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
                        context.read<AuthBloc>().add(
                              AuthEvent.updatePassword(
                                oldPassword: currentController.text,
                                newPassword: newController.text,
                                confirmPassword: contirmController.text,
                              ),
                            );
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
                        child: Center(
                          child: Text(
                            lang.change,
                            style: const TextStyle(
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
}
