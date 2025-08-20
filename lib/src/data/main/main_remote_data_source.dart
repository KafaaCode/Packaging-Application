import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:frip_trading/admin/screens/categories/category_model.dart';
import 'package:frip_trading/admin/screens/constants.dart';
import 'package:frip_trading/admin/screens/products/product_model.dart';
import 'package:http/http.dart' as http;

import 'package:frip_trading/core/network/api_call_handler.dart';
import 'package:frip_trading/core/network/api_constances.dart';
import 'package:frip_trading/core/services/services_locator.dart';
import 'package:frip_trading/src/data/models/models.dart';

abstract class BaseMainRemoteDataSource {
  Future<List<CategoryModel>> getCategories();
  Future<List<MyOrder>> getmyOrders();
  Future<List<Product>> getProducts({required int categoryId});
  Future<void> sendOrder(Map<String, dynamic> orderData);
  Future<void> sendSupport(
      {required String title,
      required String message,
      required String senderName,
      required String senderEmail});
}

class MainRemoteDataSource extends BaseMainRemoteDataSource {
  final Dio _dio = Dio();

  MainRemoteDataSource();

  @override
  Future<List<CategoryModel>> getCategories() async {
    final url = Uri.parse('$apiBaseUrl/admin/categories');
    final token = ApiConstances.getToken();
    print(url);
    final response = await http.get(url, headers: {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    });
    print(response.body);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List data = jsonData['data'];
      return data.map((item) => CategoryModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load categories');
    }

    // return sl.get<ApiCallHandler>().handler(
    //       apiCall: () => _dio.get(
    //         ApiConstances.getcategoriesUrl,
    //         options: Options(
    //           headers: ApiConstances.headers(
    //             isToken: true,
    //             token: ApiConstances.getToken(),
    //           ),
    //         ),
    //       ),
    //       responseHandler: (response) {
    //         final List<dynamic> categoryList = response.data['data'];
    //         return categoryList
    //             .map((category) =>
    //                 Category.fromJson(category as Map<String, dynamic>))
    //             .toList();
    //       },
    //     );
  }

  @override
  Future<List<Product>> getProducts({required int categoryId}) async {
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

      final List<Product> products = productsJson.map<Product>((json) {
        final imagePath = json['image'];
        json['image'] = imagePath != null ? '$baseImageUrl$imagePath' : '';
        return Product.fromJson(json);
      }).toList();
      final List productsImages =
          productsJson.map((product) => product['image']).toList();
      print(productsImages);
      return productsJson.map((json) => Product.fromJson(json)).toList();
    } else if (response.statusCode == 404) {
      throw Exception('لا يوجد منتجات لهذه الفئة');
    } else {
      throw Exception('فشل في تحميل المنتجات');
    }
    // return sl.get<ApiCallHandler>().handler(
    //       apiCall: () => _dio.get(
    //         ApiConstances.getproductsUrl(categoryId: categoryId),
    //         options: Options(
    //           headers: ApiConstances.headers(
    //             isToken: true,
    //             token: ApiConstances.getToken(),
    //           ),
    //         ),
    //       ),
    //       responseHandler: (response) {
    //         final List products = response.data['data'] ?? [];

    //         return products
    //             .map((product) =>
    //                 Product.fromJson(product as Map<String, dynamic>))
    //             .toList();
    //       },
    //     );
  }

  @override
  Future<List<MyOrder>> getmyOrders() async {
    return sl.get<ApiCallHandler>().handler(
          apiCall: () => _dio.get(
            ApiConstances.getordersUrl,
            options: Options(
              headers: ApiConstances.headers(
                isToken: true,
                token: ApiConstances.getToken(),
              ),
            ),
          ),
          responseHandler: (response) {
            final List<dynamic> myorderList = response.data['data'];
            return myorderList
                .map((myorder) =>
                    MyOrder.fromJson(myorder as Map<String, dynamic>))
                .toList();
          },
        );
  }

  @override
  Future<void> sendSupport(
      {required String title,
      required String message,
      required String senderName,
      required String senderEmail}) {
    return sl.get<ApiCallHandler>().handler(
          apiCall: () => _dio.post(
            ApiConstances.sendSupportUrl,
            data: {
              'title': title,
              'message': message,
              'sender_name': senderName,
              'sender_email': senderEmail,
            },
            options: Options(
              headers: ApiConstances.headers(
                isToken: true,
                token: ApiConstances.getToken(),
              ),
            ),
          ),
          responseHandler: (response) {
            return;
          },
        );
  }

  @override
  Future<void> sendOrder(Map<String, dynamic> orderData) {
    return sl.get<ApiCallHandler>().handler(
          apiCall: () => _dio.post(
            ApiConstances.addOrdertUrl,
            data: orderData,
            options: Options(
              headers: ApiConstances.headers(
                isToken: true,
                token: ApiConstances.getToken(),
              ),
            ),
          ),
          responseHandler: (response) {
            return;
          },
        );
  }
}
