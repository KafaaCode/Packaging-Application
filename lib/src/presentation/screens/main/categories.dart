import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frip_trading/core/routes/router_screens.dart';
import 'package:frip_trading/core/routes/routes_name.dart';
import 'package:frip_trading/core/services/services_locator.dart';
import 'package:frip_trading/src/presentation/controllers/category/category_bloc.dart';
import 'package:frip_trading/src/presentation/screens/auth/widgets/cardproductandCatogry.dart';
import 'package:frip_trading/src/presentation/screens/auth/widgets/option_filter.dart';
import 'package:frip_trading/src/presentation/screens/auth/widgets/search.dart';

class FilterPage extends StatelessWidget {
  const FilterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoriesBloc(sl())..add(const CategoriesEvent.getCategories()),
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16),
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
                  SvgPicture.asset(
                    'assets/images/Group940.svg',
                    height: 50,
                    errorBuilder: (context, error, stackTrace) {
                      return const SizedBox(width: 25, height: 50);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Center(
                child: Text(
                  'Welcome to Frip Trading',
                  style: TextStyle(
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
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Product categories',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: BlocBuilder<CategoriesBloc,CategoriesState>(
                  builder: (context, state) {
                    return SingleChildScrollView(
                child: Center(
                  child: Wrap(
                    spacing: 10,
                    runSpacing: 5,
                    children: List.generate(10, (i) {
                      final width = MediaQuery.of(context).size.width;
                      final itemWidth = width > 971
                          ? width * 0.31
                          : width > 800
                              ? width * 0.47
                              : width > 621
                                  ? width * 0.30
                                  : width * 0.43;

                      return InkWell(
                        onTap: () {
                        AppRouter.router.navigateTo(
                            context, RoutesNames.products,
                            transition: TransitionType.inFromRight,
                            transitionDuration:
                                const Duration(milliseconds: 500));
                      },
                        borderRadius: BorderRadius.circular(12),
                        child: SizedBox(
                          width: itemWidth,
                          child: MainCard(
                      name: 'catogris name',
                      imageUrl: 'assets/images/Rectangle569.png',
                
                    )
                        ),
                      );
                    }),
                  ),
                ),
              );
                    /*  MainCard(
                      name: state.categories[0].name,
                      imageUrl: 'assets/images/Rectangle569.png',
                      onTap: () {
                        AppRouter.router.navigateTo(
                            context, RoutesNames.products,
                            transition: TransitionType.inFromRight,
                            transitionDuration:
                                const Duration(milliseconds: 500));
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
