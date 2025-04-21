import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frip_trading/src/presentation/screens/main/categories.dart';
import 'package:frip_trading/src/presentation/screens/main/my_order.dart';

import 'cart.dart';
// صفحة الأوردر
// باقي الصفحات...

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  // الصفحات
  final List<Widget> _pages = [
    const FilterPage(), // Home
    MyOrdersPage(), // Order
    const CartDetailsPage(), // Cart (بدّلها بصفحتك)
    const Placeholder(), // Support
    const Placeholder(), // Profile
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: theme.primaryColor,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/SVG/home.svg',
                color: _selectedIndex == 0 ? theme.primaryColor : Colors.grey),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/SVG/order.svg',
                color: _selectedIndex == 1 ? theme.primaryColor : Colors.grey),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/SVG/cart.svg',
                color: _selectedIndex == 2 ? theme.primaryColor : Colors.grey),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/SVG/support.svg',
                color: _selectedIndex == 3 ? theme.primaryColor : Colors.grey),
            label: 'Support',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/SVG/profile.svg',
                color: _selectedIndex == 4 ? theme.primaryColor : Colors.grey),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
