import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frip_trading/core/services/services_locator.dart';
import 'package:frip_trading/src/presentation/controllers/category/category_bloc.dart';
import 'package:frip_trading/src/presentation/controllers/main_bage/main_page_bloc.dart'; // تأكد تستورد البلوك تبعك
import 'package:frip_trading/src/presentation/controllers/myorder/myorder_bloc.dart';
import 'package:frip_trading/src/presentation/screens/main/categories.dart';
import 'package:frip_trading/src/presentation/screens/main/my_order.dart';
import 'package:frip_trading/src/presentation/screens/main/cart.dart';
import 'package:frip_trading/src/presentation/screens/main/supports_page.dart';
import 'package:frip_trading/src/presentation/screens/settings/profile.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    final List<Widget> pages = [
      const FilterPage(), // Home
      MyOrdersPage(), // Order
      const CartDetailsPage(), // Cart
      SupportsPage(),

      ///support
      const Profile(), // Profile
    ];

    return BlocBuilder<MainPageBloc, MainPageState>(
      builder: (context, state) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (_) => sl<CategoriesBloc>()
                  ..add(const CategoriesEvent.getCategories())),
            BlocProvider(
                create: (_) =>
                    sl<MyOrdersBloc>()..add(const MyOrdersEvent.getMyOrders())),
          ],
          child: Scaffold(
            body: pages[state.selectedIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: state.selectedIndex,
              onTap: (index) {
                context
                    .read<MainPageBloc>()
                    .add(MainPageEvent.navigateToTab(index));
              },
              selectedItemColor: theme.primaryColor,
              unselectedItemColor: Colors.grey,
              items: [
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/SVG/home.svg',
                    color: state.selectedIndex == 0
                        ? theme.primaryColor
                        : Colors.grey,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/SVG/order.svg',
                    color: state.selectedIndex == 1
                        ? theme.primaryColor
                        : Colors.grey,
                  ),
                  label: 'Orders',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/SVG/cart.svg',
                    color: state.selectedIndex == 2
                        ? theme.primaryColor
                        : Colors.grey,
                  ),
                  label: 'Cart',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/SVG/support.svg',
                    color: state.selectedIndex == 3
                        ? theme.primaryColor
                        : Colors.grey,
                  ),
                  label: 'Support',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/SVG/profile.svg',
                    color: state.selectedIndex == 4
                        ? theme.primaryColor
                        : Colors.grey,
                  ),
                  label: 'Profile',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
