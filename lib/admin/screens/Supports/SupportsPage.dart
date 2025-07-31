import 'package:flutter/material.dart';
import 'package:frip_trading/admin/screens/Supports/SupportModel.dart';
import 'package:frip_trading/admin/screens/Supports/SupportService.dart';

class SupportsPage extends StatefulWidget {
  const SupportsPage({super.key});

  @override
  State<SupportsPage> createState() => _SupportsPageState();
}

class _SupportsPageState extends State<SupportsPage> {
  late Future<List<SupportModel>> futureSupports;

  @override
  void initState() {
    super.initState();
    futureSupports = SupportService.fetchSupports();
  }

  void showSupportDetails(SupportModel support) {
    showDialog(
      context: context,
      builder: (context) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: AlertDialog(
            title: Text(support.title),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("المرسل: ${support.senderName}"),
                Text("البريد: ${support.senderEmail}"),
                const SizedBox(height: 10),
                Text("الرسالة:\n${support.message}"),
                const SizedBox(height: 10),
                Text("التاريخ: ${support.createdAt.split('T')[0]}"),
              ],
            ),
            actions: [
              TextButton(
                child: const Text("إغلاق"),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl, // 👉 الاتجاه من اليمين إلى اليسار
      child: Scaffold(
        body: SafeArea(
          child: Container(
            color: const Color(0xFFF6F8FA),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ✅ رأس الصفحة
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'مرحبًا بك',
                      style: TextStyle(
                        color: Color(0xFF70b9be),
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                    ),
                    Icon(Icons.person, size: 40, color: Color(0xFF70b9be)),
                  ],
                ),
                const SizedBox(height: 8),
                const Text(
                  'إليك قائمة الشكاوي',
                  style: TextStyle(color: Color(0xFF70b9be), fontSize: 16),
                ),
                const SizedBox(height: 20),

                // ✅ حقل البحث وزر التحديث
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        style: const TextStyle(fontSize: 14),
                        decoration: InputDecoration(
                          hintText: 'ابحث برقم الشكوى أو العنوان',
                          hintStyle: const TextStyle(fontSize: 12), // ✅ تصغير النص
                          prefixIcon: const Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          futureSupports = SupportService.fetchSupports();
                        });
                      },
                      icon: const Icon(Icons.refresh, color: Colors.blue),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // ✅ عرض الشكاوي
                Expanded(
                  child: FutureBuilder<List<SupportModel>>(
                    future: futureSupports,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text("حدث خطأ: ${snapshot.error}"));
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Center(child: Text("لا توجد شكاوي"));
                      }

                      final supports = snapshot.data!;
                      return ListView.builder(
                        itemCount: supports.length,
                        itemBuilder: (context, index) {
                          final support = supports[index];
                          return Card(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            elevation: 3,
                            margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    support.title,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Color(0xFF70b9be),
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text("المرسل: ${support.senderName}"),
                                  Text("البريد: ${support.senderEmail}"),
                                  const SizedBox(height: 6),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color(0xFF70b9be),
                                        foregroundColor: Colors.white,
                                      ),
                                      onPressed: () => showSupportDetails(support),
                                      child: const Text("عرض التفاصيل"),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
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
}
