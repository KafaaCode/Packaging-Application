import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frip_trading/admin/screens/HomePage.dart';
import 'package:frip_trading/admin/screens/Settings/settings_page.dart';
import 'package:frip_trading/admin/screens/Supports/SupportsPage.dart';
import 'package:frip_trading/admin/screens/Users/UsersPage.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(), // Dashboard
    UsersPage(), // Manage Users
    SupportsPage(), // Support
    SettingsPage(), // استبدل Placeholder ب SettingsPage هنا
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
            icon: SvgPicture.asset(
              'assets/SVG/user.svg',
              color: _selectedIndex == 0 ? theme.primaryColor : Colors.grey,
            ),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/SVG/users.svg',
              color: _selectedIndex == 1 ? theme.primaryColor : Colors.grey,
            ),
            label: 'Users',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/SVG/support.svg',
              color: _selectedIndex == 3 ? theme.primaryColor : Colors.grey,
            ),
            label: 'Support',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/SVG/profile.svg',
              color: _selectedIndex == 4 ? theme.primaryColor : Colors.grey,
            ),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}