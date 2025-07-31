import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frip_trading/core/services/services_locator.dart';
import 'package:frip_trading/core/utils/loading_dialog.dart';
import 'package:frip_trading/src/data/models/models.dart';
import 'package:frip_trading/src/presentation/controllers/auth/auth_bloc.dart';
import 'package:frip_trading/src/presentation/controllers/main_bage/main_page_bloc.dart';

import 'package:frip_trading/src/presentation/widgets/button_costum.dart';

class SupportsPage extends StatelessWidget {
  SupportsPage({super.key});

  TextEditingController titleController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: Container(
          padding: const EdgeInsets.fromLTRB(17, 35, 17, 0),
          color: Theme.of(context).appBarTheme.backgroundColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'technical support',
                style: theme.textTheme.titleLarge?.copyWith(
                  color: theme.primaryColor,
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
              InkWell(
                onTap: () {
                  // context.read<AuthBloc>().add(const AuthEvent.logout());
                },
                child: SvgPicture.asset(
                  'assets/images/Group940.svg',
                  height: 50,
                  errorBuilder: (context, error, stackTrace) {
                    return const SizedBox(width: 25, height: 50);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 10),
              Center(
                child: Text(
                  'Send an inquiry or complaint',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                ),
              ),
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //label text
                      const SizedBox(height: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Message title',
                            textAlign: TextAlign.start,
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: titleController,
                            decoration: InputDecoration(
                              labelText: 'Enter Message title..',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a message title';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Content of the message or complaint',
                            textAlign: TextAlign.start,
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            maxLines: 10,
                            minLines: 5,
                            controller: messageController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              labelText:
                                  'Content of the message or complaint...',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter the message content';
                              }
                              return null;
                            },
                          ),
                          // TextFieldAuth(
                          //   controller: messageController,
                          //   labelText: 'Content of the message or complaint...',
                          //   maxLines: 10,
                          //   minLines: 5,
                          // ),
                        ],
                      ),
                      const SizedBox(height: 25),
                      Center(
                        child: BlocConsumer<MainPageBloc, MainPageState>(
                          listener: (context, state) {
                            if (state.isLoading) {
                              showLoadingDialog(context);
                            } else if (state.successMessage != null) {
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(state.successMessage!,
                                      style:
                                          theme.textTheme.bodyLarge?.copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: theme.primaryColor,
                                      )),
                                  backgroundColor: Colors.white38,
                                ),
                              );
                              titleController.clear();
                              messageController.clear();
                            } else if (state.errorMessage != null) {
                              Navigator.pop(context);
                              SnackBar(
                                content: Text(state.successMessage!,
                                    style: theme.textTheme.bodyLarge?.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: theme.primaryColor,
                                    )),
                                backgroundColor: Colors.white38,
                              );
                            }
                          },
                          builder: (context, state) {
                            return ButtonCostum(
                              text: 'Send',
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  User? user = sl<AuthBloc>().state.mapOrNull(
                                        create: (v) => v.user,
                                      );
                                  context.read<MainPageBloc>().add(
                                        MainPageEvent.sendSupport(
                                          senderEmail: user?.email ?? 'none',
                                          senderName: user?.name ?? 'none',
                                          title: titleController.text,
                                          message: messageController.text,
                                        ),
                                      );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Please fill both message title and content.',
                                        style:
                                            theme.textTheme.bodyLarge?.copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                      ),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                }
                              },
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'or',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                      const SizedBox(height: 10),
                      // const SizedBox(height: 10),
                      Text(
                        'Contact us via social media',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: theme.primaryColor,
                            ),
                      ),
                      const SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/SVG/whatsapp.svg',
                                  height: 21,
                                  errorBuilder: (context, error, stackTrace) {
                                    return const SizedBox(
                                        width: 25, height: 50);
                                  },
                                ),
                                const SizedBox(width: 10),
                                Text('0123 446 789',
                                    style: theme.textTheme.bodyLarge?.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: theme.primaryColor,
                                    )),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/SVG/telegram.svg',
                                  height: 21,
                                  errorBuilder: (context, error, stackTrace) {
                                    return const SizedBox(
                                        width: 25, height: 50);
                                  },
                                ),
                                const SizedBox(width: 35),
                                Text('friptrading',
                                    style: theme.textTheme.bodyLarge?.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: theme.primaryColor,
                                    )),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/SVG/facebook.svg',
                                  height: 21,
                                  errorBuilder: (context, error, stackTrace) {
                                    return const SizedBox(
                                        width: 25, height: 50);
                                  },
                                ),
                                const SizedBox(width: 35),
                                Text('friptrading',
                                    style: theme.textTheme.bodyLarge?.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: theme.primaryColor,
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Image.asset(
                        'assets/images/init_page.png',
                        width: 240,
                        height: 152,
                        filterQuality: FilterQuality.high,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
