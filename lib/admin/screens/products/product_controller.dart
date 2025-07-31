// product_controller.dart

import 'dart:convert';
import 'package:frip_trading/admin/screens/constants.dart';
import 'package:frip_trading/core/network/api_constances.dart';
import 'package:http/http.dart' as http;
import 'product_model.dart';

class ProductController {

  Future<List<ProductModel>> fetchProductsByCategory(int categoryId) async {
    final token = ApiConstances.getToken();
    final response = await http.get(
      Uri.parse('$apiBaseUrl/products/categories/$categoryId'),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final jsonBody = json.decode(response.body);
      final List productsJson = jsonBody['data'];

      final baseImageUrl = ApiConstances.baseImageUrl;

      final List<ProductModel> products = productsJson.map<ProductModel>((json) {
        final imagePath = json['image'];
        json['image'] = imagePath != null ? '$baseImageUrl$imagePath' : '';
        return ProductModel.fromJson(json);
      }).toList();
      final List productsImages = productsJson.map((product) => product['image']).toList();
      print(productsImages);
      return productsJson.map((json) => ProductModel.fromJson(json)).toList();
    } else if (response.statusCode == 404) {
      throw Exception('لا يوجد منتجات لهذه الفئة');
    }
    else {
      throw Exception('فشل في تحميل المنتجات');
    }
  }
}
