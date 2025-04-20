import 'dart:convert';
import 'package:frip_trading/admin/screens/constants.dart';
import 'package:http/http.dart' as http;
import 'category_model.dart';

class CategoryController {

  Future<List<CategoryModel>> fetchCategories() async {
    final url = Uri.parse('$apiBaseUrl/api/admin/categories');
    final response = await http.get(url, headers: {
      'Authorization': 'Bearer $authToken',
      'Accept': 'application/json',
    });

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List data = jsonData['data'];
      return data.map((item) => CategoryModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }
}
