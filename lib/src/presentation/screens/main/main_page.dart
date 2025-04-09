import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frip_trading/src/presentation/screens/main/categories.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: const FilterPage(),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          selectedItemColor: Colors.teal,
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/SVG/home.svg'), label: 'Home'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/SVG/order.svg'), label: 'Cart'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/SVG/cart.svg'),
                label: 'Support'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/SVG/support.svg'),
                label: 'Support'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/SVG/profile.svg'),
                label: 'Profile'),
          ],
        ));
  }
}
