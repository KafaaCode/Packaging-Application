import 'package:flutter/material.dart';
import 'package:frip_trading/core/network/api_constances.dart';
import 'package:frip_trading/src/data/data_source/auth_remote_data_source.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class OrderDetailsPage extends StatefulWidget {
  final int orderId;
  const OrderDetailsPage({super.key, required this.orderId});

  @override
  State<OrderDetailsPage> createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  Map<String, dynamic>? orderData;
  bool isLoading = true;
  String selectedStatus = 'Pending';
  final TextEditingController replyController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchOrderDetails();
  }

// استدعِ AuthRemoteDataSource (مثلاً عبر SL أو مباشرة)
  final AuthRemoteDataSource authRemoteDataSource = AuthRemoteDataSource();

  Future<void> fetchOrderDetails() async {
    try {
      print(widget.orderId);
      final url = ApiConstances.getOrderDetailsUrl(orderId: widget.orderId);
      final token = ApiConstances.getToken();
      print(token);
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
      );

      print(url);
      print(response.body);

      if (response.statusCode == 401) {
        // استدعاء دالة تسجيل الخروج من AuthRemoteDataSource
        await authRemoteDataSource.logout();
        // إعادة توجيه المستخدم إلى شاشة تسجيل الدخول
        Navigator.of(context).pushReplacementNamed('/login');
        return;
      }

      final data = json.decode(response.body);

      if (data['message'] == 'Unauthenticated.') {
        await authRemoteDataSource.logout();
        Navigator.of(context).pushReplacementNamed('/login');
        return;
      }

      if (data['status'] == 'success') {
        setState(() {
          orderData = data['data'];
          selectedStatus = data['data']['status'] ?? 'Pending';
          isLoading = false;
        });
      } else {
        throw Exception('فشل في تحميل التفاصيل');
      }
    } catch (e) {
      setState(() => isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('خطأ أثناء جلب البيانات: $e')),
      );
    }
  }

  Future<void> updateOrderStatus() async {
    try {
      final url = ApiConstances.updateOrderUrl(orderId: widget.orderId);
      print(url);
      final token = ApiConstances.getToken();

      final response = await http.put(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'status': selectedStatus,
          'reply_message': replyController.text.trim(),
        }),
      );

      print(response.body);

      final data = json.decode(response.body);
      if (response.statusCode == 200 || data['status'] == 'success') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('تم تحديث الحالة بنجاح')),
        );
        fetchOrderDetails(); // إعادة تحميل التفاصيل
      } else {
        throw Exception('فشل في التحديث');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('حدث خطأ: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('تفاصيل الطلب'),
          backgroundColor: const Color(0xFF70b9be),
        ),
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : orderData == null
                ? const Center(child: Text('لا توجد بيانات'))
                : Padding(
                    padding: const EdgeInsets.all(16),
                    child: ListView(
                      children: [
                        _infoTile('رقم الطلب:',
                            orderData!['serial_number'].toString()),
                        _infoTile('الحالة:', orderData!['status'].toString()),
                        _infoTile('الوقت المتوقع للتوصيل:',
                            orderData!['delivery_time'].toString()),
                        _infoTile(
                            'الرسالة:', orderData!['reply_message'].toString()),
                        _infoTile('السعر الإجمالي:',
                            '${orderData!['total_price']} \$'),
                        _infoTile('تاريخ الإنشاء:',
                            orderData!['created_at'].toString()),
                        _infoTile('اسم المستخدم:',
                            orderData!['user_name'].toString()),
                        _infoTile('البريد الإلكتروني:',
                            orderData!['user_email'].toString()),
                        _infoTile('رقم الهاتف:',
                            orderData!['user']?['phone'] ?? 'غير متوفر'),
                        const SizedBox(height: 20),
                        const Text('المنتجات',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 10),
                        ...(orderData!['products'] as List).map((product) {
                          final imageUrl = product['image'] ?? '';
                          return Card(
                            margin: const EdgeInsets.symmetric(vertical: 6),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            child: ListTile(
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: imageUrl.isNotEmpty
                                    ? Image.network(
                                        imageUrl,
                                        width: 50,
                                        height: 50,
                                        fit: BoxFit.cover,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return Image.asset(
                                            'assets/images/logo.png', // صورة بديلة
                                            width: 50,
                                            height: 50,
                                            fit: BoxFit.cover,
                                          );
                                        },
                                      )
                                    : Image.asset(
                                        'assets/images/logo.png',
                                        width: 50,
                                        height: 50,
                                        fit: BoxFit.cover,
                                      ),
                              ),
                              title: Text(product['name']),
                              subtitle: Text(
                                  'السعر: ${product['price']} \$ × الكمية: ${product['quantity']}'),
                            ),
                          );
                        }),
                        const SizedBox(height: 30),
                        const Divider(),
                        const Text('تحديث حالة الطلب',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 10),
                        DropdownButtonFormField<String>(
                          value: selectedStatus,
                          decoration:
                              const InputDecoration(labelText: 'الحالة'),
                          items: const [
                            DropdownMenuItem(
                                value: 'Pending', child: Text('قيد الانتظار')),
                            DropdownMenuItem(
                                value: 'Canceled', child: Text('ملغي')),
                            DropdownMenuItem(
                                value: 'Partial Delivery',
                                child: Text('توصيل جزئي')),
                            DropdownMenuItem(
                                value: 'Completed', child: Text('مكتمل')),
                          ],
                          onChanged: (value) {
                            setState(() {
                              selectedStatus = value!;
                            });
                          },
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: replyController,
                          decoration: const InputDecoration(
                            labelText: 'رسالة الرد (اختياري)',
                            border: OutlineInputBorder(),
                          ),
                          maxLines: 3,
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton.icon(
                          onPressed: updateOrderStatus,
                          icon: const Icon(
                            Icons.save,
                            color: Colors.white,
                          ),
                          label: const Text(
                            'تحديث الحالة',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF70b9be),
                          ),
                        )
                      ],
                    ),
                  ),
      ),
    );
  }

  Widget _infoTile(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$label ', style: const TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}
