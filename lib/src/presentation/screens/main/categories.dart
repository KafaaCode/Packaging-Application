import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frip_trading/core/localization/generated/l10n.dart';
import 'package:frip_trading/core/routes/router_screens.dart';
import 'package:frip_trading/core/routes/routes_name.dart';
import 'package:frip_trading/core/services/services_locator.dart';

import 'package:frip_trading/src/presentation/controllers/auth/auth_bloc.dart';

import 'package:frip_trading/src/presentation/controllers/category/category_bloc.dart';
import 'package:frip_trading/src/presentation/screens/auth/widgets/cardproductandCatogry.dart';
import 'package:frip_trading/src/presentation/screens/auth/widgets/option_filter.dart';
import 'package:frip_trading/src/presentation/screens/auth/widgets/search.dart';

class FilterPage extends StatelessWidget {
  const FilterPage({super.key});

  @override
  Widget build(BuildContext context) {
    Lang lang = Lang.of(context);
    return BlocProvider(
      create: (context) =>
          CategoriesBloc(sl())..add(const CategoriesEvent.getCategories()),
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 45,
            right: 16,
            left: 16,
            bottom: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'User Name',
                    style: TextStyle(
                        color: Color(0xFF70b9be),
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                  BlocListener<AuthBloc, AuthState>(
                    listener: (context, state) {
                      state.mapOrNull(initial: (initial) {
                        AppRouter.router.navigateTo(
                            context, RoutesNames.loginRoute,
                            clearStack: true,
                            transition: TransitionType.inFromRight,
                            transitionDuration:
                                const Duration(milliseconds: 200));
                      });
                    },
                    child: InkWell(
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
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Center(
                child: Text(
                  lang.welcomeMessage,
                  style: const TextStyle(
                    color: Color(0xFF70b9be),
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Search(),
                  ),
                  const SizedBox(width: 8),
                  OptionFilter(
                    onTap: () {
                      print(1);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  lang.productCategoriesTitle,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: BlocBuilder<CategoriesBloc, CategoriesState>(
                  builder: (context, state) {
                    if (state.loading) {
                      return const Center(
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.white,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Color(0xFF70b9be)),
                        ),
                      );
                    } else if (state.error) {
                      return Center(
                        child: Text(
                          lang.cateogriesNotFoundMessage,
                          style: const TextStyle(
                              color: Color(0xFF70b9be),
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      );
                    }
                    return SingleChildScrollView(
                        child: Center(
                            child: Wrap(
                                spacing: 10,
                                runSpacing: 5,
                                children:
                                    List.generate(state.categories.length, (i) {
                                  final width =
                                      MediaQuery.of(context).size.width;
                                  final itemWidth = width > 971
                                      ? width * 0.31
                                      : width > 800
                                          ? width * 0.47
                                          : width > 621
                                              ? width * 0.30
                                              : width * 0.43;

                                  return InkWell(
                                    onTap: () {
                                      /* 
                                    AppRouter.router.navigateTo(context,
                                        RoutesNames.teacherDetailsRoute,
                                        routeSettings: RouteSettings(
                                            arguments: state.teachers[i])); */
                                      AppRouter.router.navigateTo(
                                          context, RoutesNames.products,
                                          transition:
                                              TransitionType.inFromRight,
                                          routeSettings: RouteSettings(
                                              arguments:
                                                  state.categories[i].id),
                                          transitionDuration: const Duration(
                                              milliseconds: 200));
                                    },
                                    borderRadius: BorderRadius.circular(12),
                                    child: SizedBox(
                                        width: itemWidth,
                                        child: MainCard(
                                          name: state.categories[i].name
                                              .toString(),
                                          imageUrl:
                                              'assets/images/Rectangle569.png',
                                        )),
                                  );
                                }))));
                    /*  MainCard(
                      name: state.categories[0].name,
                      imageUrl: 'assets/images/Rectangle569.png',
                      onTap: () {
                        AppRouter.router.navigateTo(
                            context, RoutesNames.products,
                            transition: TransitionType.inFromRight,
                            transitionDuration:
                                const Duration(milliseconds: 200));
                      },
                    ); */
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
