import 'package:flutter/material.dart';
import 'package:frip_trading/admin/screens/OrderDetails/OrderDetailsPage.dart';
import 'package:frip_trading/admin/screens/OrderModel.dart';
import 'package:frip_trading/admin/screens/SpecializationsCountries/specializations_countries_screen.dart';
import 'package:frip_trading/admin/screens/categories/categories_page.dart';

import '../services/order_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();

  List<OrderModel> _orders = [];
  int _currentPage = 1;
  final int _limit = 10;
  bool _isLoading = false;
  bool _hasMore = true;
  String _searchTerm = '';

  @override
  void initState() {
    super.initState();
    _fetchOrders();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent &&
          !_isLoading &&
          _hasMore) {
        _fetchOrders();
      }
    });
  }

  Future<void> _fetchOrders({bool refresh = false}) async {
    if (refresh) {
      setState(() {
        _orders.clear();
        _currentPage = 1;
        _hasMore = true;
      });
    }

    if (!_hasMore) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final newOrders = await fetchOrders(
        page: _currentPage,
        limit: _limit,
        searchTerm: _searchTerm,
      );

      setState(() {
        _currentPage++;
        _orders.addAll(newOrders);
        if (newOrders.length < _limit) {
          _hasMore = false;
        }
      });

      if (_orders.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('لا توجد طلبات')),
        );
      }
    } catch (e) {
      debugPrint('❌ خطأ أثناء تحميل الطلبات: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('حدث خطأ أثناء تحميل الطلبات: $e')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  Widget _orderCard({
    required String orderId,
    required String createdAt,
    required String user_name,
    required String status,
    required int id,
  }) {
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
          Text(createdAt, style: const TextStyle(color: Colors.grey)),
          Text(user_name, style: const TextStyle(color: Colors.grey)),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => OrderDetailsPage(orderId: id)),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF70b9be),
                  foregroundColor: Colors.white,
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
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _dynamicCard({
    required String title,
    required String subtitle,
    required Color color,
    VoidCallback? onTap,
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

  void _onSearchChanged() {
    setState(() {
      _searchTerm = _searchController.text.trim();
    });
    _fetchOrders(refresh: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                    style: TextStyle(color: Color(0xFF70b9be), fontSize: 18),
                  ),
                ),
                const SizedBox(height: 16),
                // 🔍 حقل البحث + زر التحديث
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          hintText: 'ابحث برقم الشكوى أو العنوان',
                          hintStyle:
                              const TextStyle(fontSize: 12), // ✅ تصغير النص
                          prefixIcon: const Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8),
                        ),
                        onChanged: (_) => _onSearchChanged(),
                      ),
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      onPressed: () {
                        _searchController.clear();
                        _searchTerm = '';
                        _fetchOrders();
                      },
                      icon: const Icon(Icons.refresh, color: Colors.blue),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // 📦 البطاقات العلوية
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
                                    const SpecializationsCountriesScreen()),
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

                // 🧾 قائمة الطلبات
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: _orders.length + (_hasMore ? 1 : 0),
                  separatorBuilder: (_, __) => const SizedBox(height: 10),
                  itemBuilder: (context, index) {
                    if (index < _orders.length) {
                      final order = _orders[index];
                      return _orderCard(
                        orderId: order.serialNumber!,
                        createdAt: order.createdAt!,
                        status: order.status!,
                        id: order.id,
                        user_name: order.user_name!,
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
