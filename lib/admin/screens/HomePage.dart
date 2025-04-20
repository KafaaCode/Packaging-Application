import 'package:flutter/material.dart';
import 'package:frip_trading/admin/screens/SpecializationsCountries/specializations_countries_screen.dart';
import 'package:frip_trading/admin/screens/categories/categories_page.dart';
import 'package:frip_trading/src/presentation/screens/auth/widgets/option_filter.dart';
import 'package:frip_trading/src/presentation/screens/auth/widgets/search.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'User Name',
                      style: TextStyle(
                        color: Color(0xFF70b9be),
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                    ),
                    Icon(Icons.person, size: 40, color: Color(0xFF70b9be)),
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
                    Expanded(child: Search()),
                    const SizedBox(width: 8),
                    OptionFilter(onTap: () {}),
                  ],
                ),
                const SizedBox(height: 16),

                SizedBox(
                  height: 120,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _dynamicCard(
                        title: 'Categories',
                        subtitle: '3 Category',
                        color: const Color(0xFF70b9be),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const CategoryScreen()),
                          );
                        },
                      ),
                      const SizedBox(width: 12),
                      _dynamicCard(
                        title: 'Specializations and Countries',
                        subtitle: '5 Items',
                        color: const Color(0xFF4caf50),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  const SpecializationsCountriesScreen(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(width: 12),
                      _dynamicCard(
                        title: 'Top Sellers',
                        subtitle: '2 Items',
                        color: const Color(0xfff57c00),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Last Orders',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600)),
                    Text('See All', style: TextStyle(color: Colors.grey)),
                  ],
                ),
                const SizedBox(height: 12),

                // Give fixed height for scrollable content inside SingleChildScrollView
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: ListView.separated(
                    itemCount: 4,
                    separatorBuilder: (_, __) => const SizedBox(height: 10),
                    itemBuilder: (context, index) {
                      return _orderCard(
                        orderId: 'Bp00171734${400 + index}',
                        status: 'Pending',
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _dynamicCard({
    required String title,
    required String subtitle,
    required Color color,
    VoidCallback? onTap, // <-- أضف هذا
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        constraints: const BoxConstraints(minWidth: 140),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 2),
            Text(subtitle, style: const TextStyle(color: Colors.white70)),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  Widget _orderCard({required String orderId, required String status}) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 3)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(orderId,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 4),
          const Text('Wed, 24, Jun, 2024, 8:00AM',
              style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF70b9be),
                  foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                ),
                child: const Text('Details Order'),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xffffe0b2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child:
                    Text(status, style: const TextStyle(color: Colors.orange)),
              )
            ],
          )
        ],
      ),
    );
  }
}
