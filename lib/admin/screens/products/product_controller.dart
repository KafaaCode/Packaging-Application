// product_controller.dart

import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
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

      final List<ProductModel> products =
          productsJson.map<ProductModel>((json) {
        final imagePath = json['image'];
        json['image'] = imagePath != null ? '$baseImageUrl$imagePath' : '';
        return ProductModel.fromJson(json);
      }).toList();
      final List productsImages =
          productsJson.map((product) => product['image']).toList();
      print(productsImages);
      return productsJson.map((json) => ProductModel.fromJson(json)).toList();
    } else if (response.statusCode == 404) {
      throw Exception('لا يوجد منتجات لهذه الفئة');
    } else {
      throw Exception('فشل في تحميل المنتجات');
    }
  }

  Future<bool> deleteProduct({required int produtId}) async {
    final token = ApiConstances.getToken();
    final url = Uri.parse('$apiBaseUrl/products/$produtId');
    final response = await http.delete(url, headers: {
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  // في product_controller.dart

  // في ProductController.dart

  Future<bool> editProduct(
      {required int productId,
      String? name,
      String? description,
      String? serialNumber,
      int? requestNumber,
      String? price,
      File? imageFile // 💡 إضافة بارامتر لملف الصورة
      }) async {
    final token = ApiConstances.getToken();
    final url = '$apiBaseUrl/products/$productId';
    final Map<String, dynamic> data = {};
    if (name!.isNotEmpty) data['name'] = name;
    data['_method'] = 'PUT';
    if (description!.isNotEmpty) data['description'] = description;
    if (serialNumber!.isNotEmpty) data['serial_number'] = serialNumber;
    if (requestNumber != null) data['request_number'] = requestNumber;
    if (price!.isNotEmpty) data['price'] = price;
    if (imageFile != null)
      data['image'] = await MultipartFile.fromFile(imageFile.path);
    final formData = FormData.fromMap(data);
    final response = await Dio().post(url,
        data: formData,
        options: Options(headers: {
          'Authorization': 'Bearer $token',
        }));
    print(response.data);
    return response.data;
    // 1. إنشاء خريطة البيانات (Map) لإرسالها
    // var request = http.MultipartRequest(
    //   'PUT',
    //   Uri.parse('$apiBaseUrl/categories'),
    // );

    // request.headers['Authorization'] = 'Bearer $token';
    // if (name!.isNotEmpty) request.fields['name'] = name;
    // if (price!.isNotEmpty) request.fields['price'] = price;
    // if (description!.isNotEmpty) request.fields['description'] = description;
    // if (requestNumber != null) {
    //   request.fields['request_number'] = requestNumber.toString();
    // }
    // if (serialNumber!.isNotEmpty) {
    //   request.fields['serial_number'] = serialNumber;
    // }

    // if (imageFile != null) {
    //   request.files
    //       .add(await http.MultipartFile.fromPath('image', imageFile.path));
    // }

    // var response = await request.send();

    // setState(() => _isLoading = false);
    // print(response.statusCode);
    // print(request.fields);
    // print(response);

    // if (response.statusCode == 200 || response.statusCode == 201) {
    //   Navigator.pop(context, true);
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     const SnackBar(content: Text('تمت إضافة الفئة بنجاح')),
    //   );
    // } else {
    //   final resBody = await response.stream.bytesToString();
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(content: Text('فشل الإضافة: $resBody')),
    //   );
    // }
  }
}
