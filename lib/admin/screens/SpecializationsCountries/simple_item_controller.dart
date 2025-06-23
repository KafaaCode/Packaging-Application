// controllers/simple_item_controller.dart

import 'dart:convert';
import 'package:frip_trading/admin/screens/SpecializationsCountries/simple_item_model.dart';
import 'package:frip_trading/core/network/api_constances.dart';
import 'package:http/http.dart' as http;
import '../constants.dart';

class SimpleItemController {
  final String endpoint;

  SimpleItemController({required this.endpoint});

  Future<List<SimpleItemModel>> fetchItems() async {
    final token = ApiConstances.getToken();
    final response = await http.get(
      Uri.parse('$apiBaseUrl/$endpoint'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body)['data'];
      return data.map((e) => SimpleItemModel.fromJson(e)).toList();
    } else {
      throw Exception('فشل في جلب البيانات');
    }
  }

  Future<void> addItem(String name) async {
    final token = ApiConstances.getToken();
    await http.post(
      Uri.parse('$apiBaseUrl/$endpoint'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({'name': name}),
    );
  }

  Future<void> updateItem(int id, String name) async {
    final token = ApiConstances.getToken();
    await http.put(
      Uri.parse('$apiBaseUrl/$endpoint/$id'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({'name': name}),
    );
  }

  Future<void> deleteItem(int id) async {
    final token = ApiConstances.getToken();
    final url = Uri.parse('$apiBaseUrl/$endpoint/$id');
    final response = await http.delete(
      url,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode != 200 && response.statusCode != 204) {
      throw Exception('فشل في حذف العنصر');
    }
  }
}
