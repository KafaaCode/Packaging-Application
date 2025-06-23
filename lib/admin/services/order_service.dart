import 'dart:convert';
import 'package:frip_trading/admin/screens/OrderModel.dart';
import 'package:frip_trading/admin/screens/constants.dart';
import 'package:frip_trading/core/network/api_constances.dart';
import 'package:http/http.dart' as http;

Future<List<OrderModel>> fetchOrders({required int page, required int limit, required String searchTerm}) async {
  final token = ApiConstances.getToken();
  final response = await http.get(Uri.parse(ApiConstances.ordersUrl),
    headers: {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    },
  );
  print(response.body);
  if (response.statusCode == 200) {
    final body = jsonDecode(response.body);
    final List data = body['data'];
    return data.map((order) => OrderModel.fromJson(order)).toList();
  } else {
    throw Exception('Failed to load orders');
  }
}
