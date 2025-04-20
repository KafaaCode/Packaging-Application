// product_controller.dart

import 'dart:convert';
import 'package:frip_trading/admin/screens/constants.dart';
import 'package:http/http.dart' as http;
import 'product_model.dart';

class ProductController {

  Future<List<ProductModel>> fetchProductsByCategory(int categoryId) async {
    final response = await http.get(
      Uri.parse('$apiBaseUrl/api/products/categories/$categoryId'),
      headers: {
        'Authorization': 'Bearer $authToken',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final jsonBody = json.decode(response.body);
      final List productsJson = jsonBody['data'];
      return productsJson.map((json) => ProductModel.fromJson(json)).toList();
    } else {
      throw Exception('فشل في تحميل المنتجات');
    }
  }
}
