import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frip_trading/src/presentation/screens/main/categories.dart';
import 'package:frip_trading/src/presentation/screens/main/my_order.dart';
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
    FilterPage(),        // Home
    MyOrdersPage(),        // Order
    Placeholder(),       // Cart (بدّلها بصفحتك)
    Placeholder(),       // Support
    Placeholder(),       // Profile
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Color(0xFF70b9be),
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/SVG/home.svg', color: _selectedIndex == 0 ? Color(0xFF70b9be) : Colors.grey),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/SVG/order.svg', color: _selectedIndex == 1 ? Color(0xFF70b9be) : Colors.grey),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/SVG/cart.svg', color: _selectedIndex == 2 ? Color(0xFF70b9be): Colors.grey),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/SVG/support.svg', color: _selectedIndex == 3 ? Color(0xFF70b9be) : Colors.grey),
            label: 'Support',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/SVG/profile.svg', color: _selectedIndex == 4 ? Color(0xFF70b9be) : Colors.grey),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
